import 'package:flutter/material.dart';
import 'package:test_app/Screen/Chat.dart';

class Profile extends StatelessWidget {
  final String name;
  final String profile;

  const Profile({
    super.key,
    required this.name,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.pink.shade100,
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              color: Colors.red.shade100,
              child: Text(
                profile,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Container(
              width: double.infinity,
              color: Colors.amber.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.person,
                    size: 80,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Chat(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.chat,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        size: 40,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
