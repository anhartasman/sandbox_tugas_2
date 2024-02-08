import 'package:course_flutter/architectures/domain/entities/UserAccount.dart';
import 'package:course_flutter/architectures/domain/entities/UserAuth.dart';

abstract class AuthRepository {
  Future<UserAccount> authenticate(UserAuth userAuth);
}
