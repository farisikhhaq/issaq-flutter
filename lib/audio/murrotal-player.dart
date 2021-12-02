import 'package:issaq_pro/model/murrotal-model.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MurrotalPlayer extends StatefulWidget {
  final Murrotal murrotal;

   const MurrotalPlayer({required this.murrotal});
  
  @override
  _MurrotalPlayerState createState() => _MurrotalPlayerState();
}

class _MurrotalPlayerState extends State<MurrotalPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  String url =
      'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/002.mp3';

  @override
  void initState() {
    super.initState();
    audioPlayer.onNotificationPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
  }

  playMusic() async {
    await audioPlayer.play(url);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(audioPlayerState == PlayerState.PLAYING
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded),
              onPressed: () {
                audioPlayerState == PlayerState.PLAYING
                    ? pauseMusic()
                    : playMusic();
              },
            )
          ],
        ),
      ),
    );
  }
}
