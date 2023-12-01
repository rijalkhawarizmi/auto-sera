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
    // final states = state;
    // if (states is ListCarts) {
    //   listCarts.add(CartModel(title: event.title, price: event.price));
    //   states.listCarts.addAll(listCarts);
    //   listCarts.addAll(states.listCarts);
    //   // listCarts.clear();
    // }
    // print('ada kah ${listCarts}');
    // listCarts.forEach((e) {
    //   print('${e.title}');
    // });

    // print('nilai $result');
    listCarts.add(CartModel(
        title: event.title, price: event.price, quantity: event.quantity,image: event.image));
    // print('haha ${listCarts}');
  }

  void _getCarts(EventGetCarts event, Emitter<CartsState> emit) {
    emit(ListCarts(listCarts: listCarts));
  }

  void _addItem(EventQuantity event, Emitter<CartsState> emit) {
    final states = state;
    final haha = states is CartsCount ? states.quantity++ : 1;
    print('hahah $haha');
    emit(CartsCount(quantity: haha));
  }
}
