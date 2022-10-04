abstract class BaseResponseModel<T> {
  late T result;
  late int status; // default is 200
  late String message;

  BaseResponseModel();

  BaseResponseModel.withAllParams(this.result, this.status, this.message);

  Map<String, dynamic> toJson() {
    return {"result": result, "status": status, "message": message};
  }

  BaseResponseModel fromJson(Map<String, dynamic> json);

  Future<T?> fetchData({String url, Map<String, String> paramsData, Map<String, String> postData});
}
