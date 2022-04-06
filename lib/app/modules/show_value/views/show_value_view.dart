import 'package:dice_app_for_interview_bijak/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/show_value_controller.dart';

class ShowValueView extends GetView<ShowValueController> {
  Future<bool> onWillPop() {
    HomeController.to.clearAllData();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Leaderboard'),
          // backgroundColor: Colors.red,
        ),
        body: GetX<ShowValueController>(
          init: ShowValueController(),
          initState: (_) {
            controller.findTotal();
            controller.saveHeightScoreForFutureUse();
          },
          builder: (_) {
            if (controller.loading.value == true) {
              return Text('data');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.green.shade100,
                    child: ListTile(
                      title: Text('Your Score'),
                      subtitle: Text('${controller.total.value}'),
                    ),
                  ),
                  Container(
                    color: Colors.green.shade100,
                    child: ListTile(
                      title: Text(
                        'Your Highst Score',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Obx(() {
                        return Text(
                          '${controller.heightScore.value}',
                          style: TextStyle(fontSize: 50),
                          textAlign: TextAlign.center,
                        );
                      }),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
