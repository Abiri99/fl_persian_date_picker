import 'package:flutter/material.dart';
import './slider.dart';

class MonthSlider extends StatelessWidget {

  PageController _monthController;
  int _selectedMonth;
  Function onMonthChange;

  MonthSlider(this._monthController, this._selectedMonth, this.onMonthChange);

  String renderMonthsByIndex(int index) {
    switch (index) {
      case 0:
        return "فروردین";
      case 1:
        return "اردیبهشت";
      case 2:
        return "خرداد";
      case 3:
        return "تیر";
      case 4:
        return "مرداد";
      case 5:
        return "شهریور";
      case 6:
        return "مهر";
      case 7:
        return "آبان";
      case 8:
        return "آذر";
      case 9:
        return "دی";
      case 10:
        return "بهمن";
      case 11:
        return "اسفند";
      default:
        return "ماه";
    }
  }

  @override
  Widget build(BuildContext context) {
    return slider(
      child: PageView.builder(
        reverse: true,
        controller: _monthController,
        onPageChanged: onMonthChange,
        itemCount: 12,
        itemBuilder: (context, index) {
          var style = TextStyle(
            color: index + 1 == _selectedMonth ? Colors.white : Colors.white30,
            fontSize: index + 1 == _selectedMonth ? 20 : 18,
          );
          return Container(
            // alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                renderMonthsByIndex(index),
                textAlign: TextAlign.center,
                style: style,
              ),
            ),
          );
        },
      ),
    );
  }
}
