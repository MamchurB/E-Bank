package com.bank.config;

import com.bank.services.CustomAuthenticationProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {

//    @Autowired
//    private CustomAuthenticationProviderService authenticationProviderService;

    @Autowired
    private CustomAuthenticationProviderService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(userDetailsService);

    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable().authorizeRequests()
                .antMatchers("/webjars/**").permitAll()

                .antMatchers("/investments/employee/deposits", "/credits/employee/credits", "/user/employee/users")
                .hasAuthority("ROLE_EMPLOYEE").and().authorizeRequests()

                .antMatchers("/admin/**", "/conversations//admin/**")
                .hasAuthority("ROLE_ADMIN").and().authorizeRequests()

                .antMatchers("/user/confirm-account").permitAll()
                .antMatchers("/fonts/**").permitAll()
                .antMatchers("/user/registration").permitAll()
                .antMatchers("/css/**").permitAll()
                .antMatchers("/images/**").permitAll()
                .antMatchers("/js/**").permitAll()
                .antMatchers("/view/**").permitAll()


                .anyRequest().authenticated().and()
                .formLogin().loginPage("/user/login").permitAll().successHandler(loginSuccessHandler()).and()
                .logout().deleteCookies("remember-me").permitAll().and()
                .rememberMe().tokenValiditySeconds(180);
    }
    public AuthenticationSuccessHandler loginSuccessHandler() {
        return new AuthenticationSuccessHandler() {

            @Override
            public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
                Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
                if (roles.contains("ROLE_EMPLOYEE")) {
                    httpServletResponse.sendRedirect("/investments/employee/deposits");
                } else  if (roles.contains("ROLE_ADMIN")) {
                    httpServletResponse.sendRedirect("/admin/statistic");
                }else{
                    httpServletResponse.sendRedirect("/");
                }
            }
        };
    }
    @Bean
    @Override
    protected UserDetailsService userDetailsService() {
        return userDetailsService;
    }


}
