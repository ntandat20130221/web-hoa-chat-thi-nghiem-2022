package test.service;

import service.AdminService;
import service.AdminService_MT;

import java.util.List;

public class TestAdminService {

    public static void main(String[] args) {

         System.out.println(AdminService_MT.getAllAdmin());

        List<Object> list = AdminService_MT.getAllRoleAdminAndStatusAcc();
        System.out.println(list.get(0));
        System.out.println(list.get(1));

    }
}
