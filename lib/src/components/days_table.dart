import 'package:flutter/material.dart';

class DaysTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black54,
            offset: const Offset(0.0, 0.0),
          ),
          const BoxShadow(
            color: Colors.blue,
            offset: const Offset(0.0, 0.0),
            spreadRadius: -2.0,
            blurRadius: 50.0,
          ),
        ],
      ),
      child: Table(
        textDirection: TextDirection.rtl,
        children: [
          TableRow(children: [
            TableCell(
              child: Text(
                'ش',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'ی',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'د',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'س',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'چ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'پ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TableCell(
              child: Text(
                'ج',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
