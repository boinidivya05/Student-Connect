import 'package:flutter/material.dart';

void main() {
  runApp(const DebugApp());
}

class DebugApp extends StatelessWidget {
  const DebugApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DebugPage(),
    );
  }
}

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  final List<String> items = ['Apple', 'Banana', 'Mango'];
  int index = 0;

  void next() {
    setState(() {
      // FIX 2: wrap index so it never goes out of range
      index = (index + 1) % items.length;
    });
    debugPrint('Index is now $index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 10B - Debugging'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // FIX 1: Expanded makes the text wrap inside the available width
            Row(
              children: const [
                Icon(Icons.info),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'This is a very long message that does not fit inside the row and will overflow the screen width.',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Item: ${items[index]}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: next, child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
