

import 'package:hive_flutter/hive_flutter.dart';

part 'db_model.g.dart';

@HiveType(typeId: 1)
class StudenNewtModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  int age;

  @HiveField(3)
  int stclass;

  @HiveField(4)
  final String adress;

  @HiveField(5)
  final String image;

  StudenNewtModel({
    this.id,
    required this.name,
    required this.age,
    required this.stclass,
    required this.adress,
    required this.image,
  });
}
