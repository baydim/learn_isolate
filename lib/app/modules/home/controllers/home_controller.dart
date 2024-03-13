import 'dart:io';
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
      // Print only within the main isolate (optional)
      if (Platform.isAndroid || Platform.isIOS) {
        print('n: $n, result: $result');
      }
      return result;
    }
  }

  funcIsolate() async {
    final value = int.tryParse(textController.value.text) ?? 1;
    await Isolate.run((() => slowFib(value))); // Pass only the value
  }

  funcNoIsolate() async {
    slowFib(
      int.tryParse(textController.value.text) ?? 1,
    );
  }

  // ... other methods
}
