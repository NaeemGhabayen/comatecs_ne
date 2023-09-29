import 'package:flutter/material.dart';

class CardCounter extends StatefulWidget {
  const CardCounter({key});

  @override
  State<CardCounter> createState() => _CardCounterState();
}

class _CardCounterState extends State<CardCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap:  _dicrement,
          child: Container(
            alignment: Alignment.center,
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Color.fromRGBO(225, 225, 225, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.remove,size: 16,),
          ),
        ),
        SizedBox(width: 8,),
        Text("$_currentCount" ,style:const TextStyle(
          color: Color(0xFF212121),
          fontSize: 15,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w700,
        ), textAlign: TextAlign.center,),
        SizedBox(width: 8,),
        InkWell(
          onTap:  _increment,
          child: Container(
            alignment: Alignment.center,
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.add,size: 16,),
          ),
        ),

      ],
    );
  }
  int _currentCount =0;
  int _minNumber;

  void _increment() {
    setState(() {
      _currentCount++;
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 0) {
        _currentCount--;
      }
    });
  }
}
