import 'package:flutter/material.dart';

class BuyCryptoButton extends StatelessWidget {
  const BuyCryptoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 15, bottom: 15),
              child: Text(
                "Buy",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
