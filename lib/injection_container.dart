import 'package:course_flutter/architectures/data/repositories/DataAuthRepository.dart';
import 'package:course_flutter/architectures/domain/repositories/AuthRepository.dart';
import 'package:course_flutter/architectures/domain/repositories/ProfileRepository.dart';
import 'package:course_flutter/architectures/domain/usecases/UserLoginUseCase.dart';
import 'package:course_flutter/architectures/domain/usecases/UserProfileUseCase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Use cases
  sl.registerLazySingleton(() => UserLoginUseCase(sl()));
  sl.registerLazySingleton(() => UserProfileUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => DataAuthRepository(),
  );
}
