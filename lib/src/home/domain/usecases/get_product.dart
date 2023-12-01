


import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProduct extends UsecaseWithoutParams<List<Product>>{

  const GetProduct(this._homeRepository);
  final ProductRepository _homeRepository;
  
  @override 
  ResultFuture<List<Product>> call()async=>_homeRepository.getListProduct();

}