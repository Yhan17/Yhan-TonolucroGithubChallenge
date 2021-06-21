import 'package:equatable/equatable.dart';

class ContributorEntity extends Equatable {
  final int contributions;
  final String nick;
  final String avatar;

  const ContributorEntity(
      {required this.nick,
      required this.contributions,
      required this.avatar,});

  @override
  // TODO: implement props
  List<Object?> get props => [nick, contributions, avatar];
}
