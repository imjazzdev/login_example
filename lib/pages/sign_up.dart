import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_example/pages/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20),
        children: [
          Image.asset(
            'assets/img/planning.png',
            height: 200,
            width: 200,
          ),
          Text(
            'Register',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            scrollPadding: EdgeInsets.only(left: 15),
            controller: emailCon,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                fillColor: Colors.blue[200],
                focusColor: Colors.blue[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordCon,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailCon.text, password: passwordCon.text);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
