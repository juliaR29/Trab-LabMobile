import 'package:proj/repository/data.dart';

class DataModel {
  String name;
  String logo;
  String description;
  String distance;
  List packages;

  DataModel({
    this.name,
    this.description,
    this.logo,
    this.distance,
    this.packages
  });

  factory DataModel.fromJson(Map<String, dynamic> parsedJson){

    return DataModel(
      name: parsedJson['name'],
      logo : parsedJson['logo'],
      description : parsedJson['description'],
      distance : parsedJson['distance'],
      packages : parsedJson['packages'],
    );
  }
}