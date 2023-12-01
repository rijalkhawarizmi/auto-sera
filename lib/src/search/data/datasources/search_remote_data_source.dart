import 'package:auto_sera/core/utils/constants.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../models/search_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<ProductModel>> search({String? title});
}

class SearchRemoteDataSrcImpl implements SearchRemoteDataSource {
  SearchRemoteDataSrcImpl(this._dio);
  Dio _dio;

  @override
  Future<List<ProductModel>> search({String? title}) async {
    try {
      final response = await _dio
          .get('$baseUrl/products?title=$title');
      if (response.statusCode != 200) {
        throw ApiException(
            message: response.data, statusCode: response.statusCode!);
      }
      return List<DataMap>.from(response.data as List)
          .map((data) => ProductModel.fromMap(data))
          .toList();
    } on ApiException {
      rethrow;
    } catch (e) {
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
