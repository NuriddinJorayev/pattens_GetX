import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/create_control.dart';
import 'package:getx/widgets/text_field.dart';

class Create_post extends StatefulWidget {
  static final String id = "/create_post";
  Create_post({
    Key? key,
  }) : super(key: key);

  @override
  State<Create_post> createState() => _Create_postState();
}

class _Create_postState extends State<Create_post> {
  var create_control = Get.put(Create_control());
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Post"),
      ),
      body: GetX<Create_control>(
        builder: (controller) => SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: h,
                width: w,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text_Field.Create_textFiled(
                        "Title", controller.control1(), 3),
                    Text_Field.Create_textFiled(
                        "Body", controller.control2(), 6),
                  ],
                ),
              ),
              controller.isloading()
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
          create_control.Create_post();
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
