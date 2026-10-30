import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Connect')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.school, size: 50),
          const Text('Welcome Students!'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.book),
              Icon(Icons.people),
              Icon(Icons.event),
            ],
          ),
          const Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.circle, size: 60, color: Colors.blue),
              Icon(Icons.person, color: Colors.white),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
