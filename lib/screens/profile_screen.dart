import 'package:flutter/material.dart';
import 'package:coastal_tourism_app/services/google_sign_in_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GoogleSignInService _googleSignInService = GoogleSignInService();
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                child: Text('Sign in with Google'),
                onPressed: () async {
                  final userCredential =
                      await _googleSignInService.signInWithGoogle();
                  if (userCredential != null) {
                    setState(() {
                      _user = userCredential.user;
                    });
                  }
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_user!.photoURL ?? ''),
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  Text('Welcome, ${_user!.displayName}'),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Sign Out'),
                    onPressed: () async {
                      await _googleSignInService.signOut();
                      setState(() {
                        _user = null;
                      });
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
