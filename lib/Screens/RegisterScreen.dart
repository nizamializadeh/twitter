import 'package:flutter/material.dart';
import 'package:twitter_clone/Services/auth_services.dart';
import 'package:twitter_clone/Widgets/RoundedButton.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;
  String _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00acee),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Registiration',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Enter Your email"),
              onChanged: (value) {
                _email = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Enter Your password"),
              onChanged: (value) {
                _password = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: "Enter Your name"),
              onChanged: (value) {
                _name = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              btnText: "Create account",
              onBtnPressed: () async {
                bool isValid =
                    await AuthService.signUp(_name, _email, _password);
                if (isValid) {
                  Navigator.pop(context);
                } else {
                  print('something wrong');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
