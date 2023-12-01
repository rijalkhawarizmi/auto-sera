import 'dart:convert';
import 'package:auto_sera/core/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({required String email, required String password});
}

class AuthRemoteDataSrcImpl implements AuthenticationRemoteDataSource {
  AuthRemoteDataSrcImpl(this._dio);
  Dio _dio;

  // final http.Client _client;
  @override
  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post(
          '$baseUrl/auth/login',
          data: {"email": email, "password": password});

      if (response.statusCode != 200 && response.statusCode != 201) {
        
        throw ApiException(
            message: 'Email atau Password salah',
            statusCode: response.statusCode!);
      }
    } on DioException catch (e) {
      throw ApiException(message: e.response!.statusMessage!, statusCode: e.response!.statusCode!);
    }
  }
}
