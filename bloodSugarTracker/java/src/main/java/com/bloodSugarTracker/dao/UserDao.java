package com.bloodSugarTracker.dao;

import com.bloodSugarTracker.model.RegisterUserDto;
import com.bloodSugarTracker.model.User;

import java.util.List;

public interface UserDao {

    List<User> getUsers();

    User getUserById(int id);

    User getUserByUsername(String username);

    User createUser(RegisterUserDto user);
}
