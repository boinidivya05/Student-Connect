import 'package:flutter/material.dart';

void main() {
  runApp(const CustomWidgetsApp());
}

class CustomWidgetsApp extends StatelessWidget {
  const CustomWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomWidgetsPage(),
    );
  }
}

class CustomWidgetsPage extends StatelessWidget {
  const CustomWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Experiment 6A - Custom Widgets')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(title: 'Student Connect', icon: Icons.school),
            SizedBox(height: 20),
            CustomButton(title: 'Get Started'),
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(icon, size: 60, color: Colors.blue),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;

  const CustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(title),
    );
  }
}