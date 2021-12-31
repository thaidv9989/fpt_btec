package com.btec.controller.trainer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.btec.entity.UserEntity;
import com.btec.repository.UserRepository;
import com.btec.service.IClassService;
import com.btec.util.SecurityUtils;

@Controller
@RequestMapping("/invitation/class")
public class JoinClassController {
    @Autowired
    UserRepository userRepository;

    @Autowired
    IClassService classService;

    @GetMapping ("")
    public String invite(@RequestParam Long id, Model model){
        try{
            UserEntity user = userRepository.findOne(SecurityUtils.getPrincipal().getUsername());
            if(user != null && user.getRoles().get(0).getRoleName().equals("trainee")){
                if(classService.isTraineeHasClass(id, user.getUsername())){
                    return "403";
                }
                model.addAttribute("classes", id);
            }
            else{
                return "403";
            }
        }catch (Exception e){
            return "403";
        }
        return "trainee/joinclass";
    }

}
