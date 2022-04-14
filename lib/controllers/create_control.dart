import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/services/http_server.dart';

class Create_control extends GetxController {
  var isloading = false.obs;
  var control1 = TextEditingController().obs;
  var control2 = TextEditingController().obs;

  Create_post() async {
    var text1 = control1().text.trim();
    var text2 = control2().text.trim();
    if (text1.isNotEmpty && text2.isNotEmpty) {
      isloading(true);
      var posts = await Rest_APi.GET_parsed_list();
      var id = random_id(posts);
      var new_post = Post(int.parse(id), text1, text2, int.parse(id));
      // create post function
      Rest_APi.POST(new_post);
      isloading(false);
      Get.back(result: "new post");
    } else {
      var message = (text1.isEmpty && text2.isEmpty)
          ? "Title and Body"
          : text1.isEmpty
              ? "Title"
              : "Body";

      Get.snackbar(
        "check fields",
        message + " are empty",
        backgroundColor: Colors.blue.withOpacity(.5),
        icon: Icon(Icons.warning, color: Colors.orange),
        snackPosition: SnackPosition.BOTTOM,
      ).show();
    }
  }

  String random_id(List<Post> posts) {
    const _chars = '1234567890';
    Random _rnd = Random();
    String s = '';
    for (var e in posts) {
      s = String.fromCharCodes(Iterable<int>.generate(
          10, (i) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      if (s == e.id.toString()) {
        random_id(posts);
      }
    }
    return s;
  }
}
