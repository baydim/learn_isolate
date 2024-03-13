import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var textController = TextEditingController(text: "10").obs;

  int slowFib(int n) {
    if (n <= 1) {
      return 1;
    } else {
      int result = slowFib(n - 1) + slowFib(n - 2);
      print('n: $n, result: $result');
      return result;
    }
  }

  funcIsolate() async {
    await Isolate.run(() {
      return slowFib(
        int.tryParse(textController.value.text) ?? 1,
      );
    });
  }

  funcNoIsolate() async {
    slowFib(
      int.tryParse(textController.value.text) ?? 1,
    );
  }
}
