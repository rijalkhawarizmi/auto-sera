part of 'carts_bloc.dart';

abstract class CartsState extends Equatable {
  const CartsState();

  @override
  List<Object> get props => [];
}

class CartsInitial extends CartsState {}

class ListCarts extends CartsState {
  final List<CartModel> listCarts;
  const ListCarts({required this.listCarts});
}

class CartsCount extends CartsState {
  int quantity;

  CartsCount({required this.quantity});
}
