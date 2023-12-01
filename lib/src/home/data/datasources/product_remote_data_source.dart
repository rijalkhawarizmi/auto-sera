import 'package:auto_sera/core/utils/constants.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/typedef.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getListProduct();
}

class ProductRemoteDataSrcImpl implements ProductRemoteDataSource {
  ProductRemoteDataSrcImpl(this._dio);
  Dio _dio;

  @override
  Future<List<ProductModel>> getListProduct() async {
    try {
     
      final response = await _dio.get('$baseUrl/products');
      
      if (response.statusCode != 200) {
        throw ApiException(
            message: response.data, statusCode: response.statusCode!);
      }
      return List<DataMap>.from(response.data as List)
          .map((homeData) => ProductModel.fromMap(homeData))
          .toList();
    } on ApiException {
      rethrow;
    } catch (e) {
      print('hehe ${e.toString()}');
      throw ApiException(message: e.toString(), statusCode: 505);
    }
  }
}
