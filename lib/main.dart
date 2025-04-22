import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:first_app/Kayit.dart'; // Assuming this is where your Kayit widget is defined
import 'package:first_app/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double deviceHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {
        '/kayit': (context) => const Kayit(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 27.0,
            color: HexColor("#FF003E"),
          ),
          const Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 80.0)),
                  Image(image: AssetImage("lib/images/pana.png"))
                ],
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.0),
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
                top: 50.0,
                left: 30.0,
              )),
              Text(
                "Log in to your account",
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
                          builder: (context) => const MyAppHomePage()));
                },
                child: Text(
                  "Log in",
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
                "Don't have an account",
                style: TextStyle(color: HexColor("#C1C1C1")),
              ),
              TextButton(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: HexColor("#FF003E"),
                      decoration: TextDecoration.underline),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/kayit');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
