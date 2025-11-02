import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Step2View extends GetView {
  const Step2View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step2View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Step2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
