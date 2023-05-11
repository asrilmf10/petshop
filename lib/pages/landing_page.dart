import 'package:flutter/material.dart';

import 'dart:io';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';

class landingPage extends StatelessWidget {
  const landingPage({super.key});

  Widget keluar() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () => exit(0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.centerRight,
                begin: Alignment.centerLeft,
                colors: <Color>[
              Colors.pink.shade100,
              Colors.pink.shade100,
            ])),
        child: Column(
          children: [
            keluar(),
            Container(
              padding: const EdgeInsets.all(25),
              child: const Image(
                image: AssetImage('assets/images/petshop_logo.png'),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 45,
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(fontFamily: 'Acme', fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => loginPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 45,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontFamily: 'Acme', fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const registerPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
