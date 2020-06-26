package com.javatest.controller;

import com.javatest.domain.*;
import com.javatest.service.AnswerService;
import com.javatest.service.ProblemService;
import com.javatest.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.*;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class ProblemController {

    @Autowired
    ProblemService problemService;

    @Autowired
    RecordService recordService;

    @Autowired
    AnswerService answerService;

    @Autowired
    HttpServletRequest request;

    @RequestMapping("/problemList")
    public String problemList(Model model) {
        model.addAttribute("problemItems",problemService.selectAll());
        Object attribute = request.getSession().getAttribute("flag");//判断用户类型
        int flag;
        if (attribute!=null) {
            flag = (int)attribute;
            if (flag==2)
                return "adminProblem";
        }
        return "problem";
    }

    @ResponseBody
    @RequestMapping("/api/problemList")
    public List<ProblemRecord> apiProblemList() {
        return problemService.selectAll();
    }

    @RequestMapping("/problemInfo")
    public String problemPage(@RequestParam(value = "problemId",defaultValue = "1")Integer problemId,Model model) {
        Problem problem = problemService.selectProblemById(problemId);
        model.addAttribute("problem",problem);
        return "/code";
    }

    @ResponseBody
    @RequestMapping("/api/problemInfo")
    public Problem apiProblemPage(@RequestParam(value = "problemId",defaultValue = "1")Integer problemId) {
        Problem problem = problemService.selectProblemById(problemId);
        return problem;
    }

    @ResponseBody
    @RequestMapping("/submitCode")
    public Msg submitCodeGet(@RequestParam("code")String code,@RequestParam("problemId")Integer problemId) {
        String username = (String) request.getSession().getAttribute("username");
        if (username == null) { // 未登录
            return Msg.error().add("status", "请登录后进行相关操作！");
        }
        return submitCode(username, code, problemId);
    }

    @ResponseBody
    @PostMapping("/api/submitCode")
    public Msg apiSubmitCode(@RequestBody Map<String, Object> map) {
        String username = (String) map.get("username");
        String code = (String) map.get("code");
        Integer id = (Integer) map.get("problemId");

        return submitCode(username, code, id);
    }

    Msg submitCode(String username, String code, int problemId) {
        Date date1 = new Date();
        try {
            new File("C:/code/Main.class").delete();
            if (code.isEmpty() )
                return Msg.error().add("status", "代码不能为空！");
            File file = new File("C:/code/Main.java");
            if (!file.exists()) {
                file.getParentFile().mkdirs();
                file.createNewFile();
            }
            OutputStream os = new FileOutputStream(file);
            os.write(code.getBytes(), 0, code.length());
            os.flush();
            os.close();

            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            int result = compiler.run(null, null, null, "C:/code/Main.java");
            System.out.println(result == 0 ? "编译成功" : "编译失败");
            if (result == 1) {
                recordService.submitCode(new Record(username, problemId, 0, 0, new Date()));
                return Msg.fail().add("compileStatus", "编译失败");
            }

            // 通过类加载器来动态运行编译好的类
            ByteArrayOutputStream baoStream = new ByteArrayOutputStream(1024);
            PrintStream cacheStream = new PrintStream(baoStream);
            PrintStream oldStream = System.out;
            System.setOut(cacheStream); // 将输出结果保持到baoStream中，以便后面用
            URL[] urls = new URL[]{new URL("file:/" + "C:/code/")};
            URLClassLoader loader = new URLClassLoader(urls);
            Class c = loader.loadClass("Main");
            // 调用加载类的main方法
            Method m = c.getMethod("main", String[].class);
            m.invoke(null, (Object) new String[]{});
            Date date2 = new Date();
            System.setOut(oldStream);//将输出打印到控制台
            String resultInfo = baoStream.toString();
            System.out.println(resultInfo);
            String answer = answerService.getAnswer(problemId);
            System.out.println(answer);
            System.out.println(answer.equals(resultInfo.replaceAll("[\n\r]", "")));
            //注意上面的代码，如果不加（Object）转型的话，
            //则会编译成：m.invoke(null,"aa","bb"),就发生了参数个数不匹配的问题。
            //因此，必须要加上（Object）转型，避免这个问题。
            if (answer.equals(resultInfo.replaceAll("[\n\r]", ""))) { // 正确
                System.out.printf("答案正确");
                recordService.submitCode(new Record(username, problemId, 1, (int) (date2.getTime() - date1.getTime()), new Date()));
                return Msg.success().add("compileStatus", "编译成功").add("runStatus", resultInfo + " <button class=\"btn btn-success\">答案正确</button>");
            } else {
                System.out.println("答案错误");
                recordService.submitCode(new Record(username, problemId, 0, 0, new Date()));
                return Msg.success().add("compileStatus", "编译成功").add("runStatus", resultInfo + " <button class=\"btn btn-warning\">答案错误</button>");
            }
        } catch (Exception e) {
            return Msg.error().add("status", e.getStackTrace());
        }
    }

    @RequestMapping("/AddProblem")
    public String addProblem(Model model,@RequestParam("answer")String answer,@RequestParam(value = "question")String question){
        int problemId = problemService.selectProblemId()+1;
        Problem problem=new Problem(problemId,question);
        Answer answer1=new Answer(problemId,answer);
        int i = problemService.insert(problem,answer1);
        model.addAttribute("status",i);
        return "/addProblem";
    }

    @ResponseBody
    @RequestMapping("/api/AddProblem")
    public Msg apiAddProblem(@RequestParam("answer")String answer,@RequestParam("question")String question){
        int problemId = problemService.selectProblemId() + 1;
        Problem problem=new Problem(problemId,question);
        Answer answer1=new Answer(problemId,answer);
        int i = problemService.insert(problem,answer1);
        return i == 1 ? Msg.success():Msg.fail();
    }

    @ResponseBody // 把结果转换成json字符串
    @RequestMapping("/deleteProblem/{problemId}")
    public Msg deleteProblem(@PathVariable("problemId")Integer problemId) {
        int i = problemService.deleteByPrimaryKey(problemId);
        if (i == 1) {
            return Msg.success();
        }
        return Msg.fail();
    }

    @ResponseBody
    @RequestMapping("/update/{problemId}")
    public Msg updateProblem(@PathVariable("problemId")Integer problemId,@RequestParam("problemTitle")String problemTitle,@RequestParam("problemAnswer")String problemAnswer) {
        Problem problem=new Problem(problemId,problemTitle);
        Answer answer = new Answer(problemId,problemAnswer);
        int i=problemService.updateByPrimaryKey(problem);
        int j=answerService.updateByPrimaryKey(answer);
        if (i==1&&j==1){
            return Msg.success();
        }
        return Msg.fail();
    }

}
