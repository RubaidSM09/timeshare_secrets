import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Step3View extends GetView {
  const Step3View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step3View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Step3View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
