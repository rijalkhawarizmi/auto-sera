import '../../../../core/utils/typedef.dart';
import '../entities/product.dart';

abstract class ProductRepository{
 const ProductRepository();

 ResultFuture<List<Product>> getListProduct(); 

}