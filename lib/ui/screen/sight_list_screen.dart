import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          toolbarHeight: 156,
          title: Text(
            'Список\nинтересных мест',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.black),
          )),
      body: Center(
        child: Text(''),
      ),
    );
  }
}


// RichText(
//           text: TextSpan(
//               text: 'C',
//               style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.green),
//               children: [
//                 TextSpan(text: 'писок\n', style: TextStyle(color: Colors.black)),
//                 TextSpan(text: 'и', style: TextStyle(color: Colors.orange)),
//                 TextSpan(text: 'нтересных мест', style: TextStyle(color: Colors.black)),
//               ]),
//           maxLines: 2,
//         ),