import 'data/api/user_api.dart';
import 'data/data_source/user_data_source.dart';

void main() async {
  final userApi = UserApi(accessToken: 'ВАШ_ACCESS_TOKEN');

  final userDataSource = UserDataSource(userApi: userApi);

  try {
    final users = await userDataSource.getUsers(userIds: [1, 2, 3]);
    for (var user in users) {
      print('User: ${user.name}, Email: ${user.email}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
