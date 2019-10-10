import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'user_details.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginView());
  }
}

  class LoginView extends StatelessWidget {

    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<FirebaseUser> _handleSignIn() async {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential))
          .user;
      print("signed in " + user.displayName);
      return user;
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter firebase"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Sign in"),
                textColor: Colors.white,
                color: Colors.blue,
                elevation: 6,
                onPressed: (){_handleSignIn()
                    .then((FirebaseUser user) => Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailsView(user: user))))
                    .catchError((e) => print(e));},
              )
            ],
          ),
        ),
      ),
    );
  }
}
