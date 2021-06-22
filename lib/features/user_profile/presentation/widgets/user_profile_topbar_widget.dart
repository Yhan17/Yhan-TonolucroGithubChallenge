import 'package:flutter/material.dart';

class UserProfileTopbarWidget extends PreferredSize {
  static const size = Size.fromHeight(250);
  UserProfileTopbarWidget()
      : super(
            preferredSize: size,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(900),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://ui-avatars.com/api/?name=Yhan&color=ffffff&background=6a86a1"),
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
                                "Yhan17",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "SF Pro Display"),
                              ),
                              Text("Yhan Nunes",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontFamily: "SF Pro Display"))
                            ],
                          ),
                        )
                      ],
                    ),
                    Text("Biografia",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "SF Pro Display"))
                  ],
                ),
              ),
            ));
}
