import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_getx/View/add_new_screen.dart';

class student_datails_page extends StatelessWidget {
  int indexno = 0;
  final String name;
  final int age;
  final int stclass;
  final String adress;
  final String? image;
  final int? index;
  student_datails_page(
      {super.key,
      indexno,
      required this.name,
      required this.age,
      required this.stclass,
      required this.adress,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 4, 59),
          leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: Icon(Icons.arrow_back),
            color: Color.fromARGB(255, 150, 2, 130),
          ),
          title: Center(
              child: Text("Student details",
                  style: TextStyle(
                    color: Color.fromARGB(255, 150, 2, 130),
                  ))),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => add_student_page(
                          edit: true,
                          name: name,
                          age: age,
                          stclass: stclass,
                          adress: adress,
                          image: image,
                          index: index,
                        ))));
                print(index);
              },
              icon: Icon(Icons.edit),
              color: Color.fromARGB(255, 150, 2, 130),
            )
          ]),
      body: Container(
        color: Color.fromARGB(255, 173, 123, 196),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: FileImage(File(image!)),
            ),
            Text("Name:$name"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Age:$age"),
                Text("Class:$stclass"),
              ],
            ),
            Text("Adress:$adress")
          ],
        ),
      ),
    );
  }
}
