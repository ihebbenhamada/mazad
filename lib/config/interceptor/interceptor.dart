import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../api-urls/end_points.dart';

class AppInterceptor {
  static Dio? _dio;
  static ResponseType responseType = ResponseType.json;

  /// INTERCEPTOR SETUP
  static Dio? get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.BASE_URL,
          connectTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 50),
        ),
      );

      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions requestOptions,
            RequestInterceptorHandler handler,
          ) {
            showLoader();
            if (requestOptions.method == 'GET') {
              requestOptions.queryParameters.removeWhere(
                (key, value) => value == null,
              );
            }
            requestOptions.responseType = responseType;
            requestOptions.headers.addAll({
              HttpHeaders.contentTypeHeader: "application/json",
            });
            handler.next(requestOptions);
          },
          onResponse: (
            response,
            ResponseInterceptorHandler handler,
          ) {
            hideLoader();
            _reestablishDefaultConfig();
            handler.next(response);
          },
          onError: (
            DioError error,
            ErrorInterceptorHandler handler,
          ) {
            EasyLoading.dismiss();
            _reestablishDefaultConfig();
            _handleError(error);
            handler.next(error);
          },
        ),
      );
    }

    return _dio;
  }

  /// Loader Setup
  static bool loaderEnabled = true;

  // static get savedToken => null;
  static void showLoader() {
    if (loaderEnabled) EasyLoading.show();
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  static void enableLoader() {
    AppInterceptor.loaderEnabled = true;
  }

  static void disableLoader() {
    AppInterceptor.loaderEnabled = false;
  }

  /// ERROR HANDLER

  static void _handleError(DioError error) {}

  static void _reestablishDefaultConfig() {
    responseType = ResponseType.json;
  }
}
