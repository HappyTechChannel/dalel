import 'package:dalel/core/utils/app_strings.dart';

class HistoricalPeriodsModel {
  final String name;
  final String image;
  final String discription;
  final Map<String, dynamic> wars;

  HistoricalPeriodsModel(
      {required this.name,
      required this.image,
      required this.discription,
      required this.wars});
  factory HistoricalPeriodsModel.fromJson(jsonData) {
    return HistoricalPeriodsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.description],
      wars: jsonData[FireBaseStrings.wars],
    );
  }
}
