class BaseResponseModel<T> {
  late T data;
  late int status; // default is 200
  late String message;

  BaseResponseModel();

  BaseResponseModel.withAllParams(this.data, this.status, this.message);

  Map<String, dynamic> toJson() {
    return {"data": data, "status": status, "message": message};
  }

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel.withAllParams(
      json["data"],
      json["status"],
      json["message"],
    );
  }
}
