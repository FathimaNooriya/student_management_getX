import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_getx/model/db_model.dart';

class StudentController extends GetxController {
  RxList<StudenNewtModel> studentList = <StudenNewtModel>[].obs;
  RxList<StudenNewtModel> searchStudentList = <StudenNewtModel>[].obs;

  Future<void> addStudent(StudenNewtModel value) async {
    // studentList.value.add(value);
    final studentDB = await Hive.openBox<StudenNewtModel>('student_db');

    await studentDB.add(value);
    await getAllStudence();
    // studentListNotifier.value.add(value);
    //  notifyListeners();
  }

  Box<StudenNewtModel>? studentdbb;
  opendb() async {
    studentdbb = await Hive.openBox<StudenNewtModel>('student_db');
  }

  Future<void> getAllStudence() async {
    final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
    studentList.clear();
    studentList.addAll(studentDB.values);
    //   notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
    await studentDB.deleteAt(id);
    getAllStudence();
  }

  Future<void> updateStudent(StudenNewtModel value, int id) async {
    final studentDB = await Hive.openBox<StudenNewtModel>('student_db');
    studentDB.putAt(id, value);
    //   notifyListeners();
  }
//}
}
