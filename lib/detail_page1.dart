import 'dart:ui';

//import 'package:audioplayers/audioplayers.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admob.dart';
import 'package:flutter_application_1/audio_file.dart';
import 'app_colors.dart' as AppColors;

class DefaultAudioPage1 extends StatefulWidget {
  final ActionData;
  final int index;
  // final AdmobHelper admobHelper = new AdmobHelper();
  DefaultAudioPage1({Key? key, this.ActionData, required this.index})
      : super(key: key);

  @override
  DefaultAudioPage1State createState() => DefaultAudioPage1State();
}

class DefaultAudioPage1State extends State<DefaultAudioPage1> {
  late AudioPlayer advancedPlayer1;
  @override
  void initState() {
    super.initState();
    advancedPlayer1 = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    @override
    final double ScreenHeight = MediaQuery.of(context).size.height;
    final double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.audiogrybackgroundcolor,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: ScreenHeight / 3,
              child: Container(
                color: Colors.black87,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,

                    // color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search,
                      //  color: Colors.black,
                    ),
                    onPressed: () {
                      //  AdmobHelper.createInterAd();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: ScreenHeight * 0.2,
              height: ScreenHeight * 0.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(78),
                  color: Colors.yellow,
                ),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: ScreenHeight * 0.49,
            height: ScreenHeight * 0.60,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(78),
                  color: Colors.black87),
              child: Expanded(
                child: Column(children: [
                  SizedBox(
                    height: ScreenHeight * 0.22,
                  ),
                  Text(
                    this.widget.ActionData[this.widget.index]["title"],
                    style: const TextStyle(
                        fontSize: 28,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir"),
                  ),
                  Text(
                    this.widget.ActionData[this.widget.index]["text"],
                    style: TextStyle(fontSize: 17, color: Colors.yellow),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AudioFile(
                    advancedPlayer: advancedPlayer1,
                    audioPath: this.widget.ActionData[this.widget.index]
                        ["audio"],
                  ),
                ]),
              ),
            ),
          ),
          Positioned(
            top: ScreenHeight * 0.073,
            left: (ScreenWidth - 350) / 2,
            right: (ScreenWidth - 350) / 2,
            height: ScreenHeight * 0.65,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 0.9),
                    image: DecorationImage(
                      image: AssetImage(
                        this.widget.ActionData[this.widget.index]["img1"],
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
