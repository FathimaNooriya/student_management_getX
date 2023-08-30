import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx/View/search.dart';
import 'package:student_getx/View/student_details.dart';
import '../controller/student_controller.dart';
import 'add_new_screen.dart';

class MyHomePage extends StatelessWidget {
  StudentController myStudent = Get.put(
    StudentController(),
  );
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<StudentProvider>().getAllStudence();
    //  StudentProvider().getAllStudence();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 173, 123, 196),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 4, 59),
          title: Padding(
            padding: const EdgeInsets.all(1),
            child: Text(
              "Studet List",
              style: TextStyle(
                  color: Color.fromARGB(255, 150, 2, 130), fontSize: 20),
            ),
          ),
          actions: [
            // ElevatedButton(
            //     onPressed: () {
            //       opendatabase();
            //     },
            //     child: Text("print")),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => add_student_page(
                          edit: false,
                        ))));
              },
              child: Text("+ Add"),
              //icon: Icon(Icons.add),
              // style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromARGB(230, 75, 17, 70),
              //     ),
            ),
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: searchStudents());
              },
              icon: Icon(Icons.search),
              color: Color.fromARGB(255, 150, 2, 130),
            ),
          ],
        ),
        body: Column(
          children: [
            // PopupMenuButton(
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //       child: Icon(Icons.home),
            //     ),
            //     itemBuilder: (context) => [
            //           PopupMenuItem(
            //             child: Text("First"),
            //             value: 1,
            //           ),
            //           PopupMenuItem(
            //             child: Text("Second"),
            //             value: 2,
            //           )
            //         ]),
            // PopupMenuButton(
            //     icon: Icon(Icons.more_horiz),
            //     itemBuilder: (context) => [
            //           PopupMenuItem(
            //             child: Text("First"),
            //             value: 1,
            //           ),
            //           PopupMenuItem(
            //             child: Text("Second"),
            //             value: 2,
            //           )
            //         ])

            // Expanded(
            //   child:
            // ValueListenableBuilder(
            //   valueListenable: studentList,
            //   builder: (BuildContext ctx, List<StudenNewtModel> value,
            //       Widget? child) {
            // Consumer<StudentProvider>(
            //   builder: (context, value, child) {
            // return
            Expanded(
              child: Obx(() {
                final value = myStudent.studentList;
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final studentData = value[index];
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 230, 223, 233),
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(studentData.image)),
                        ),
                        title: Text("${studentData.name}"),
                        trailing:
                            //const SizedBox(
                            //width: 150,
                            //   child:
                            //    Stack(
                            //     children: [
                            //       Positioned(
                            //         left: 1,
                            //         child: CircleAvatar(
                            //             radius: 20,
                            //             backgroundColor: Colors.blue),
                            //       ),
                            //       Positioned(
                            //           left: 10,
                            //           child: CircleAvatar(
                            //             radius: 20,
                            //             backgroundColor: Colors.amber,
                            //           )),
                            //       Positioned(
                            //         left: 20,
                            //         child: CircleAvatar(
                            //           radius: 20,
                            //           backgroundColor: Colors.black,
                            //         ),
                            //       ),
                            //       Positioned(
                            //         left: 30,
                            //         child: CircleAvatar(
                            //             radius: 20,
                            //             backgroundColor: Colors.red),
                            //       ),
                            //       Positioned(
                            //         left: 40,
                            //         child: CircleAvatar(
                            //             radius: 20,
                            //             backgroundColor: Colors.green),
                            //       ),
                            //       Positioned(
                            //         left: 50,
                            //         child: CircleAvatar(
                            //             radius: 20,
                            //             backgroundColor: Colors.orange),
                            //       ),
                            //       Positioned(
                            //         left: 60,
                            //         child: CircleAvatar(
                            //             radius: 20,
                            //             backgroundColor: Colors.blue),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //    ListView.builder(
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount: studentListView.length,
                            //       itemBuilder: (context, index1) {
                            //         final studentfffData =
                            //             studentListView[index1];
                            //         return Stack(
                            //           children: [
                            //             Align(
                            //               alignment: Alignment(5, 1),
                            //               // alignment: Alignment(
                            //               //     -double.parse(
                            //               //         (index1 + 5).toString()),
                            //               //     0.1),
                            //               child: CircleAvatar(
                            //                 radius: double.parse(
                            //                     (index1 + 20).toString()),
                            //                 backgroundImage: FileImage(
                            //                     File(studentfffData.image)),
                            //               ),
                            //             ),
                            //           ],
                            //         );
                            //       }),
                            // ),

                            IconButton(
                                onPressed: (() {
                                  // StudentProvider().deleteStudent(index);
                                }),
                                icon: Icon(Icons.delete)),
                        onTap: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => student_datails_page(
                                    index: index,
                                    name: studentData.name,
                                    age: studentData.age,
                                    stclass: studentData.stclass,
                                    adress: studentData.adress,
                                    image: studentData.image,
                                  ))));
                          print(index);
                        }),
                      ),
                    );
                  },
                  itemCount: value.length,
                );
              }),
              // );
              //   }),
              //         },
              //       ),
            ),
          ],
        ),
        // },
        //),
      ),
    );
  }
}
