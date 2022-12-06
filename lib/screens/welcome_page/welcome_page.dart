import 'package:flutter/material.dart';
import 'package:instagram_clone/state/auth/backend/authenticator.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log.toString();
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Instant-gram!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                'Welcome to Instant-gram!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                'Log into your account using one of the options below.',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: GestureDetector(
                onTap: () async {
                  final result = await Authenticator().logInWithFacebook();
                  result.log();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/facebook_icon.png',
                        scale: 18,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Facebook',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
              child: GestureDetector(
                onTap: () async {
                  final result = await Authenticator().logInWithGoogle();
                  result.log();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/google_icon.png',
                        scale: 20,
                        color: Colors.blue[500],
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                'Don\'t have an account?',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                'Sign up on Facebook or create an account on Google.',
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
