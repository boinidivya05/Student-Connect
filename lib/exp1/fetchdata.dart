import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const FetchDataApp());
}

class FetchDataApp extends StatelessWidget {
  const FetchDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FetchPage(),
    );
  }
}

class FetchPage extends StatefulWidget {
  const FetchPage({super.key});

  @override
  State<FetchPage> createState() => _FetchPageState();
}

class _FetchPageState extends State<FetchPage> {
  List<dynamic> _users = [];
  bool _loading = false;
  String _error = '';

  // 9A: Fetch data from REST API
  Future<void> fetchUsers() async {
    setState(() {
      _loading = true;
      _error = '';
    });
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        setState(() {
          _users = jsonDecode(response.body);
        });
      } else {
        setState(() {
          _error = 'Failed to load data (${response.statusCode})';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error: $e';
      });
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experiment 9A - Fetch Data from REST API'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: fetchUsers,
              child: const Text('Fetch Data'),
            ),
          ),
          if (_loading) const CircularProgressIndicator(),
          if (_error.isNotEmpty)
            Text(_error, style: const TextStyle(color: Colors.red)),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user['name']),
                  subtitle: Text(user['email']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
