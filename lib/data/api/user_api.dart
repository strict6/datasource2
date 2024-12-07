import 'dart:convert';
import 'package:http/http.dart' as http;
import '../dto/user_dto.dart';

class UserApi {
  final String baseUrl;
  final String accessToken;
  final String apiVersion;

  UserApi({
    this.baseUrl = 'https://api.vk.com/method/users.get',
    required this.accessToken,
    this.apiVersion = '5.199',
  });


  Future<List<UserDto>> getUsers({List<int>? userIds}) async {
    final url = Uri.parse('$baseUrl/users.get');
    final response = await http.post(
      url,
      body: {
        'user_ids': userIds?.join(',') ?? '',
        'fields': 'id,first_name,last_name',
        'access_token': accessToken,
        'v': apiVersion,
      },
    );
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> users = data['response'];
    return users.map((json) => UserDto.fromJsonVK(json)).toList();

  }
}
