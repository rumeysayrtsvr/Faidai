import 'package:flutter/material.dart';
import 'package:first_app/main.dart';
import 'package:hexcolor/hexcolor.dart';

class Kayit extends StatelessWidget {
  const Kayit({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 27.0,
                color: HexColor("#FF003E"),
              ),
              const Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 80.0)),
                      Image(image: AssetImage("lib/images/pana1.png"))
                    ],
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                  Text(
                    "FAID",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "AI",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Row(
                children: [
                  const Padding(
                      padding: EdgeInsets.only(
                    top: 10.0,
                    left: 30.0,
                  )),
                  Text(
                    "Create new account",
                    style: TextStyle(
                      color: HexColor("#C1C1C1"),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("#FF003E"),
                      ),
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: HexColor("#C1C1C1"),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("#FF003E"),
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: HexColor("#C1C1C1"),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("#FF003E"),
                      ),
                    ),
                    labelText: "Password Again",
                    labelStyle: TextStyle(
                      color: HexColor("#C1C1C1"),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              // ignore: avoid_unnecessary_containers
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(348, 52),
                      backgroundColor: HexColor("#FF003E"),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: HexColor("#e6e8ed"),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 0.0)),
                  Text(
                    "Do you already have an account?",
                    style: TextStyle(color: HexColor("#C1C1C1")),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp()));
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: HexColor("#FF003E"),
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
