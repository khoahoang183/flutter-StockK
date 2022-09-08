// ignore: file_names
abstract class BaseModel {
  int id = -1;

  /// Base constructor
  BaseModel();

  /// Function to implement dummy data when API not implemented yet
  List<dynamic> createDummyData();

  /// Function to implement dummy data when API not implemented yet
  Map<String,dynamic> toJson(){
    return {
      "id": id,
    };
  }
}
