import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zipting/app/data/model/wishlist/wishlist_model.dart';
import 'package:zipting/main.dart';

class WishlistProvider {
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
        "$SERVER_IP/wishlists",
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
          headers: {
            "authorization": "Bearer ${GetStorage().read('token')}",
          },
        ),
        data: requestModel.toJson(),
      );

      if (response.statusCode == 200) {
        logger.d(response.data);
        return WishlistResponseModel.formJson(response.data);
      } else {
        throw Exception('faild to load request');
      }
    } on DioError catch (e) {
      logger.d(e);
    }
  }
}
