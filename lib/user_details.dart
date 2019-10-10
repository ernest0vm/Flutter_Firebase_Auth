import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserDetailsView extends StatelessWidget{

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseUser user;

// In the constructor, require a user.
  UserDetailsView({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
        backgroundColor: Colors.blue,
      ),
      body:Padding(
        padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
              Image.network(user.photoUrl, fit: BoxFit.fill, scale: 0.8,),
                  Divider(height: 10, color: Colors.transparent,),
                  Text(user.displayName, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  Text(user.email),
          Divider(height: 10, color: Colors.transparent,),
                  Text("email verified: " + user.isEmailVerified.toString()),
          Divider(height: 10, color: Colors.transparent,),
          RaisedButton(child: Text("Sign out"),
          color: Colors.red,
          textColor: Colors.white,
          elevation: 6,
          onPressed: (){
            _auth.signOut();
            print("Sign out from Firebase!");
            _googleSignIn.signOut();
            print("Sign out from Google Auth!");
            Navigator.pop(context);
          },)
            ]
          ),
          ),
    );
  }
}