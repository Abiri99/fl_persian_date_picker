import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'persian_date_picker.dart';
import 'dart:io';

class PdpDialog extends StatelessWidget {
  final Function setDate;
  PdpDialog({@required this.setDate});

  Widget adaptiveDialog() {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: null,
        content: Pdp(setDate),
      );
    } else if (Platform.isAndroid) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        title: null,
        content: Pdp(setDate),
        backgroundColor: Colors.blue,
        contentPadding: const EdgeInsets.all(0),
      );
    } return null;
  }

  @override
  Widget build(BuildContext context) {
    return adaptiveDialog();
  }
}
