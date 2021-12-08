//import 'dart:ffi';

import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admob.dart';
import 'package:flutter_application_1/home_page.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'app_colors.dart' as AppColors;

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  final String audioPath;
  //final AdmobHelper admobHelper = new AdmobHelper();
  AudioFile({Key? key, required this.advancedPlayer, required this.audioPath})
      : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();

  //'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4';

  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  bool isexited = false;

  // Future <bool>_onbackpressed() {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: Text(
  //                 "Pause the Audio Before Exiting, Otherwise it cause ERROR"),
  //             actions: <Widget>[
  //               FlatButton(
  //                   onPressed: () => Navigator.pop(context, false),
  //                   child: Text("NO"))
  //             ],
  //           ));
  // }

  List<IconData> _icons = [
    Icons.play_circle_fill_outlined,
    Icons.pause_circle_filled_rounded,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.advancedPlayer.setUrl(this.widget.audioPath);
  }

  Widget btnStart() {
    const Padding(padding: EdgeInsets.only(bottom: 20));
    return IconButton(
        icon: isPlaying == false
            ? Icon(
                _icons[0],
                size: 50,
                color: Colors.white,
              )
            : Icon(
                _icons[1],
                size: 50,
                color: Colors.white,
              ),
        onPressed: () {
          if (isPlaying == false) {
            this.widget.advancedPlayer.play(this.widget.audioPath);
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true) {
            this.widget.advancedPlayer.pause();
            setState(() {
              isPlaying = false;
            });
          }
        });
  }

  Widget btnbefore() {
    const Padding(padding: EdgeInsets.only(bottom: 20));
    return IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () {
          UnityAds.showVideoAd(placementId: "Interstitial_Android");
        });
  }

  Widget btnafter() {
    const Padding(padding: EdgeInsets.only(bottom: 20));
    return IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () {
          UnityAds.showVideoAd(placementId: "Interstitial_Android");
        });
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnafter(),
          btnStart(),
          btnbefore(),
        ],
      ),
    );
  }

  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
                "Pause the Audio Before Exiting, Otherwise it cause ERROR"),
            titleTextStyle: TextStyle(color: Colors.black87),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("pause"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text("exit"),
              )
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("BAck Button Pressed");
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _position.toString().split(".")[0],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    _duration.toString().split(".")[0],
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            loadAsset(),
          ],
        ),
      ),
    );
  }
}
