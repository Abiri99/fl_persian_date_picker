import 'package:fl_persian_date_picker/src/components/days_table.dart';
import 'package:fl_persian_date_picker/src/components/line.dart';
import 'package:fl_persian_date_picker/src/components/month_slider.dart';
import 'package:fl_persian_date_picker/src/components/year_slider.dart';
import 'package:fl_persian_date_picker/src/format_persian_date.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import '../replace_farsi_number.dart';

class Pdp extends StatefulWidget {
  var setDate;
  PageController _yearController;
  PageController _monthController;
  final currentDate = Jalali.now();

  Pdp(setDate) {
    this.setDate = setDate;
    _yearController =
        PageController(viewportFraction: 0.35, initialPage: currentDate.year);
    _monthController =
        PageController(viewportFraction: 0.45, initialPage: currentDate.month - 1);
  }

  @override
  _PdpState createState() => _PdpState();
}

class _PdpState extends State<Pdp> {
  var _selectedYear, _selectedMonth, _selectedDay;
  var currentDate = Jalali.now();

  //_selectedInfo is used to know which year/month/day is selected
  var _selectedInfo = [-1, -1, -1];

  List<Widget> renderMonths() {
    return [
      Container(
        child: Text(
          "فروردین",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "اردیبهشت",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "خرداد",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "تیر",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "مرداد",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "شهریور",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "مهر",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "آبان",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "آذر",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "دی",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "بهمن",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
      Container(
        child: Text(
          "اسفند",
          textAlign: TextAlign.center,
        ),
        width: 50,
      ),
    ];
  }

  _PdpState() {
    _selectedYear = currentDate.year;
    _selectedMonth = currentDate.month;
  }

  onYearChanged(int number) {
    setState(() {
      _selectedYear = number;
      // _selectedDay = null;
    });
  }

  onMonthChange(int monthIndex) {
    setState(() {
      _selectedMonth = monthIndex + 1;
      // _selectedDay = null;
    });
  }

  getSelectedYear() {
    return _selectedYear == null ? widget.currentDate.year : _selectedYear;
  }

  getSelectedMonth() {
    return _selectedMonth == null ? widget.currentDate.month : _selectedMonth;
  }

  getMonthLength() {
    var sm = getSelectedMonth();
    var sy = getSelectedYear();
    print(Jalali(sy, sm).monthLength);
    return Jalali(sy, sm)
                          .monthLength +
                      Jalali(sy, sm, 1).weekDay -
                      1;
  }

  @override
  Widget build(BuildContext context) {

    var mq = MediaQuery.of(context);

    var sm = getSelectedMonth();
    var sy = getSelectedYear();

    return Container(
      height: mq.size.height * 0.79,
      width: mq.size.width * 0.8,
      padding: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(
              replaceFarsiNumber(formatPersianDate(widget.currentDate)),
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          YearSlider(widget._yearController, _selectedYear, onYearChanged),
          Line(),
          MonthSlider(widget._monthController, _selectedMonth, onMonthChange),
          // Line(),
          SizedBox(
            height: 16,
          ),
          DaysTable(),
          SizedBox(
            height: 8,
          ),
          Expanded(
            // height: 100,
            // child: daysTable(firstDayName: Jalali(_selectedYear, _selectedMonth+1).formatter.wN,),
            child: Container(
              // color: Colors.red,
              padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
              alignment: Alignment(0.0, 0.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  itemCount: getMonthLength(),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7),
                  itemBuilder: (BuildContext context, int index) {
                    index -= Jalali(sy, sm, 1)
                            .weekDay - 1;
                    return index >= 0
                        ? InkWell(
                          borderRadius: BorderRadius.circular(100),
                          splashColor: Colors.black38,
                            onTap: () {
                              setState(() {
                                _selectedDay = index;
                                _selectedInfo = [
                                  index,
                                  sm,
                                  sy,
                                ];
                              });
                              var temp = [
                                index + 1,
                                sm,
                                sy,
                              ];
                              widget.setDate(temp);
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                replaceFarsiNumber((index + 1).toString()),
                                style: TextStyle(
                                  fontSize: index == _selectedInfo[0].toInt() && sm == _selectedInfo[1] && sy == _selectedInfo[2] ? 24 : 18,
                                  color: index == _selectedInfo[0] && sm == _selectedInfo[1] && sy == _selectedInfo[2]
                                      ? Colors.white
                                      : Colors.white38,
                                ),
                              ),
                            ),
                          )
                        : Text('');
                  },
                ),
              ),
            ),
          ),
          Line(),
          Container(
            margin: EdgeInsets.only(bottom: 8, right: 8, left: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            height: 33,
            width: double.infinity,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "بستن",
                style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
