package test.service;

import service.AdminService;

import java.util.List;

public class TestAdminService {

    public static void main(String[] args) {

         System.out.println(AdminService.getAllAdmin());

        List<Object> list = AdminService.getAllRoleAdminAndStatusAcc();
        System.out.println(list.get(0));
        System.out.println(list.get(1));

    }
}
