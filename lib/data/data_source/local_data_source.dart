import 'package:hive/hive.dart';
import '../../domain/entities/auth_entity.dart';
import '../../presentation/resourses/constants_manager.dart';

abstract class LocalDataSource {
  AuthenticationEntity fetchUserData();
  Future<void> saveUserDataToCache(AuthenticationEntity authEntity);
  Future<void> clearAllCachedBoxes();
}

class LocalDataSourceImpl implements LocalDataSource {
  var userBox = Hive.box<AuthenticationEntity>(AppConstants.kUserDataBox);

  @override
  AuthenticationEntity fetchUserData() {
    //because we only have one use for the entire app
    //so we want to return the first item in the iterable
    AuthenticationEntity userData;
    try {
      userData = userBox.values.first;
    } catch (e) {
      userData = const AuthenticationEntity(
          uid: '1111', name: 'dummy', email: 'dummy');
    }
    return userData;
  }

  @override
  Future<void> saveUserDataToCache(AuthenticationEntity authEntity) async {
    await userBox.add(authEntity);
  }

  @override
  Future<void> clearAllCachedBoxes() async {
    await userBox.clear();
  }
}
