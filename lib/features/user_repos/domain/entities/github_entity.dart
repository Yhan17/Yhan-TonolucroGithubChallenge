import 'package:equatable/equatable.dart';

class GithubEntity extends Equatable {
  final String nick;
  final String name;
  final String avatar;
  final String bio;

  const GithubEntity(
      {required this.nick,
      required this.name,
      required this.avatar,
      required this.bio});

  @override
  // TODO: implement props
  List<Object?> get props => [nick, name, avatar, bio];
}
