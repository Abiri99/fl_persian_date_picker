library fl_persian_date_picker;

import 'package:fl_persian_date_picker/src/components/pdp_dialog.dart';
import 'package:flutter/material.dart';

class PersianDatePicker {
  // void setDate(var dateList)

  static open({
    @required BuildContext context,
    @required Function setDate,
  }) {
    assert(setDate != null, "setDate is null");
    assert(context != null, "context is null!!");

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PdpDialog(
          setDate: setDate,
        );
      },
    );
  }
}
