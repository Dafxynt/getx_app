import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_getx/controller/responsive_controller.dart';
import 'package:app_getx/reuse_order/mobile_order_list.dart';
import 'package:app_getx/reuse_order/tablet_order_list.dart';

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsiveController = Get.find();

    return Obx(() {
      // You may define onCancel and statusFilter as needed
      void onCancel(int id) {
        // Implement your cancel logic here
      }

      String statusFilter = 'All Order'; // or any filter you want to apply

      if (responsiveController.isMobile()) {
        return MobileOrderList(
          onCancel: onCancel,
          statusFilter: statusFilter,
        ); // Display mobile layout
      } else {
        return TabletOrderList(
          onCancel: onCancel,
          statusFilter: statusFilter,
        ); // Display tablet layout
      }
    });
  }
}
