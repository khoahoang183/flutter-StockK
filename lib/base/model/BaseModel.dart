// ignore: file_names
class BaseModel {
  int id = -1;

  /// Base constructor
  BaseModel();

  BaseModel.withAllParams(this.id);

  /// Function to implement dummy data when API not implemented yet
  List<dynamic> createDummyData() => [];

  /// Function parse object to Json
  Map<String, dynamic> toJson() => {"id": id};

  /// Function parse Json to object
  BaseModel.fromJson(Map<String, dynamic> json);

  /// Static Function to parse Json T class
  static fromJsonModel(Map<String, dynamic> json) => BaseModel.fromJson(json);
}
