import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/controller/widget_visible_controller.dart';
import 'package:flutter_live_streaming_app/view/togetherpage/component/host_join.dart';
import 'package:flutter_live_streaming_app/view/togetherpage/general_join.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TogetherPage extends StatelessWidget {
  const TogetherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const Image(image: AssetImage("assets/images/together.png")),
              const SizedBox(
                height: 20,
              ),
              Consumer(builder: (contect, ref, child) {
                final check = ref.watch(hostControllerProvider);
                return check ? const HostJoin() : const GeneralJoin();
              }),
              const Text(
                "OR",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (contect, ref, child) {
                  final check = ref.watch(hostControllerProvider);
                  return GestureDetector(
                      onTap: () {
                        ref.read(hostControllerProvider.notifier).state =!ref.read(hostControllerProvider.notifier).state;
                      },
                      child: check
                          ? const Text("Join meeting")
                          : const Text("Join as a host"));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
