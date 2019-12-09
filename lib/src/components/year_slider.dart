import 'package:flutter/material.dart';
import 'slider.dart';
import '../replace_farsi_number.dart';

class YearSlider extends StatelessWidget {
  PageController _yearController;
  int _selectedYear;
  Function onYearChanged;

  YearSlider(this._yearController, this._selectedYear, this.onYearChanged);

  @override
  Widget build(BuildContext context) {
    return slider(
      child: PageView.builder(
        reverse: true,
        controller: _yearController,
        onPageChanged: onYearChanged,
        itemBuilder: (context, index) {
          var style = TextStyle(
            color: index == _selectedYear ? Colors.white : Colors.white30,
            fontSize: index == _selectedYear ? 20 : 18,
          );
          return Align(
            alignment: Alignment.center,
            child: Text(
              replaceFarsiNumber(index.toString()),
              textAlign: TextAlign.center,
              style: style,
            ),
          );
        },
        itemCount: 3000,
      ),
    );
  }
}
