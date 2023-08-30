// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import '../model/db_model.dart';

// //class StudentProvider extends ChangeNotifier {
// late Box<StudenNewtModel> studentDB;
// // List<StudenNewtModel> studentList = [];
// StudentProvider() {
//   getAllStudence();
// }

// ValueNotifier<List<StudenNewtModel>> studentList = ValueNotifier([]);
// Future<void> addStudent(StudenNewtModel value) async {
//   // studentList.value.add(value);
//   //final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
//   studentDB = await Hive.openBox<StudenNewtModel>('student_db');
//   await studentDB.add(value);
//   await getAllStudence();
//   // studentListNotifier.value.add(value);
//   //  notifyListeners();
// }

// Box<StudenNewtModel>? studentdbb;
// opendb() async {
//   studentdbb = await Hive.openBox<StudenNewtModel>('student_db');
// }

// Future<void> getAllStudence() async {
//   final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
//   studentList.value.clear();
//   studentList.value.addAll(studentDB.values);
//   //   notifyListeners();
// }

// Future<void> deleteStudent(int id) async {
//   final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
//   await studentDB.deleteAt(id);
//   getAllStudence();
// }

// Future<void> updateStudent(StudenNewtModel value, int id) async {
//   final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
//   studentDB.putAt(id, value);
//   //   notifyListeners();
// }
// //}
