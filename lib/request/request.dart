import 'package:dio/dio.dart';

class DioManager {
  static DioManager _instance;
  static DioManager getInstance() {
    if(_instance == null) {
      _instance = DioManager();
    }
    return _instance;
  }

  Dio dio = Dio();
  DioManager() {
    dio.options.baseUrl = "http://120.27.212.80:9090";
    dio.options.headers = {
        "content-type": "application/json"
    };
    dio.options.connectTimeout = 5000; 
    dio.options.receiveTimeout = 5000;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:(RequestOptions options) async {
          // 在请求被发送之前做一些事情
          print(options);
          return options; //continue
          // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
          // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
          // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
          // 这样请求将被中止并触发异常，上层catchError会被调用。
        },
        onResponse:(Response response) async {
          // 在返回响应数据之前做一些预处理
          return response; // continue
        },
        onError: (DioError e) async {
          // 当请求失败时做一些预处理
        return e;//continue
        }
      )
    );
  }

  //get请求
  Future get(String url, Object params) async {
    try {
      Response response = await dio.get(url, queryParameters: params);
      return response.data;
    } catch(error) {
      return error;
    }
  }

   //post请求
  Future post(String url, Object params) async {
    print(params);
    try {
      Response response = await dio.post(url, data: params);
      return response.data;
    } catch(error) {
      return error;
    }
  }
}