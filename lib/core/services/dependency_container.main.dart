part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // feature => Calculate Number
  sl
    ..registerFactory(
      () => CalculateBloc(
        typeOne: sl(),
        typeTwo: sl(),
        typeThree: sl(),
        typeFour: sl(),
      ),
    )
  // usecases
    ..registerLazySingleton(() => ArithmeticSequenceTypeOne(repository: sl()))
    ..registerLazySingleton(() => ArithmeticSequenceTypeTwo(repository: sl()))
    ..registerLazySingleton(() => ArithmeticSequenceTypeThree(repository: sl()))
    ..registerLazySingleton(() => ArithmeticSequenceTypeFour(repository: sl()))
  // repositories
    ..registerLazySingleton<CalculateRepository>(
      () => CalculateRepositoryImpl(dataSource: sl()),
    )
  // datasources
    ..registerLazySingleton<CalculateDataSource>(CalculateDataSourceImpl.new);
}
