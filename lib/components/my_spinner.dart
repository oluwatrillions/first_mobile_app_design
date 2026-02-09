import 'package:flutter/material.dart';

void loadingSspinner(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );
}
