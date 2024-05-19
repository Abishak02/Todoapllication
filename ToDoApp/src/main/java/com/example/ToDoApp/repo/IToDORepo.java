package com.example.ToDoApp.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ToDoApp.Model.Todo;
@Repository
public interface IToDORepo extends JpaRepository<Todo, Long> {

}
