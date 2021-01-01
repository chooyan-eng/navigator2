import 'package:flutter/material.dart';

class LikeListPage extends StatelessWidget {
  static const users = [
    'chooyan',
    'tsuyoshi',
    'chujo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like List Page'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(users[index]),
          ),
        ),
      ),
    );
  }
}
