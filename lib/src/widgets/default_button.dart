import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String text;
  IconData icon;
  Function() onPressed;

  DefaultButton({
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * .9,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Wrap(
          children: <Widget>[
            Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                )
            ),
            Icon(
              icon,
              size: 24.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}