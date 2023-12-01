import 'package:dartz/dartz.dart';
import 'package:auto_sera/core/utils/typedef.dart';
import 'package:auto_sera/src/home/data/datasources/product_remote_data_source.dart';
import 'package:auto_sera/src/home/domain/entities/product.dart';
import 'package:auto_sera/src/home/domain/repositories/product_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

class ProductRepositoryImplementation extends ProductRepository {
  ProductRepositoryImplementation(this._productDataSource);
  ProductRemoteDataSource _productDataSource;
  @override
  ResultFuture<List<Product>> getListProduct() async {
    // TODO: implement getListHome
    try {
      final result = await _productDataSource.getListProduct();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
