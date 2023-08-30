import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_getx/View/home_screen.dart';

import '../controller/student_controller.dart';
import '../model/db_model.dart';

class add_student_page extends StatefulWidget {
  String? name;
  int? age;
  int? stclass;
  String? adress;
  String? image;
  int? index;
  bool edit;

  add_student_page(
      {super.key,
      required this.edit,
      this.name,
      this.age,
      this.stclass,
      this.adress,
      this.image,
      this.index});

  //late bool edit = false;

  @override
  State<add_student_page> createState() => _add_student_pageState();
}

class _add_student_pageState extends State<add_student_page> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  late TextEditingController classController = TextEditingController();
  late TextEditingController adressController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool addImage = false;
  File? image1;

  StudentController myStudent = Get.put(
    StudentController(),
  );
  @override
  void initState() {
    if (widget.edit) {
      nameController = TextEditingController(text: widget.name);
      ageController = TextEditingController(text: widget.age.toString());
      classController = TextEditingController(text: widget.stclass.toString());
      adressController = TextEditingController(text: widget.adress);
      image1 = File(widget.image!);
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 173, 123, 196),
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
              child: Text("Add New Student",
                  style: TextStyle(
                    color: Color.fromARGB(255, 150, 2, 130),
                  ))),
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                      // ValueListenableBuilder(
                      //     valueListenable: imageList,
                      //     builder: (BuildContext context, imageList, Widget) {
                      //       return
                      GestureDetector(
                    child: image1 != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(File(image1!.path)),
                            //imageList.isNotEmpty
                            //  ? FileImage(File(imageList.value[0]!.path))
                            radius: 60,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                //FileImage(File(widget.image!)),
                                NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                            radius: 60,
                          ),
                    onTap: () {
                      imagepicker(context);
                    },
                  ),
                  // }
                  //),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Visibility(
                    visible: addImage,
                    child: Text(
                      'Please Add Photo',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 177, 22, 11)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Enter Student Name",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255)),
                            borderRadius: BorderRadius.circular(15))),
                    validator: (value) {
                      if (nameController.text == "") {
                        return "Enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Age",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    borderRadius: BorderRadius.circular(15))),
                            validator: (value) {
                              if (ageController.text == "") {
                                return "Enter your age";
                              } else if (int.parse(ageController.text) > 18) {
                                return "Enter correct age";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                    Container(
                      width: 180,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                            controller: classController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: "Enter Class",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    borderRadius: BorderRadius.circular(15))),
                            validator: (value) {
                              if (classController.text == "") {
                                return "P Enter your class";
                              } else if (int.parse(classController.text) > 12) {
                                return "Enter correct class";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      controller: adressController,
                      maxLines: 3,
                      decoration: InputDecoration(
                          hintText: "Enter Student Adress",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 252, 252, 252)),
                              borderRadius: BorderRadius.circular(15))),
                      validator: (value) {
                        if (adressController.text == "") {
                          return "Please Enter your adress";
                        } else {
                          return null;
                        }
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: !widget.edit,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              "Save",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          onPressed: (() {
                            if (image1 != null) {
                              if (formkey.currentState!.validate()) {
                                saveStudent();
                                setState(() {
                                  addImage = false;
                                });
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: ((context) => MyHomePage())));
                              }
                            } else {
                              setState(() {
                                addImage = true;
                              });
                            }
                          }),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.edit,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Text(
                              "Update",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          onPressed: (() {
                            if (formkey.currentState!.validate()) {
                              editStudent(widget.index!);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) => MyHomePage())));
                            }
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void imagepicker(context) async {
    showDialog(
        context: context,
        builder: ((ctx) {
          return Center(
            child: Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera),
                            Text(
                              "Camera",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      pickImage(ImageSource.camera);
                      Navigator.pop(ctx);
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.image_search),
                            Text(
                              "Gallery",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      pickImage(ImageSource.gallery);
                      Navigator.pop(ctx);
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Future pickImage(ImageSource source1) async {
    try {
      final imagePic = await ImagePicker().pickImage(source: source1);
      if (imagePic == null) {
        return;
      }
      final imagePath = File(imagePic.path);
      setState(() {
        image1 = imagePath;
      });
      // imageList.value[0] = await ImagePicker().pickImage(source: source1);
      // print("oooooooooooooooooooooooooo");
      // print(imageList.value[0]);
      //  if (imageList.value[0] == null) {
      //    return;
      //  }
      // final imageTemporary = File(imageList.value[0]!.path);
      // this.imageList.value[0] = imageTemporary as XFile?;
    } on PlatformException catch (e) {
      print("Faild to pic image");
    }
  }

  Future<void> saveStudent() async {
    final _student = StudenNewtModel(
        name: nameController.text.trim(),
        age: int.parse(ageController.text.trim()),
        stclass: int.parse(classController.text.trim()),
        adress: adressController.text.trim(),
        image: image1!.path);
    //StudentProvider().addStudent(_student);
    myStudent.addStudent(_student);
  }

  Future<void> editStudent(int index) async {
    final _student = StudenNewtModel(
        name: nameController.text.trim(),
        age: int.parse(ageController.text.trim()),
        stclass: int.parse(classController.text.trim()),
        adress: adressController.text.trim(),
        image: image1!.path);
    // StudentProvider().updateStudent(_student, index);
    myStudent.updateStudent(_student, index);
  }
}
