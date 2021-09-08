import 'package:flutter/material.dart';

class AppBarAll extends StatelessWidget {
  String? titleAppBar;
  AppBarAll({Key? key, this.titleAppBar}) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(titleAppBar!),
    );
  }
}
