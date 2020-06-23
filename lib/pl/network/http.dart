import 'dart:async';
import 'package:ccgithubclientflutter/pl/network/util/connectivity_request_retrier.dart';
import 'package:ccgithubclientflutter/pl/model/result_data.dart';
import 'package:ccgithubclientflutter/common/event/http_error_event.dart';
import 'package:ccgithubclientflutter/common/event/index.dart';
import 'package:ccgithubclientflutter/constants.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

import 'interceptors/error_interceptor.dart';
import 'interceptors/retry_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class Http {
  ///超时时间
  static const int CONNECT_TIMEOUT = 30000;
  static const int RECEIVE_TIMEOUT = 30000;
  static const GITHUB_BASE_URL = "https://api.github.com/";
  static Http _instance = Http._internal();

  factory Http() => _instance;

  Dio _dio;
  CancelToken _cancelToken = new CancelToken();

  Http._internal() {
    if (_dio == null) {
      // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
      BaseOptions options = new BaseOptions(
        baseUrl: GITHUB_BASE_URL,
        connectTimeout: CONNECT_TIMEOUT,
        // 响应流上前后两次接受到数据的间隔，单位为毫秒。
        receiveTimeout: RECEIVE_TIMEOUT,
        // Http请求头.
        headers: {},
      );

      _dio = new Dio(options);

      // 添加拦截器
      _dio.interceptors.add(ErrorInterceptor());
      _dio.interceptors.add(LogInterceptor());
      _dio.interceptors.add(TokenInterceptors());
      if (Constants.ENABLE_RETRY) {
        _dio.interceptors.add(
          RetryOnConnectionChangeInterceptor(
            requestRetrier: DioConnectivityRequestRetrier(
              dio: _dio,
              connectivity: Connectivity(),
            ),
          ),
        );
      }
      _dio.interceptors.add(LogInterceptor());
    }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init(
      {String baseUrl,
      int connectTimeout,
      int receiveTimeout,
      List<Interceptor> interceptors}) {
    _dio.options = _dio.options.merge(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  /// 设置headers
  void setHeaders(Map<String, dynamic> map) {
    _dio.options.headers.addAll(map);
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  /// restful get 操作
  Future<ResultData> get(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    try {
      response = await _dio.get(path,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken ?? _cancelToken);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  /// restful post 操作
  Future<ResultData> post(
    String path, {
    Map<String, dynamic> params,
    data,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    try {
      response = await _dio.post(path,
          data: data,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken ?? _cancelToken);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  /// restful put 操作
  Future<ResultData> put(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    try {
      response = await _dio.put(path,
          data: data,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken ?? _cancelToken);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  /// restful patch 操作
  Future<ResultData> patch(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    try {
      response = await _dio.patch(path,
          data: data,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken ?? _cancelToken);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  /// restful delete 操作
  Future<ResultData> delete(
    String path, {
    data,
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    try {
      response = await _dio.delete(path,
          data: data,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken ?? _cancelToken);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  /// restful post form 表单提交操作
  Future<ResultData> postForm(
    String path, {
    Map<String, dynamic> params,
    Options options,
    CancelToken cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response;
    try {
      response = await _dio.post(path,
          data: FormData.fromMap(params),
          options: requestOptions,
          cancelToken: cancelToken ?? _cancelToken);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  Future<ResultData> netFetch(url, params, Options options, CancelToken cancelToken) async {
    if (options == null) {
      options = Options(method: "GET");
    }
    Response response;
    try {
      response = await _dio.request(url, data: params, options: options);
    } on DioError catch (e) {
      return _resultError(e);
    }
    return ResultData(response.data, true, ResultCode.SUCCESS);
  }

  _resultError(DioError e) {
    Response errorResponse;
    String message = e?.message;
    if (e.response != null) {
      errorResponse = e.response;
    } {
      if (message != null && message is String && (message.contains("Connection refused") || message.contains("Connection reset"))) {
        errorResponse = Response(statusCode: ResultCode.GITHUB_API_REFUSED);
      } else {
        errorResponse = Response(statusCode: ResultCode.UNKNOWN_ERROR);
      }

    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT ||
        e.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = ResultCode.NETWORK_TIMEOUT;
    }
    final result = ResultData(null, false, errorResponse.statusCode);
    result.errorMessage = message;
    eventBus.fire(result);
    return result;
  }
}
