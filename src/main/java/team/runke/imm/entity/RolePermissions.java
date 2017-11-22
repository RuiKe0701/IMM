package team.runke.imm.entity;
public class RolePermissions {
    private int roleId;
    private int userId;
    private int permissionsId;
    private int roleGive;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPermissionsId() {
        return permissionsId;
    }

    public void setPermissionsId(int permissionsId) {
        this.permissionsId = permissionsId;
    }

    public int getRoleGive() {
        return roleGive;
    }

    public void setRoleGive(int roleGive) {
        this.roleGive = roleGive;
    }
}
