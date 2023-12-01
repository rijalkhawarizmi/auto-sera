part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {
  const ProductLoading();
}
class ProductSuccess extends ProductState {
  const ProductSuccess(this.product);

  final List<Product> product;
  @override
  List<Object> get props => product.map((e) => e.id!).toList();
}

class ProductError extends ProductState {
  const ProductError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}