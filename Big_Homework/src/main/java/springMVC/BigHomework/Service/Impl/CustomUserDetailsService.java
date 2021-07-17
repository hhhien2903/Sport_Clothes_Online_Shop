/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package springMVC.BigHomework.Service.Impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import springMVC.BigHomework.DAO.UserDAO;
import springMVC.BigHomework.Entity.UserRole;

/**
 *
 * @author Mr BiN
 */
@Repository
@Transactional(readOnly=true)
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;    
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
       springMVC.BigHomework.Entity.User domainUser = userDAO.findByUserName(username);
       if(domainUser != null && domainUser.getEnabled() == true) {
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
         return new User(
                domainUser.getUserName(), 
                domainUser.getPassWord(), 
                enabled, 
                accountNonExpired, 
                credentialsNonExpired, 
                accountNonLocked,
                buildUserAuthority(domainUser.getListRole())
        );
       }else {
           throw new UsernameNotFoundException("username not found");
       }
    }
    
     private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {
        Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
        // Build user's authorities
        for (UserRole userRole : userRoles) {
            setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
        }
        List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
        return Result;
    }
    
}
