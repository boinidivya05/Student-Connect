import 'package:flutter/material.dart';

void main() {
  runApp(const BreakpointApp());
}

class BreakpointApp extends StatelessWidget {
  const BreakpointApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BreakpointHomePage(),
    );
  }
}

class BreakpointHomePage extends StatelessWidget {
  const BreakpointHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 3B - Breakpoints'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          String screenType;
          int columns;
          Color color;

          if (width < 600) {
            screenType = 'Mobile Screen';
            columns = 1;
            color = Colors.blue;
          } else if (width < 1000) {
            screenType = 'Tablet Screen';
            columns = 2;
            color = Colors.orange;
          } else {
            screenType = 'Desktop Screen';
            columns = 3;
            color = Colors.green;
          }

          return Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                color: color,
                child: Column(
                  children: [
                    Text(
                      screenType,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Screen Width: ${width.toStringAsFixed(0)} px',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: columns,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: const [
                    BreakpointCard(title: 'Mobile Layout'),
                    BreakpointCard(title: 'Tablet Layout'),
                    BreakpointCard(title: 'Desktop Layout'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BreakpointCard extends StatelessWidget {
  final String title;

  const BreakpointCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}