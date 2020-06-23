class ResultData {
  var data;
  bool result;
  int code;
  var headers;
  String errorMessage;
  ResultData(this.data, this.result, this.code, {this.headers, this.errorMessage});
}

class ResultCode {
  static const SUCCESS = 200;

  ///网络错误
  static const NETWORK_ERROR = -1;

  ///网络超时
  static const NETWORK_TIMEOUT = -2;

  ///网络返回数据格式化一次
  static const NETWORK_JSON_EXCEPTION = -3;

  ///Github APi Connection refused
  static const GITHUB_API_REFUSED = -4;

  static const UNKNOWN_ERROR = -5;
}
