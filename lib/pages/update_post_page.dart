import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/update_control.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/widgets/text_field.dart';

class Update_post extends StatefulWidget {
  Post post;
  static final String id = "update_post";
  Update_post({Key? key, required this.post}) : super(key: key);

  @override
  State<Update_post> createState() => _Update_postState();
}

class _Update_postState extends State<Update_post> {
  var up_con = Get.put(Update_control());

  @override
  void initState() {
    up_con.initstate(widget.post, widget.post.title, widget.post.body);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update Post"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: h,
                width: w,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text_Field.Create_textFiled(
                        "Title", up_con.control1.value, 3),
                    Text_Field.Create_textFiled(
                        "Body", up_con.control2.value, 6),
                  ],
                ),
              ),
              up_con.isloading.value
                  ? Container(
                      height: h,
                      width: w,
                      color: Colors.black.withOpacity(.4),
                      child: Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SizedBox.shrink()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          up_con.Update_post();
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
