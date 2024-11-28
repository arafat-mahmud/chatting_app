import 'package:flutter/material.dart';
import 'authentication/sign_in.dart' as signIn;
import 'authentication/sign_up.dart' as signUp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Demo',

      // Initial Route
      initialRoute: '/signIn',

      // Routes
      routes: {
        '/signIn': (context) => signIn.SignInPage(),
        '/signUp': (context) => signUp.SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

// Placeholder for the Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signIn');
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
