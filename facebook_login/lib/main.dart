import 'dart:convert';

import 'package:facebooklogin/loggedInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String , dynamic> userProfile;
  FacebookLogin fb = FacebookLogin();
  Future<FacebookLogin> signInFB() async{
    final FacebookLoginResult result = await fb.logIn(['email']);
    final token = result.accessToken.token;
    final facebookUser = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
    userProfile = jsonDecode(facebookUser.body);
    print(userProfile);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 152, 54, 10),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Text("Facebook Login",style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: RaisedButton.icon(
                    elevation: 10,
                    padding: EdgeInsets.all(10.0),
                    color: Color.fromRGBO(0, 118, 251, 10),
                    label: Text("Facebook Login",style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    icon: Container(height:50,child: Image.network("https://facebookbrand.com/wp-content/uploads/2019/10/flogo_RGB_HEX-BRC-Site-250.png?w=250&h=250")),
                    onPressed: () {
                      signInFB().then((value) => print("logged  in")).whenComplete(() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> LoggedInScreen(userProfile))));
                    },

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

