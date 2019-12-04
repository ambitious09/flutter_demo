import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(accentColor: Colors.white),
      child: Hero(tag: "kip", child: Container(
        color: Colors.white,
        child: Image.asset("images/ic_head.png"),
      )

      ),
    );
  }
}
