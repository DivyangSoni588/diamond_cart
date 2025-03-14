import 'package:diamond_cart/src/home/data/data_sources/diamond_data_source.dart';
import 'package:diamond_cart/src/home/data/data_sources/local_diamond_data_source.dart';
import 'package:diamond_cart/src/home/data/repositories/diamond_repository_impl.dart';
import 'package:diamond_cart/src/home/domain/repositories/diamond_repository.dart';
import 'package:diamond_cart/src/home/domain/usecases/get_all_diamonds_usecase.dart';
import 'package:diamond_cart/src/home/domain/usecases/get_filtered_diamond_use_case.dart';
import 'package:diamond_cart/src/home/domain/usecases/sort_diamonds_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Data sources
  getIt.registerLazySingleton<DiamondDataSource>(() => LocalDiamondDataSource());

  // Repositories
  getIt.registerLazySingleton<DiamondRepository>(
    () => DiamondRepositoryImpl(getIt<DiamondDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetAllDiamondsUseCase(getIt<DiamondRepository>()));
  getIt.registerLazySingleton(() => GetFilteredDiamondUseCase(getIt<DiamondRepository>()));
  getIt.registerLazySingleton(() => SortDiamondsUseCase(getIt<DiamondRepository>()));
}
