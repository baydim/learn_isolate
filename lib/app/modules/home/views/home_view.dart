import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                LinearProgressIndicator(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.textController.value,
              decoration: InputDecoration(
                hintText: "Value Int",
                labelText: "Value Int",
              ),
              keyboardType: TextInputType.number, // Enforce numeric keyboard
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Allow only digits
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                controller.funcNoIsolate();
              },
              child: const Text("No isolate"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                controller.funcIsolate();
              },
              child: const Text("isolate"),
            ),
          ],
        ),
      );
    });
  }
}
