import 'package:app_art_museums/pages/feed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Art Museums',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Montserrat',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User _user = FirebaseAuth.instance.currentUser;
  GoogleSignIn _signin = GoogleSignIn(scopes: ['email']);

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Art Museums",
          style:
              TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Montserrat'),
        ),
        centerTitle: true,
      ),
      body: Center(
        //Checking for User Login Status..
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(_user == null ? "" : _user.email),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                color: Colors.black,
                child: FlatButton(
                  onPressed: () {
                    _user == null ? login() : logout();
                  },
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    _user == null ? "Login with Google Account" : "Logout",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    await _signin.signOut();
    await FirebaseAuth.instance.signOut();
  }

  Future<void> login() async {
    try {
      GoogleSignInAccount account = await _signin.signIn();
      GoogleSignInAuthentication auth = await account.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: auth.accessToken, idToken: auth.idToken);

      //Logging In...
      FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      if (error.code == 'sign_in_canceled') {
        // Checks for sign_in_canceled exception
        print(error.toString());
      } else {
        throw error; // Throws PlatformException again because it wasn't the one i wanted
      }
    }
  }
}
