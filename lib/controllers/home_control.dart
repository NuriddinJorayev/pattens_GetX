import 'package:get/state_manager.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/services/http_server.dart';

class Home_control extends GetxController {
  var future = Future<List<Post>>.delayed(Duration(microseconds: 0)).obs;
  var isloading = false.obs;

  initialize_future() {
    future.obs.value(Rest_APi.GET_parsed_list());
  }

  Delete_post(Post p) {
    isloading(true);
    Future.delayed(Duration(seconds: 1));
    Rest_APi.DEL(p);
    initialize_future();
    isloading(false);
  }
}
