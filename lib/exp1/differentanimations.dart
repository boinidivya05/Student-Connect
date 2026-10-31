import 'package:flutter/material.dart';

void main() {
  runApp(const DifferentAnimationsApp());
}

class DifferentAnimationsApp extends StatelessWidget {
  const DifferentAnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DifferentAnimationsPage(),
    );
  }
}

class DifferentAnimationsPage extends StatefulWidget {
  const DifferentAnimationsPage({super.key});

  @override
  State<DifferentAnimationsPage> createState() =>
      _DifferentAnimationsPageState();
}

class _DifferentAnimationsPageState extends State<DifferentAnimationsPage> {
  bool _show = true;
  bool _slide = false;

  void _toggleAnimations() {
    setState(() {
      _show = !_show;
      _slide = !_slide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 8B - Different Animations'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _show ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: const Icon(
                Icons.star,
                size: 80,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 30),
            AnimatedSlide(
              offset: _slide ? const Offset(1, 0) : Offset.zero,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 150,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Slide Animation',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _show ? 100 : 180,
              height: _show ? 100 : 150,
              decoration: BoxDecoration(
                color: _show ? Colors.green : Colors.purple,
                borderRadius: BorderRadius.circular(_show ? 10 : 40),
              ),
              child: const Icon(
                Icons.animation,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _toggleAnimations,
              child: const Text('Play Animations'),
            ),
          ],
        ),
      ),
    );
  }
}