import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var textController = TextEditingController(text: "10").obs;
  var result = 0.obs;
  funcIsolate() async {
    var response = await IsolatesApp.funcIsolate(
        int.tryParse(textController.value.text) ?? 1);
    result.value = response;
  }

  funcNoIsolate() async {
    result.value = slowFib(
      int.tryParse(textController.value.text) ?? 1,
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    textController.close();
    Isolate.current.kill();
    super.onClose();
  }
}

class IsolatesApp {
  static Future<int> funcIsolate(int n) async {
    final value = n;
    var response =
        await Isolate.run((() => slowFib(value))); // Pass only the value
    print(response);

    return response;
  }
}

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
