import 'package:flutter/material.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  final image = "assets/images/github.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pesquise no Github",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'SF Pro Display',
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Escreva o nickname de um usuário",
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontFamily: 'SF Pro Display',
                      fontSize: 16),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 29),
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      onChanged: (param) {},
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 40),
                          ),
                          labelText: "Usuário",
                          labelStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white))),
                ),
                TextButton(
                  onPressed: () => {print("Button Click")},
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF24292E)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 44, vertical: 14))),
                  child: const Text(
                    'Buscar',
                    style: TextStyle(
                        color: Color(0xFF2188FF),
                        fontSize: 32,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
