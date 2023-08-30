import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/View/student_details.dart';
import '../controller/student_controller.dart';


class searchStudents extends SearchDelegate {
  StudentController myStudent = Get.put(
    StudentController(),
  );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.close_rounded))
    ];

    // TODO: implement buildActions
    // throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));

    // TODO: implement buildLeading
    //   throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return
        //  ValueListenableBuilder(
        //   valueListenable: studentList,
        //   // valueListenable:StudentProvider().studentList,
        //   builder:
        //       (BuildContext context, List<StudenNewtModel> value, Widget? child) {
        //    Consumer<StudentProvider>(
        //  builder: (context, value, child) {
        Obx(
      () {
        final value = myStudent.studentList;
        return SafeArea(
            child: Center(
          child: ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              if (value[index]
                  .name
                  .toLowerCase()
                  .contains(query.toLowerCase())) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: FileImage(File(value[index].image)),
                      ),
                      title: Text("${value[index].name}"),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => student_datails_page(
                              name: value[index].name,
                              age: value[index].age,
                              stclass: value[index].stclass,
                              adress: value[index].adress,
                              image: value[index].image,
                              index: index),
                        ));
                      },
                    ),
                    Divider(),
                  ],
                );
              } else {
                return Text("No");
              }
            },
          ),
        ));
        //   },
        // );
      },
    );
    // TODO: implement buildResults
    //  throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return
        //  ValueListenableBuilder(
        //   valueListenable: studentList,
        //   //  valueListenable: StudentProvider().studentList,
        //   builder:
        //       (BuildContext context, List<StudenNewtModel> value, Widget? child) {
        // Consumer<StudentProvider>(
        //  builder: (context, value, child) {
        Obx(
      () {
        final value = myStudent.studentList;
        return SafeArea(
            child: ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            if (value[index].name.toLowerCase().contains(query.toLowerCase())) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: FileImage(File(value[index].image)),
                    ),
                    title: Text("${value[index].name}"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => student_datails_page(
                            name: value[index].name,
                            age: value[index].age,
                            stclass: value[index].stclass,
                            adress: value[index].adress,
                            image: value[index].image,
                            index: index),
                      ));
                    },
                  ),
                  Divider(),
                ],
              );
            } else {
              return Container();
            }
          },
        ));
      },
    );

    // TODO: implement buildSuggestions
    // throw UnimplementedError();
  }
}
