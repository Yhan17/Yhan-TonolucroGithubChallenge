import '/features/user_profile/domain/entities/user_repos_entity.dart';

class UserRepoModel extends UserRepoEntity {
  const UserRepoModel(
      {required String name,
      required int forks,
      required String description,
      required String language,
      required DateTime updatedAt,
      required int stars})
      : super(
            forks: forks,
            name: name,
            stars: stars,
            description: description,
            language: language,
            updatedAt: updatedAt);

  factory UserRepoModel.fromJson(Map<String, dynamic> json) => UserRepoModel(
        name: json['name'].toString(),
        description: json['description'].toString(),
        updatedAt: DateTime.parse(json["updated_at"].toString()),
        language: json['language'].toString(),
        forks: int.parse(json['forks'].toString()),
        stars: int.parse(json['stargazers_count'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': forks,
        'language': description,
        'forks': language,
        'stars': stars,
      };

  factory UserRepoModel.fromMap(Map<String, dynamic> map) {
    return UserRepoModel(
      name: map['name'].toString(),
      description: map['description'].toString(),
      updatedAt: DateTime.parse(map["updated_at"].toString()),
      language: map['language'].toString(),
      forks: int.parse(map['forks'].toString()),
      stars: int.parse(map['stargazers_count'].toString()),
    );
  }
}
