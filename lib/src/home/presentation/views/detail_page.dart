import 'package:auto_sera/src/cart/presentation/views/carts_page.dart';
import 'package:auto_sera/src/home/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/bloc/carts_bloc.dart';
import '../../../search/presentation/views/search_page.dart';

class DetailPage extends StatelessWidget {
  Product product;
  DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
       
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
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${product.category!.image}'),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'USD ${product.price}',
                          style: TextStyle(
                              color: Colors.greenAccent.shade400,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.greenAccent.shade400,
                          size: 30,
                        )
                      ],
                    ),
                    Text(
                      product.title!,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Text('⭐️'),
                          Text('4.1'),
                          SizedBox(
                            width: 10,
                          ),
                          Text('334 Reviews'),
                        ],
                      ),
                    ),
                    Text(product.description!),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade400,
                  minimumSize: const Size(double.infinity, 50)),
              onPressed: () {
                context.read<CartsBloc>().add(AddCartEvent(
                    title: product.title!,
                    price: product.price.toString(),
                    quantity: 1,
                    image: product.category!.image!));
              },
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
