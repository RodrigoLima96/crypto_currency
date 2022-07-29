import 'package:crypto_currency/src/models/user.dart' as model;
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    model.User user = model.User(
      uid: '1111',
      name: 'Rodrigo Lima',
      email: 'rodrigolima9657@gmail.com',
      photoUrl:
          'https://lh3.googleusercontent.com/a-/AFdZucr88jlKQnuKUzGg-KdilpVlKDDAENHlClCGYdRTnA=s96-c',
    );
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.indigo,
          radius: 45,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            backgroundImage: (user.photoUrl != null)
                ? NetworkImage(user.photoUrl!)
                : const NetworkImage(
                    'https://cdn.icon-icons.com/icons2/933/PNG/512/round-account-button-with-user-inside_icon-icons.com_72596.png'),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(user.email),
      ],
    );
  }
}
