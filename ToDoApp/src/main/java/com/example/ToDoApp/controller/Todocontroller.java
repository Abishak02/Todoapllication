package com.example.ToDoApp.controller;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ToDoApp.Model.Todo;
import com.example.ToDoApp.Service.ToDoService;

@Controller
public class Todocontroller {
    @Autowired
	private ToDoService service;
    
    @GetMapping({"/","viewtodolist"})
    public String viewAlltodoItem(Model model,@ModelAttribute("message")String message) {
    	model.addAttribute("list", service.getAllToDoItems());
    	model.addAttribute("msg", message);
    	return "viewtodolist";
    }
    
    
    
    @GetMapping("/updateToDostatus/{id}")
    public String updatetodostatus(@PathVariable Long id,RedirectAttributes redriect) {
    	if (service.updateStatus(id)) {
    		redriect.addFlashAttribute("message", "update sucessful");
    		return "redirect:/viewtodolist"; 
    	}else {
    		redriect.addFlashAttribute("message", "update failure");
    		return"redirect:/viewtodolist";
    	}
    }
    
    
    
    @GetMapping("/addTodoitem")
    public String addtodoItem(Model model) {
    	model.addAttribute("todos", new Todo());
	return "ADDTODOITEM";
    }
    @PostMapping("/saveTOdoItem")
    public String savetodoItem(Todo todo,RedirectAttributes redriect) {
	if(service.saveOrupdateToDoItem(todo)) {
		
		redriect.addFlashAttribute("message", "save sucess");
		return "redirect:/viewtodolist";
	}
	redriect.addFlashAttribute("message", "save failure");
	return "redirect:/addTodoitem";
    }
    
    
    
    
    @GetMapping("/editTodoItem/{id}")
    public String edittodoItem(@PathVariable Long id,Model model) {
	model.addAttribute("todo", service.getAllToDoItemsById(id));
	return"EditTOitem";
    }
    @PostMapping("/editsaveTodoItem")
    public String editTodoItem(Todo todo,RedirectAttributes redriect) {
    	if(service.saveOrupdateToDoItem(todo)) {
    		redriect.addFlashAttribute("message", "edit sucess");
    		return "redirect:/viewtodolist";
    	}
    	redriect.addFlashAttribute("message", "edit failure");
    	return "redirect:/editTodoItem/"+todo.getId();
    }
    
    
    
    @GetMapping("/deletetodo/{id}")
    public String deletetodoItem(@PathVariable Long id,RedirectAttributes redriect) {
	if (service.deleteToDoItem(id)) {
		redriect.addFlashAttribute("message", "Delete sucess");
	}
	redriect.addFlashAttribute("message", "Delete failure");
	return "redirect:/viewtodolist";
    }
	
}
