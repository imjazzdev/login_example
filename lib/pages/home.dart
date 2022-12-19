import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_example/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   expandedHeight: 160.0,
          //   flexibleSpace: const FlexibleSpaceBar(
          //     title: Text(
          //       'Home',
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Container(
                child: Image.asset(
              'assets/img/kelinci.jpg',
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blueAccent.shade100,
                        Colors.red.shade100,
                      ]),
                ),
                child: Column(
                  children: [
                    StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.userChanges(),
                      builder: (context, snapshot) {
                        return Text(
                            'Sedang Sign In pada akun ${snapshot.data!.email}');
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Sign Out dari akun?'),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ));
                        },
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
