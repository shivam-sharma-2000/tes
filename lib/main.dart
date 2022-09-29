import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(const DishaKiranApp());
}

class DishaKiranApp extends StatelessWidget {
  const DishaKiranApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPageUI(),
      }
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyHomePage'),
      ),
      body: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(context, '/login');
        }, child: Text('Login'),
      ),
    );
  }
}


