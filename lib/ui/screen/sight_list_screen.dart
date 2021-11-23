import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final toolbarHeight = 156.0;
  final appBarTextSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: toolbarHeight,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: double.infinity),
              child: Text('Список \nинтересных мест',
                  style: TextStyle(fontSize: appBarTextSize, fontWeight: FontWeight.w700, color: Colors.black)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              sightMocks.length,
              (index) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: SightCard(sightMocks[index]),
                  )),
        ),
      ),
    );
  }
}
