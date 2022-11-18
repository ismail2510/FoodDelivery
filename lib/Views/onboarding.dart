import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'authenticationpage.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 50, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 73,
                      height: 73,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset("images/dinner.png",color: Colors.orange ,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 275,
                      height: 120,
                      child: Text(
                        "Welcome ):",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 45,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      'images/hungrey.jpg',
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50,left: 10),
                      width: 275,
                      height: 120,
                      child: Text(
                        "Food for Everyone",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 45,
                            color: Colors.orange),
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.orange.withOpacity(0.0),
                          Colors.orange.withOpacity(0.2),
                          Colors.orange.withOpacity(1.0),
                        ],
                        stops: [
                          0.1,
                          0.79,
                          1.0,
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                   Colors.orange.withOpacity(0.8),
                   Colors.orange.withOpacity(1.0),
                  ],
                  stops: [
                    0.7,
                    1.0,
                  ]),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  height: 60,
                  width: 314,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthenticationPage()));
                    },
                    child: Text(
                      "Get started",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//sdaasddsadsaasdssdasdadsa