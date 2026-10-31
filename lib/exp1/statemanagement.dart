import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class CounterProvider extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StateManagementPage(),
    );
  }
}

class StateManagementPage extends StatefulWidget {
  const StateManagementPage({super.key});

  @override
  State<StateManagementPage> createState() =>
      _StateManagementPageState();
}

class _StateManagementPageState extends State<StateManagementPage> {
  int localCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 5B - State Management')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Using setState',
                style: TextStyle(fontSize: 22)),
            Text('Count: $localCount'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  localCount++;
                });
              },
              child: const Text('Increment setState'),
            ),
            const SizedBox(height: 30),
            const Text('Using Provider',
                style: TextStyle(fontSize: 22)),
            Consumer<CounterProvider>(
              builder: (context, counter, child) {
                return Text('Count: ${counter.count}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: const Text('Increment Provider'),
            ),
          ],
        ),
      ),
    );
  }
}