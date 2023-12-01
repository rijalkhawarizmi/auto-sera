import '../../../../core/utils/typedef.dart';
import '../entities/search.dart';

abstract class SearchRepository{
 const SearchRepository();

 ResultFuture<List<Product>> search({String? title}); 

}