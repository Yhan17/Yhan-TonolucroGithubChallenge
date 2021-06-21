import 'package:equatable/equatable.dart';
import '/features/user_profile/domain/entities/user_repos_entity.dart';

class UserProfileEntity extends Equatable {
  final String nick;
  final String name;
  final String avatar;
  final String bio;

  const UserProfileEntity({
    required this.nick,
    required this.name,
    required this.avatar,
    required this.bio,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [nick, name, avatar, bio];
}
