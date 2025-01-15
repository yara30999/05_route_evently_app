import 'package:hive/hive.dart';
import '../domain/entities/auth_entity.dart';
import '../presentation/resourses/constants_manager.dart';

Future<void> hiveBoxes() async {
  await Hive.openBox<AuthenticationEntity>(AppConstants.kUserDataBox);
}

void hiveAdapters() {
  Hive.registerAdapter(AuthenticationEntityAdapter());
}
