import 'package:auto_sera/src/home/domain/entities/product.dart';
import 'package:auto_sera/src/home/domain/usecases/get_product.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._getProduct) : super(ProductInitial()) {
    on<GetProductEvent>(_getProductHandler);
  }

   final GetProduct _getProduct;

  Future<void> _getProductHandler(
      GetProductEvent event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    final result = await _getProduct();
    result.fold(
        (failure) => emit(ProductError(
            '${failure.statusCode}' 'Error: ${failure.errorMessage}')),
        (data) => emit(ProductSuccess(data)));
  }
}
