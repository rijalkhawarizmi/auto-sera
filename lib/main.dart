import 'package:auto_sera/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:auto_sera/src/authentication/presentation/views/login_screen.dart';
import 'package:auto_sera/src/cart/presentation/bloc/carts_bloc.dart';
import 'package:auto_sera/src/home/presentation/bloc/product_bloc.dart';
import 'package:auto_sera/src/home/presentation/views/home_page.dart';
import 'package:auto_sera/src/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
           BlocProvider(
            create: (context) => sls<AuthenticationBloc>(),
          ),
          BlocProvider(
            create: (context) => sls<ProductBloc>(),
          ),
          BlocProvider(
            create: (context) => CartsBloc(),
          ),
          BlocProvider(
            create: (context) => sls<SearchBloc>()
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LoginPage()
        ));
  }
}
