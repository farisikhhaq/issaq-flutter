import 'package:flutter/material.dart';

/// Widget Loading Application
Widget wAppLoading(BuildContext context) {
  return Container(
    color: Theme.of(context).scaffoldBackgroundColor,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

/// Memasukkan Data atau Login
Widget wInputSubmit(
    {required BuildContext context,
    required String title,
    required Function onPressed}) {
  return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(title),
        onPressed: () {},
      ));
}
