import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Model{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String dateTime;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String location;

  Model(this.id, this.dateTime, this.title, this.location);



}