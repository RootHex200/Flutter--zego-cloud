import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/view/callpages/group_call_page.dart';
import 'package:flutter_live_streaming_app/util/utils.dart';

class GeneralJoin extends StatefulWidget {
  const GeneralJoin({super.key});

  @override
  State<GeneralJoin> createState() => _GeneralJoinState();
}

class _GeneralJoinState extends State<GeneralJoin> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
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
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: _controller,
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20),
              hintText: "Joinig link",
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
              "Join",
              style: TextStyle(color: Colors.white),
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
