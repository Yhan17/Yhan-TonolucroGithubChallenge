import '/features/user_profile/domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required String nick,
    required String name,
    required String avatar,
    required String bio,
  }) : super(nick: nick, avatar: avatar, bio: bio, name: name);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        nick: json['login'].toString(),
        name: json['name'].toString(),
        avatar: json['avatar_url'].toString(),
        bio: json['bio'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'nick': nick,
        'name': name,
        'avatar_url': avatar,
        'bio': bio,
      };
}
