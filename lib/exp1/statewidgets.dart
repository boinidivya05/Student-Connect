import 'package:flutter/material.dart';

void main() {
  runApp(const StateWidgetsApp());
}

class StateWidgetsApp extends StatelessWidget {
  const StateWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WidgetDemo(),
    );
  }
}

class WidgetDemo extends StatefulWidget {
  const WidgetDemo({super.key});

  @override
  State<WidgetDemo> createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 5A - Widgets')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Stateless Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('This text does not change.'),
            const SizedBox(height: 30),
            const Text(
              'Stateful Widget',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Counter: $count', style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}