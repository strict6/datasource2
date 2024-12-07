class UserDto {
  final int id;
  final String? name;
  final String? email;

  UserDto({
    required this.id,
    this.name,
    this.email,
  });

  factory UserDto.fromJsonVK(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: '${json['first_name']} ${json['last_name']}',
    );
  }
}
