import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/controller/show_all_user_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Item extends ConsumerWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final userData = ref.watch(showalluserProvider);
    return userData.when(
        error: (error, stackTrace) {
          print(error);
          return const Text("Error");
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        data: (data) {
          
          return ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          data[index].name,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 22),
                        ),
                        Expanded(child: Container()),
                        callButton(true,data[index].uid,data[index].name),
                        const SizedBox(
                          width: 10,
                        ),
                        callButton(false,data[index].uid,data[index].name),
                      ],
                    ));
              });
        });
  }

  ZegoSendCallInvitationButton callButton(isAudio,id,name) {
    return ZegoSendCallInvitationButton(
      buttonSize: const Size(50, 50),
      iconSize: const Size(40, 40),
      invitees: [ZegoUIKitUser(id:id, name: name)],
      isVideoCall: isAudio,
      resourceID: "resource_id_with_voip_datamessages",
    );
  }
}
