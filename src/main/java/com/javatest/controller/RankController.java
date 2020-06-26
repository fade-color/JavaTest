package com.javatest.controller;

import com.javatest.domain.Record;
import com.javatest.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
public class RankController {

    @Autowired
    RecordService recordService;
    @Autowired
    HttpServletRequest request;

    @RequestMapping("/rankList")
    public String rankList(Model model) {
        List<Record> records = recordService.selectAllRank();
        model.addAttribute("rankList",records);
        return "/rank";
    }

    @ResponseBody
    @RequestMapping("/api/submitNum")
    public List<Record> submitNum() {
        List<Record> status = recordService.selectAllRankBySubmitNum();
        return status;
    }

    @ResponseBody
    @RequestMapping("/api/rankList")
    public List<Record> getRank() {
        List<Record> status = recordService.selectAllRank();
        return status;
    }

    @RequestMapping("/statusList")
    public String status(Model model) {
        List<Record> status = recordService.selectAllStatus();
        model.addAttribute("StatusList",status);
        return "status";
    }

    @ResponseBody
    @RequestMapping("/api/StatusList")
    public List<Record> getStatus() {
        List<Record> status = recordService.selectAllStatus();
        return status;
    }

    @ResponseBody
    @RequestMapping("/api/MyRecord")
        public List<Record> getMyRecord() {
            List<Record> myRecord = recordService.selectMyRecord();
            Collections.reverse(myRecord);
        return myRecord;
    }
    @RequestMapping("/mySubmitList")
    public String mySumbit(Model model) {
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("username");
        if (userId==null)
            return "redirect:/index.jsp";
        List<Record> mySumbit = recordService.selectByUserId(userId);
        model.addAttribute("MySubmitList",mySumbit);
        return "/mySubmit";
    }

    @ResponseBody
    @RequestMapping("/api/{userId}/SubmitList")
    public List<Record> apiMySubmitList(@PathVariable("userId")String userId) {
        List<Record> mySumbit = recordService.selectByUserId(userId);
        return mySumbit;
    }

}
