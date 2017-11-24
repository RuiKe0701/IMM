package team.runke.imm.entity;
/**
 * @author 闫琛昊
 * @version 1.0
 *角色权限
 */
public class RolePermissions {
    /**
     * 编号
     */
    private Integer roleId;
    /**
     * 用户编号
     */
    private User user;
    /**
     * 权限编号
     */
    private Permissions permissions;
    /**
     * 是否赋予
     */
    private Integer roleGive;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Permissions getPermissions() {
        return permissions;
    }

    public void setPermissions(Permissions permissions) {
        this.permissions = permissions;
    }

    public Integer getRoleGive() {
        return roleGive;
    }

    public void setRoleGive(Integer roleGive) {
        this.roleGive = roleGive;
    }
}
