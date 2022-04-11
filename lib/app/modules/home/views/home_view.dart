import 'package:dice_app_for_interview_bijak/app/modules/home/views/components/NavDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    bool devMode = FlavorConfig.instance.variables[kDevMode] ?? false;
    Future<bool> onWillPop() {
      // controller.saveDataToLocalForFutureUse();
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Obx(
            () => Text('Hay, ${controller.displayName}'),
          ),
          backgroundColor: devMode ? Colors.orange : Colors.red,
        ),
        drawer: NavDrawer(),
        body: GetX<HomeController>(
          init: HomeController(),
          builder: (_) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      devMode
                          ? "App running in the dev Mode"
                          : "App running in the Production mode",
                      style: TextStyle(color: Colors.white)),
                  Text('Chance ${controller.currentChance.value + 1}'),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                            'images/dice${controller.diceNumber}.png'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              controller.changeDiceFace();
            },
            label: Text('Role The Dice')),
      ),
    );
  }
}
