import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: CircleAvatar(
            backgroundColor: Colors.indigo,
            radius: 45,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              backgroundImage: (user.photoURL != null)
                  ? NetworkImage(user.photoURL!)
                  : const NetworkImage(
                      'https://cdn.icon-icons.com/icons2/933/PNG/512/round-account-button-with-user-inside_icon-icons.com_72596.png'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: (user.displayName != null)
              ? Text(user.displayName!)
              : const Text('User Name'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(user.email!),
        ),
      ],
    );
  }
}
