package com.example.ToDoApp.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ToDoApp.Model.Todo;
import com.example.ToDoApp.repo.IToDORepo;
@Service
public class ToDoService {
	@Autowired
	IToDORepo repo;
	public List<Todo>getAllToDoItems(){
		ArrayList<Todo> todoList=new ArrayList<>();
		repo.findAll().forEach(todo->todoList.add(todo));
		return todoList;
   }
	public  Todo getAllToDoItemsById(Long id){
	   return repo.findById(id).get();
   }
  public boolean updateStatus(Long id){
	 Todo todo= getAllToDoItemsById(id); 
	 todo.setStatus("completed");
	 return saveOrupdateToDoItem(todo);
   }
 public boolean saveOrupdateToDoItem(Todo todo){
	   Todo updateobj=repo.save(todo);
	   if (getAllToDoItemsById(updateobj.getId())!=null) {
		   return true;
	   }else {
		   return false;
	   }
   }
  public boolean deleteToDoItem(Long id){
	   repo.deleteById(id);
	   if (repo.findById(id).isEmpty()) {
		   return true;
	   }else {
		   return false;
	   }
   }

}
