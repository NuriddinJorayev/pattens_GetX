import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/services/http_server.dart';

class Update_control extends GetxController {
  var isloading = false.obs;
  var control1 = TextEditingController().obs;
  var control2 = TextEditingController().obs;
  var post = Post(0, "title", "body", 0).obs;

  initstate(Post p, String t1, String t2) {
    post(p);
    control1.obs.value().text = t1;
    control2.obs.value().text = t2;
  }

  Update_post() async {
    var text1 = control1.value.text.trim();
    var text2 = control2.value.text.trim();
    if (text1.isNotEmpty && text2.isNotEmpty) {
      isloading(true);
      post.value.title = text1;
      post.value.body = text2;
      Rest_APi.PUT(post.value);
      isloading(false);
      Get.back(result: "new update");
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
}
