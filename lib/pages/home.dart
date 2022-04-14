import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/home_control.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/pages/create_post_page.dart';
import 'package:getx/pages/update_post_page.dart';
import 'package:getx/views/home_view.dart';

class Home extends StatefulWidget {
  static final String id = "/home_page";
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Home_control home_control = Get.put(Home_control());
  @override
  void initState() {
    home_control.initialize_future();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("setState"),
      ),
      body: Obx(
        () => Stack(
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/originals/4b/f2/b3/4bf2b361a67b3030b185fd7447b279b5.jpg"),
                      fit: BoxFit.fill)),
              child: FutureBuilder<List<Post>>(
                future: home_control.future.value,
                builder: (BuildContext context, snp) {
                  var data = snp.data ?? [];
                  if (snp.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return items_of_post(home_control, data[index]);
                      },
                    );
                  } else if (snp.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: h,
                      width: w,
                      color: Colors.black.withOpacity(.4),
                      child: Container(
                        height: 60,
                        width: 60,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
            home_control.isloading.value
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(Create_post())?.then((value) {
            if (value != null) {
              home_control.initialize_future();
            }
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
