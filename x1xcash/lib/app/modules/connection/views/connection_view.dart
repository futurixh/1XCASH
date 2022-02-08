import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/connection_controller.dart';

class ConnectionView extends GetView<ConnectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConnectionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConnectionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
