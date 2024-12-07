import '../api/user_api.dart';
import '../../domain/models/user.dart';
import '../dto/user_dto.dart';

class UserDataSource {
  final UserApi userApi;

  UserDataSource({required this.userApi});


  Future<List<User>> getUsers({List<int>? userIds}) async {
    final List<UserDto> userDtos = await userApi.getUsers(userIds: userIds);


    return userDtos.map((dto) => User(
      id: dto.id,
      name: dto.name??'',
      email: dto.email??'',
    )).toList();
  }
}
