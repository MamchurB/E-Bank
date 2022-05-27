package com.todolist.service.impl;

import java.util.List;

import com.todolist.repository.ConfirmationTokenRepository;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.todolist.model.Role;
import com.todolist.model.User;
import com.todolist.repository.RoleRepository;
import com.todolist.repository.UserRepository;
import com.todolist.service.UserService;
import org.springframework.transaction.annotation.Transactional;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private ConfirmationTokenRepository confirmationTokenRepository;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;


	@Override
	public List<User> userList() {
		return userRepository.userList();
	}

	@Override
	public User findByUsernam(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public Page<User> findAll(Pageable pageable) {
		return userRepository.findAll(new PageRequest(pageable.getPageNumber() - 1, 5));
	}

	@Override
	public User findOne(Long id) {
		return userRepository.findOne(id);
	}

	@Override
	public String addUser(User user) {
		String message = "Added";
		JSONObject jsonObject = new JSONObject();

		try {
			if(user.getTheme() == null){
				user.setTheme("/todolist/css/theme-1.css");
			}
			if(user.getLang() == null){
				user.setLang("en");
			}

			System.out.println("Password:" + user.getPassword());
			System.out.println("RoleId:" + user.getRoleId());

			user.setRole(roleRepository.findOne(user.getRoleId() == null ? 2L : user.getRoleId()));
			jsonObject.put("status", "success");
			jsonObject.put("title", message+" Confirmation");
			jsonObject.put("message", message+" successfully.");
			jsonObject.put("message", userRepository.save(user).getFullName()+" "+message+" successfully.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}

	@Transactional
	void deleteToken(Long id){
		confirmationTokenRepository.deleteConfirmationTokenByUser(userRepository.findOne(id));
	}

	@Transactional
	@Override
	public String deleteUser(Long id) {
		JSONObject jsonObject = new JSONObject();
		deleteToken(id);
		try {
			userRepository.delete(id);
			jsonObject.put("message", "User Deleted Successfully.");
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
	}
	
	@Override
	public List<Role> roleList() {
		return roleRepository.findAll();
	}

	@Override
	public User findByEmailIgnoreCase(String email) {
		return userRepository.findByEmailIgnoreCase(email);
	}

	@Override
	public void refreshCache() {
		
	}

}
