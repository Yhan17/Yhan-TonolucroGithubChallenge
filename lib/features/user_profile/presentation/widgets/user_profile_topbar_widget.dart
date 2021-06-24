import 'package:flutter/material.dart';
import 'package:tonolucro_challenge/features/user_profile/domain/entities/user_profile_entity.dart';

class UserProfileTopbarWidget extends PreferredSize {
  final UserProfileEntity entity;
  static const size = Size.fromHeight(250);
  UserProfileTopbarWidget({required this.entity})
      : super(
            preferredSize: size,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(900),
                              image: DecorationImage(
                                  image: NetworkImage(entity.avatar),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 19.0),
                            height: 90,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  entity.nick,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display"),
                                ),
                                Text(entity.name,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontFamily: "SF Pro Display"))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        entity.bio,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "SF Pro Display"),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ));
}
