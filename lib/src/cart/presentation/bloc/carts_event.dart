part of 'carts_bloc.dart';

abstract class CartsEvent extends Equatable {
  const CartsEvent();

  @override
  List<Object> get props => [];
}

class AddCartEvent extends CartsEvent {
  final String title;
  final String price;
  final String image;
  final int quantity;

  const AddCartEvent(
      {required this.title,
      required this.price,
      required this.image,
      required this.quantity});
  @override
  List<Object> get props => [title, price, quantity];
}

class EventGetCarts extends CartsEvent {}

class EventQuantity extends CartsEvent {
  int quantity;

  EventQuantity({required this.quantity});
}
