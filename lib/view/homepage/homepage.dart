import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/view/homepage/component/item.dart';
import 'package:flutter_live_streaming_app/view/togetherpage/togetherpage.dart';

//sample data for create ui

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Video id: 12rahman"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TogetherPage();
                }));
              },
              child:
                  const Image(image: AssetImage("assets/images/teamwork.png")))
        ],
      ),
      body: Column(
        children: [
          //search bar unimplemented
          //list view user
          Expanded(
            child:Item()
          )
        ],
      ),
    );
  }
}

