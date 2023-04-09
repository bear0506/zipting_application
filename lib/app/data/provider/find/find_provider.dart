import 'package:dio/dio.dart';
import 'package:zipting/app/data/model/find/find_model.dart';
import "package:zipting/main.dart";

class FindEmailProvider {
  dio({dynamic requestModel}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      logger.d(requestModel.toJson());

      Response<dynamic> response = await dio.post(
        "$SERVER_IP/app/find/email",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        logger.d(response.data);
        return FindBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}

class FindPassWordProvider {
  dio({dynamic requestModel}) async {
    final Dio dio = Dio();

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));

    try {
      logger.d(requestModel.toJson());

      Response<dynamic> response = await dio.post(
        "$SERVER_IP/app/find/password",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        logger.d(response.data);
        return FindBaseResponseModel.fromJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
