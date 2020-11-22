import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class Model {
  //Title
  @HiveField(0)
  final String title;
  //Date
  @HiveField(1)
  final String dateTime;
  //Location
  @HiveField(2)
  final String location;
  //Image
  @HiveField(3)
  final String image;
  //Description
  @HiveField(4)
  final String description;

  Model(this.title, this.dateTime, this.location, this.image, this.description);
}
