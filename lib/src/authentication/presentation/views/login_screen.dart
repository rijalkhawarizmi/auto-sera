import 'package:auto_sera/src/authentication/presentation/widget/toast_widget.dart';
import 'package:auto_sera/src/home/presentation/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../bloc/authentication_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  // void getUsers() {
  //   context.read<AuthenticationCubit>().getUsers();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationSuccess) {
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (c) {
              return const HomeProduct();
            }), (route) => false);
          } else if (state is AuthenticationError) {
            toastWidget(state.message);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Column(
                children: [
                       Text(
                    'Shop IT',
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Shop from our store with ease',
                    style:
                        TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          contentPadding: const EdgeInsets.all(16),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.greenAccent.shade400,
                                  width: 2)),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              contentPadding: const EdgeInsets.all(16),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.greenAccent.shade400,
                                      width: 2)),
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent.shade400,
                              minimumSize: const Size(double.infinity, 50)),
                          onPressed: () {
                            if (email.text.isEmpty) {
                              toastWidget('Masukkan Email');
                            } else if (password.text.isEmpty) {
                              toastWidget('Masukkan Password');
                            } else {
                              context.read<AuthenticationBloc>().add(
                                  EventAuthentication(
                                      email: email.text,
                                      password: password.text));
                            }
                          },
                          child: state is AuthenticationLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 20),
                                )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Didn\'t have any account? Sign Up here',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15),
                        ),
                      )
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
