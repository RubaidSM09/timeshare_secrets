import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/genie_controller.dart';

class GenieView extends GetView<GenieController> {
  const GenieView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GenieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
