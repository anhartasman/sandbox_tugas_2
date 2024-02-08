import 'package:course_flutter/architectures/domain/entities/UserProfile.dart';

abstract class ProfileRepository {
  Future<UserProfile> userProfile();
}
