import 'package:flutter/material.dart';

class LoggedInScreen extends StatelessWidget {
  final Map<String, dynamic>userProfile;
  LoggedInScreen(this.userProfile);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Facebook Login Successful",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text("LOGIN INFORMATION",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),maxLines: 1,),
              ),
            ),
            for(MapEntry e in userProfile.entries) userInformation(e)
          ],
        )
      )
    );
  }
  Widget userInformation(MapEntry mapEntry) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          children: <Widget>[
            Container(
              height: 80,
            width: 100,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              border: Border.all(color: Colors.blue,width: 1,style: BorderStyle.solid)
            ),child: Center(child: Text("${mapEntry.key}"))),
            Expanded(child: Container()),
            Container(child: Text("${mapEntry.value.toString()}",style: TextStyle(

              fontWeight: FontWeight.bold,
              fontSize: 15
            ),))
          ],
        )
      ),
    );
  }
}
