import 'package:flutter_project/apis/products_api.dart';
import 'package:flutter_project/apis/user_api.dart';
import 'package:flutter_project/db/repositories/product_cache_repository.dart';
import 'package:flutter_project/db/repositories/product_repository.dart';
import 'package:flutter_project/db/repositories/user_repository.dart';
import 'package:flutter_project/providers/auth_provider.dart';
import 'package:flutter_project/providers/product_provider.dart';
import 'package:flutter_project/services/auth_service.dart';
import 'package:flutter_project/services/product_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ServiceLocator {
  static Future initAllSingletons() async {
    // repositories
    GetIt.I.registerLazySingleton<UserRepository>(() => UserRepository());
    GetIt.I.registerLazySingleton<ProductRepository>(() => ProductRepository());
    GetIt.I.registerLazySingleton<ProductCacheRepository>(
        () => ProductCacheRepository());

    // HTTP client
    GetIt.I.registerLazySingleton<http.Client>(() => http.Client());

    // apis
    GetIt.I.registerLazySingleton<ProductsApi>(
        () => ProductsApi(GetIt.instance<http.Client>()));
    GetIt.I.registerLazySingleton<UserApi>(
        () => UserApi(GetIt.instance<http.Client>()));

    // services
    GetIt.I.registerLazySingleton<AuthService>(
      () => AuthService(
        GetIt.instance<UserApi>(),
        GetIt.instance<UserRepository>(),
        GetIt.instance<ProductRepository>(),
        GetIt.instance<ProductCacheRepository>(),
      ),
    );
    GetIt.I.registerLazySingleton<ProductService>(
      () => ProductService(
        GetIt.instance<ProductsApi>(),
        GetIt.instance<ProductCacheRepository>(),
        GetIt.instance<ProductRepository>(),
      ),
    );

    // change notifiers (providers)
    GetIt.I.registerLazySingleton<AuthProvider>(
        () => AuthProvider(GetIt.instance<AuthService>()));
    GetIt.I.registerLazySingleton<ProductProvider>(
        () => ProductProvider(GetIt.instance<ProductService>()));
  }
}
