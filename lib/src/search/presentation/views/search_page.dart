

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cart/presentation/views/carts_page.dart';
import '../../../home/presentation/views/detail_page.dart';
import '../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController? searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SearchBloc>().add(EventSearch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              // backgroundColor: Colors.white,
              title: Text('Search', style: TextStyle(color: Colors.black)),
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
                      size: 25,
                    ))
              ],
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        context
                            .read<SearchBloc>()
                            .add(EventSearch(title: value));
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        contentPadding: const EdgeInsets.all(16),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2)),
                      )),
                ),
                state is SearchLoading
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : state is SearchError
                        ? Expanded(
                            child: Center(
                            child: Text(state.message,style: TextStyle(fontSize: 30),),
                          ))
                        : state is SearchSuccess
                            ? Expanded(
                                child: ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  itemCount: state.search.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.grey.shade200),
                                        borderRadius:
                                            BorderRadius.circular(10),
                                      ),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 10),
                                              height: 120,
                                              width: 130,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        6),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(state
                                                          .search[index]
                                                          .category
                                                          ?.image ??
                                                      ''),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state
                                                      .search[index].title!,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors
                                                          .grey.shade700),
                                                ),
                                                Text(
                                                  'USD ${state.search[index].price}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '⭐️ 4.2',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                          color: Colors.grey
                                                              .shade700),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      '324 Reviews',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                          color: Colors.grey
                                                              .shade700),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ]),
                                    );
                                  },
                                ),
                              )
                            : SizedBox.shrink(),
              ],
            ));
      },
    );
  }
}

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({Key? key, this.nameController}) : super(key: key);

  final TextEditingController? nameController;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Column(children: [
            TextField(
              controller: nameController,
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       context.read<AuthenticationCubit>().createUser(
            //           createdAt: DateTime.now().toString(),
            //           name: nameController!.text,
            //           avatar:
            //               'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1124.jpg');
            //       Navigator.pop(context);
            //     },
            //     child: Text('create uSER'))
          ]),
        ),
      ),
    );
  }
}
