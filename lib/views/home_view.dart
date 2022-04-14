import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/home_control.dart';
import 'package:getx/models/post_model.dart';
import 'package:getx/pages/update_post_page.dart';

Widget items_of_post(Home_control home_control, Post p) => Slidable(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                p.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                p.body,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      startActionPane:
          ActionPane(extentRatio: .25, motion: const ScrollMotion(), children: [
        SlidableAction(
          // Edite function
          onPressed: (BuildContext con) {
            Get.to(Update_post(post: p));
          },
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edite',
        ),
      ]),
      endActionPane:
          ActionPane(extentRatio: .25, motion: const ScrollMotion(), children: [
        SlidableAction(
          // delete function
          onPressed: (BuildContext con) {
            home_control.Delete_post(p);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
    );
