import 'package:flutter/material.dart';

class CustomDialogs {
  static defaultDialog({
    required BuildContext context,
    String title = 'Confirmation Title',
    String content = 'This is a confirmation of your action',
    String cancelText = 'Cancel',
    String confirmText = 'Confirm',
    Function()? onCancel,
    Function()? onConfirm,
  }) {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: onCancel ?? () => Navigator.of(context).pop(),
              child: Text(cancelText)
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(confirmText)
            ),
          ],
        );
      });
    }
  }