import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/util/utils.dart';
import 'package:flutter_live_streaming_app/view/callpages/group_call_page.dart';

String generatePassword({int length = 8}) {
  const String chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#%^&*()_+-=';
  final Random rnd = Random.secure();
  final password =
      List.generate(length, (index) => chars[rnd.nextInt(chars.length)]);
  return password.join();
}

class HostJoin extends StatefulWidget {
  const HostJoin({super.key});

  @override
  State<HostJoin> createState() => _HostJoinState();
}

class _HostJoinState extends State<HostJoin> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = generatePassword().toString();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Host Id:-  ",
              style: TextStyle(color: Colors.black),
            ),
            SelectableText(
              _controller.text.toString(),
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
          
            controller: _controller,
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: "Enter Host id",
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupCallPage(
                              callId: _controller.text.toString(),
                              userID: Utils.userid.toString(),
                              userName: Utils.userid.toString(),
                            )));
              }
            },
            child: const Text(
              "Join as a host",
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
