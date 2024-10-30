import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_getx/Database/DatabaseHelper.dart';
import 'package:app_getx/controller/responsive_controller.dart';
import 'mobile_order_list.dart';
import 'tablet_order_list.dart';

class OrderListPage extends StatelessWidget {
  final String statusFilter;

  const OrderListPage({Key? key, required this.statusFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResponsiveController responsiveController = Get.find();

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          responsiveController.updateScreenWidth(constraints.maxWidth);
          return Obx(() {
            if (responsiveController.isMobile()) {
              return MobileOrderList(
                onCancel: (id) => _cancelOrder(id),
                statusFilter: statusFilter,
              );
            } else {
              return TabletOrderList(
                onCancel: (id) => _cancelOrder(id),
                statusFilter: statusFilter,
              );
            }
          });
        },
      ),
    );
  }

  Future<void> _cancelOrder(int id) async {
    await DatabaseHelper().deleteOrder(id);
  }
}
