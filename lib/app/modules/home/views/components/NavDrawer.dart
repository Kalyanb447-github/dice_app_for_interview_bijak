import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class NavDrawer extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Obx(
                      () => Text(
                        'Hay, ${controller.displayName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Log out"),
            leading: Icon(Icons.logout_outlined),
            onTap: () {
              controller.signOut();
            },
          )
        ],
      ),
    );
  }
}
