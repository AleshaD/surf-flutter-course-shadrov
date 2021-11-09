import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        children: [
          MyFirstWidget(),
          const MySecondWidget(),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MySecondWidget(),
      title: 'App Super Title',
    );
  }
}
class MyFirstWidget extends StatelessWidget {
  int buildCounter = 0;
  MyFirstWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildCounter++;
    debugPrint('StLess Build counter: $buildCounter');
    return const Center(
      child: Text('Hello'),
    );
  }

  // Type getContextRuntime() {
  //   return context.runtimeType;
  // }
}

class MySecondWidget extends StatefulWidget {
  const MySecondWidget({ Key? key }) : super(key: key);

  @override
  _MySecondWidgetState createState() => _MySecondWidgetState();
}

class _MySecondWidgetState extends State<MySecondWidget> {
  int buildCounter = 0;

  @override
  Widget build(BuildContext context) {
    buildCounter++;
    debugPrint('stFull Build counter: $buildCounter');
    return GestureDetector(
      onTap: () => debugPrint('Runtime type is: ${getContextRuntime().toString()}'),
      child: const Center(
        child: Text('Hello'),
      ),
    );
  }

  Type getContextRuntime() {
    return context.runtimeType;
  }
}
