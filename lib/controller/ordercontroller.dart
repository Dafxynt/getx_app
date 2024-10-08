import 'package:get/get.dart';

class OrderItem {
  final String image;
  final String name;
  final String price;
  final String date;
  final String status;
  final int quantity;

  OrderItem({
    required this.image,
    required this.name,
    required this.price,
    required this.date,
    required this.status,
    required this.quantity
  });
}

class OrderController extends GetxController {
  var orders = <OrderItem>[].obs;

  void addOrder(OrderItem order) {
    orders.add(order);
  }
}


