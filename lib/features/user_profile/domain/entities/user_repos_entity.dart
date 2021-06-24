import 'package:equatable/equatable.dart';

class UserRepoEntity extends Equatable {
  final String name;
  final String? description;
  final String? language;
  final DateTime updatedAt;
  final int stars;
  final int forks;

  const UserRepoEntity( 
      {required this.name,
      this.description,
      this.language,
      required this.stars,
      required this.forks,required this.updatedAt,});

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, language, stars, forks];
}
