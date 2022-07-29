import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: 50,
      width: size.width * 0.8,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.red.shade400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
