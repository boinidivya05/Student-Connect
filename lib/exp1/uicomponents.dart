import 'package:flutter/material.dart';

class GreetingCard extends StatelessWidget {
  final String name;
  const GreetingCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Hello, $name!'),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $_count'),
        ElevatedButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String _message = '';

  void _login() {
    setState(() {
      if (_email.text.contains('@') && _password.text.length >= 6) {
        _message = 'Login Successful';
      } else {
        _message = 'Invalid email or password';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(key: const Key('email'), controller: _email),
        TextField(key: const Key('password'), controller: _password),
        ElevatedButton(onPressed: _login, child: const Text('Login')),
        Text(_message),
      ],
    );
  }
}
