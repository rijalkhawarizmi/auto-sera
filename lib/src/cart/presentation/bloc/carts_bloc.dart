import 'package:auto_sera/src/cart/data/models/carts_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carts_event.dart';
part 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  CartsBloc() : super(CartsInitial()) {
    on<AddCartEvent>(_addCarts);
    on<EventGetCarts>(_getCarts);
    on<EventQuantity>(_addItem);
  }

  List<CartModel> listCarts = [];
  int item = 1;
  void _addCarts(AddCartEvent event, Emitter<CartsState> emit) {
    listCarts.add(CartModel(
        title: event.title,
        price: event.price,
        quantity: event.quantity,
        image: event.image));
  }

  void _getCarts(EventGetCarts event, Emitter<CartsState> emit) {
    emit(ListCarts(listCarts: listCarts));
  }

  void _addItem(EventQuantity event, Emitter<CartsState> emit) {
    final states = state;
    final count = states is CartsCount ? states.quantity++ : 1;

    emit(CartsCount(quantity: count));
  }
}
