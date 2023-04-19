import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/view/togetherpage/togetherpage.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

//sample data for create ui
List<Map> userList = [
  {"username": "sabitur", "userId": "12sabitur"},
  {"username": "rahman", "userId": "12rahman"},
  {"username": "farhan", "userId": "12farhan"},
];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audio Video"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const TogetherPage();
                }));
              },
              child: const Image(
                  
                  image: AssetImage("assets/images/teamwork.png")))
        ],
      ),
      body: Column(
        children: [
          //search bar unimplemented
          //list view user
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage("assets/images/user.png"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            userList[index]["username"],
                            style: const TextStyle(
                                color: Colors.black, fontSize: 22),
                          ),
                          Expanded(child: Container()),
                          callButton(true),
                          const SizedBox(
                            width: 10,
                          ),
                          callButton(false),
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}

ZegoSendCallInvitationButton callButton(isAudio) {
  return ZegoSendCallInvitationButton(
    buttonSize: const Size(50, 50),
    iconSize: const Size(40, 40),
    invitees: [ZegoUIKitUser(id: "12rahman", name: "rahman")],
    isVideoCall: isAudio,
    resourceID: "Sabitur Rahman",
  );
}
