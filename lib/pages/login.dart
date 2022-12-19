import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_example/pages/home.dart';
import 'package:login_example/pages/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20),
        children: [
          Container(
            height: 250,
            child: Image.asset('assets/img/training.png'),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Welcome',
            style: TextStyle(fontSize: 30),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(17)),
            child: TextField(
              controller: emailCon,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.blue[200],
                  focusColor: Colors.blue[200],
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.blue.shade100,
                border: Border.all(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(17)),
            child: TextField(
              controller: passwordCon,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password (6 character)',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: emailCon.text);
                },
                child: Text(
                  'Forget password?',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                )),
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailCon.text, password: passwordCon.text);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Belum punya akun?'),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                },
                child: Text(' Sign Up',
                    style: TextStyle(fontSize: 15, color: Colors.blue)),
              )
            ],
          )
        ],
      )),
    );
  }
}
