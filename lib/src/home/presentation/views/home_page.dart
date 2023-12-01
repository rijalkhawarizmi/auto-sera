import 'package:auto_sera/src/cart/presentation/bloc/carts_bloc.dart';
import 'package:auto_sera/src/home/presentation/bloc/product_bloc.dart';
import 'package:auto_sera/src/home/presentation/views/detail_page.dart';
import 'package:auto_sera/src/search/presentation/views/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/views/carts_page.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  final nameControllers = TextEditingController();
  void getUsers() {
    context.read<ProductBloc>().add(GetProductEvent());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 1.3;
    final double itemWidth = size.width / 1.6;
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'IT Shop',
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return CartsPage();
                      }));
                    },
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c) {
                        return SearchPage();
                      }));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ))
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Halo, Rijal',
                        style: TextStyle(
                            fontSize: 20, color: Colors.grey.shade700),
                      ),
                      Text(
                        'What are you looking for today?',
                        style: TextStyle(
                            fontSize: 33, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                state is ProductLoading
                    ?Expanded(
                      child: Center(
                          child: CircularProgressIndicator(),
                        ),
                    )
                    : state is ProductSuccess
                        ? Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: GridView.count(
                                physics: BouncingScrollPhysics(),
                                crossAxisSpacing: 9,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                                childAspectRatio: (itemWidth / itemHeight),
                                controller: new ScrollController(
                                    keepScrollOffset: false),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: state.product.map((value) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (c){
                                        return DetailPage(product: value);
                                      }));
                                     
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade200,
                                                offset: Offset(1, 3))
                                          ],
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 200,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        value.category?.image ??
                                                            ''),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value.title!,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      'USD ${value.price}',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text('⭐️'),
                                                  Text('4.1'),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text('334 Reviews'),
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        : SizedBox.shrink()
              ],
            ));
      },
    );
  }
}
