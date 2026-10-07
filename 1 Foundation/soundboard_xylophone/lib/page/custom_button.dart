import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String sfxAudio;
  final String noteKey;
  const CustomButton ({super.key,
    required this.sfxAudio,
    required this.noteKey,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:(){
        AudioPlayer().play(AssetSource(sfxAudio));
      }, 
      style: ButtonStyle(minimumSize: WidgetStateProperty.all(Size(1, 500)),foregroundColor: WidgetStateProperty.all(Colors.red),
      backgroundColor: WidgetStatePropertyAll(Colors.lightGreen[100])
      ),
      child: Text(noteKey),
    );
  }
}