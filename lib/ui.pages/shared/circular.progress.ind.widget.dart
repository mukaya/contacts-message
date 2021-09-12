import 'package:flutter/material.dart';

class MyCircularProgressIndWidget extends StatelessWidget {
  const MyCircularProgressIndWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
