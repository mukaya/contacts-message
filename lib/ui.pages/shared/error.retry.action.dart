import 'package:flutter/material.dart';

class ErrorRetryMessage extends StatelessWidget {
  String errorMessage;
  Function onAction;
  ErrorRetryMessage(
      {Key? key, required this.errorMessage, required this.onAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorMessage),
          ElevatedButton(
            onPressed: () {
              onAction();
            },
            child: Text("Retry..."),
          ),
        ],
      ),
    );
  }
}
