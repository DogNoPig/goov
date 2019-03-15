package com.goov.sys;

import com.goov.manage.service.UserService;
import com.goov.sys.service.PermissionService;
import com.goov.sys.service.RoleService;
import com.goov.sys.entity.Role;
import com.goov.sys.entity.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
@Component("myRealm")
public class SysShiroRealm extends AuthorizingRealm {
    @Autowired
    // @Qualifier("permissionService")
    private PermissionService permissionService;
    @Autowired
    // @Qualifier("userService")
    private UserService userService;
    @Autowired
    // @Qualifier("roleService")
    private RoleService roleService;

    /**
     * 获取相关的授权信息
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录时输入的用户名
        String username=(String) principalCollection.fromRealm(getName()).iterator().next();

        // System.out.println("doGetAuthorizationInfo+username="+username);

        if(username!=null){
            //权限
            List<String> listUrl=permissionService.getTheUrl(username);

            // System.out.println("doGetAuthorizationInfo+listUrl="+listUrl.get(0));
            // System.out.println("doGetAuthorizationInfo+listUrl="+listUrl.get(1));
            //用户信息
            User user = userService.getUserByUsername(username);

            // System.out.println("doGetAuthorizationInfo+user="+user.toString());

            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
            if(listUrl!=null&&!listUrl.isEmpty()){
                for(String url:listUrl){
                    info.addStringPermission(url);//加入权限
                }
            }
            //获取该用户的角色信息
            List<Role> roles=roleService.getRoles(user.getUserid());

            //System.out.println("doGetAuthorizationInfo+roles="+roles.get(0).getName());

            if(roles!=null&&!roles.isEmpty()){
                for(Role role:roles){
                	/*if (!role.getName().equals("admin")) {
                		info.addRole("admin");//加入admin角色
					}*/
                    info.addRole(role.getRoleName());//加入角色
                }

                //System.out.println("doGetAuthorizationInfo+if+roles="+roles.toArray());
            }

            return info;
        }
        return null;
    }


    /**
     * 获取身份验证信息
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token=(UsernamePasswordToken)authenticationToken;
        //通过表单接收的用户名
        String username=token.getUsername();

        // System.out.println("doGetAuthenticationInfo+username="+username);

        if(username!=null&&!"".equals(username)){
            User user=userService.getUserByUsername(username);
            ///
            // System.out.println("doGetAuthenticationInfo+user="+user.toString());

            if(user!=null){
                return new SimpleAuthenticationInfo(user.getUsername(),user.getPassword(),getName());
            }
        }
        return null;
    }
}
