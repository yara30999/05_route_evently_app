import 'package:hive/hive.dart';
part 'auth_entity.g.dart';

@HiveType(typeId: 0)
class AuthenticationEntity {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;

  const AuthenticationEntity({
    required this.uid,
    required this.name,
    required this.email,
  });
}
