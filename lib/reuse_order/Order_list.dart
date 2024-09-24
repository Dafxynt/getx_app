import 'package:flutter/material.dart';
import 'order_card.dart';
import 'package:app_getx/reuse_order/item_order.dart';

class OrderList extends StatelessWidget {
  final String statusFilter;

  const OrderList({Key? key, required this.statusFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = [
      OrderItem(
        image: 'https://asset.kompas.com/crops/-5X_rKKBV8FMztPN8fkQkFklwrk=/0x0:4295x2863/1200x800/data/photo/2023/08/28/64ec406fe403c.jpg',
        name: 'Apple',
        price: '\$14.75',
        date: '20 sep 2023',
        status: 'Delivered',
      ),
      OrderItem(
        image: 'https://yoona.id/wp-content/uploads/2023/02/kalori-strawberry.jpg',
        name: 'Strawberry',
        price: '\$12.75',
        date: '20 sep 2023',
        status: 'Delivered',
      ),
      OrderItem(
        image: 'https://eorder-bppbj.jakarta.go.id/web/image/product.image/1990/image?unique=65ed787',
        name: 'Pahe Ayam',
        price: '\$22.68',
        date: '20 sep 2023',
        status: 'Pending',
      ),
      OrderItem(
        image: 'https://www.pureearete.com/wp-content/uploads/2020/06/banana_m.jpg',
        name: 'Banana',
        price: '\$11.75',
        date: '20 sep 2023',
        status: 'Processing',
      ),
      OrderItem(
        image: 'https://guentercoffee.com/cdn/shop/articles/blog-header-cappuccino-zubereiten-anleitung.jpg?v=1708588875&width=1440',
        name: 'Cappucino',
        price: '\$11.75',
        date: '20 sep 2023',
        status: 'Processing',
      ),
      OrderItem(
        image: 'https://www.astronauts.id/blog/wp-content/uploads/2023/03/Daftar-Resep-Es-Buah-yang-Mudah-dan-Enak.jpg',
        name: 'Es Buah',
        price: '\$11.75',
        date: '20 sep 2023',
        status: 'Processing',
      ),
    ];

    // Filter item berdasarkan status yang dipilih
    final filteredOrders = statusFilter == 'All Order'
        ? orders
        : orders.where((order) => order.status == statusFilter).toList();

    return ListView.builder(
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return OrderCard(
          image: order.image,
          name: order.name,
          price: order.price,
          date: order.date,
          status: order.status,
        );
      },
    );
  }
}
