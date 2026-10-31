import 'package:flutter/material.dart';

class LayoutStructures extends StatelessWidget {
  const LayoutStructures({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Experiment 2B - Layout Structures'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text('ROW WIDGET', style: TextStyle(fontSize: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.home, size: 40, color: Colors.blue),
                  Icon(Icons.star, size: 40, color: Colors.orange),
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                ],
              ),
              const SizedBox(height: 30),
              const Text('COLUMN WIDGET', style: TextStyle(fontSize: 20)),
              const Column(
                children: [
                  Text('First Item'),
                  Text('Second Item'),
                  Text('Third Item'),
                ],
              ),
              const SizedBox(height: 30),
              const Text('STACK WIDGET', style: TextStyle(fontSize: 20)),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 150, height: 100, color: Colors.blue),
                  const Text(
                    'Stack Layout',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const LayoutStructures());
