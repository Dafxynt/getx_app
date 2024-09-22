import 'package:flutter/material.dart';

class Pesan extends StatelessWidget {
  const Pesan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesan"),
      ),
      body: Center(
        child: Container(
          child: Text("ini pesan page"),
        ),
      ),
    );
  }
}