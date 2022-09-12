// ignore: file_names
abstract class BaseModel {
  int id = -1;

  /// Base constructor
  BaseModel();

  BaseModel.withAllParams(this.id);

  /// Function to implement dummy data when API not implemented yet
  List<dynamic> createDummyData();

  /// Function parse object to Json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }

  /// Function parse Json to object
  fromJson(Map<String, dynamic> json){
  }
}
