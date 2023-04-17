package com.bank.services;


import com.bank.models.user.User;
import com.bank.models.user.UserRole;
import com.bank.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;

@Service
public class CustomAuthenticationProviderService implements AuthenticationProvider, UserDetailsService {
	
	@Autowired
	private UserRepository userRepository;

	@Resource
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		UsernamePasswordAuthenticationToken authenticationToken = null;
		
		String username = authentication.getName();
		String password = authentication.getCredentials().toString();

		System.out.println(username);
		System.out.println(password);

		User user = userRepository.findByUsername(username);

		if(user != null) {
			System.out.println(user.getUsername());
			System.out.println(user.getPassword());
			System.out.println(username.equals(user.getUsername()));
			System.out.println(BCrypt.checkpw(password, user.getPassword()));
			if(username.equals(user.getUsername()) && BCrypt.checkpw(password, user.getPassword())) {
				Collection<GrantedAuthority> grantedAuthorities = getGrantedAuthorities(user);
				authenticationToken = new UsernamePasswordAuthenticationToken(
						new org.springframework.security.core.userdetails.User(username, password, grantedAuthorities), password, grantedAuthorities);
			}
		} else {
			System.out.println("User not found");
			throw new UsernameNotFoundException("User name " + username + " not found");
		}
		return authenticationToken;
	}

	private Collection<GrantedAuthority> getGrantedAuthorities(User user) {
		Collection<GrantedAuthority> grantedAuthorities = new ArrayList<>();
		if(userRepository.findUserTypeByIdentifier(user.getIdentifier()).equals(UserRole.UserType.ROLE_ADMIN)) {
			grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
		}
		grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		return grantedAuthorities;
	}
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userRepository.findByUsername(username);
		if (user != null && user.getID() != null) {
			return new org.springframework.security.core.userdetails.User
					(username, passwordEncoder.encode(user.getPassword()), AuthorityUtils.NO_AUTHORITIES);
		}

		return null;
	}
}
