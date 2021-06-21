import 'package:tonolucro_challenge/features/repository_contributors/domain/entities/contributor_entity.dart';

class ContributorModel extends ContributorEntity {
  const ContributorModel(
      {required String nick,
      required int contributions,
      required String avatar})
      : super(avatar: avatar, contributions: contributions, nick: nick);

  factory ContributorModel.fromJson(Map<String, dynamic> json) =>
      ContributorModel(
        nick: json['login'].toString(),
        avatar: json['avatar_url'].toString(),
        contributions: int.parse(json['contributions'].toString()),
      );

  Map<String, dynamic> toJson() =>
      {'nick': nick, 'avatar': avatar, 'contributions': contributions};

  factory ContributorModel.fromMap(Map<String, dynamic> map) {
    return ContributorModel(
      nick: map['login'].toString(),
      avatar: map['avatar_url'].toString(),
      contributions: int.parse(map['contributions'].toString()),
    );
  }
}
