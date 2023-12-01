import 'package:auto_sera/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../src/authentication/data/datasources/authentication_remote_data_source.dart';
import '../../src/authentication/data/repositories/authentication_repository_implementation.dart';
import '../../src/authentication/domain/repositories/authentication_repository.dart';
import '../../src/authentication/domain/usecases/create_user.dart';
import '../../src/home/data/datasources/product_remote_data_source.dart';
import '../../src/home/data/repositories/product_repository_implementation.dart';
import '../../src/home/domain/repositories/product_repository.dart';
import '../../src/home/domain/usecases/get_product.dart';
import '../../src/home/presentation/bloc/product_bloc.dart';
import '../../src/search/data/datasources/search_remote_data_source.dart';
import '../../src/search/data/repositories/search_repository_implementation.dart';
import '../../src/search/domain/repositories/search_repository.dart';
import '../../src/search/domain/usecases/get_search.dart';
import '../../src/search/presentation/bloc/search_bloc.dart';

final sl = GetIt.instance;
final sls = GetIt.instance;
Dio _dio = Dio();

Future<void> init() async {
  sls..registerLazySingleton(() => _dio);

  sls
    ..registerFactory(
        () => AuthenticationBloc(createUser: sls()))
    ..registerLazySingleton(() => CreateUser(sls()))
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sls()))
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthRemoteDataSrcImpl(sls()));

  sls
    ..registerFactory(() => ProductBloc(sls()))
    ..registerLazySingleton(() => GetProduct(sls()))
    ..registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImplementation(sls()))
    ..registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSrcImpl(sls()));

  sls
    ..registerFactory(() => SearchBloc(sls()))
    ..registerLazySingleton(() => GetSearch(sls()))
    ..registerLazySingleton<SearchRepository>(
        () => SearchRepositoryImplementation(sls()))
    ..registerLazySingleton<SearchRemoteDataSource>(
        () => SearchRemoteDataSrcImpl(sls()));
}
