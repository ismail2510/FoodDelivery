import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/Views/onboarding.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color(0xffF5F5F8),

        fontFamily: 'SF Pro Rounded',
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error:" + snapshot.error.toString());
            return Container(color: Colors.white,);
          } else if (snapshot.hasData) {
            return Onboarding();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ), //HomePage(),
    );
  }
}
