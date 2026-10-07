import 'package:flutter/material.dart';
import 'custom_button.dart';

class SoundboardData extends StatelessWidget {
  const SoundboardData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Soundboard"))),
      body: Row(
        children: [
          Expanded(child: CustomButton(sfxAudio: "m (1).mp3", noteKey: "A")),
          Expanded(child: CustomButton(sfxAudio: "m (2).mp3", noteKey: "B")),
          Expanded(child: CustomButton(sfxAudio: "m (3).mp3", noteKey: "C")),
          Expanded(child: CustomButton(sfxAudio: "m (4).mp3", noteKey: "D")),
          Expanded(child: CustomButton(sfxAudio: "m (5).mp3", noteKey: "E")),
          Expanded(child: CustomButton(sfxAudio: "m (6).mp3", noteKey: "F")),
          Expanded(child: CustomButton(sfxAudio: "m (7).mp3", noteKey: "G")),
        ],
      ),
    );
  }
}
