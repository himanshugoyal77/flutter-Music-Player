import 'dart:ui';

//import 'package:audioplayers/audioplayers.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/admob.dart';
import 'package:flutter_application_1/audio_file.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'app_colors.dart' as AppColors;

class DefaultAudioPage extends StatefulWidget {
  final booksData;
  final int index;
  // final AdmobHelper admobHelper = new AdmobHelper();
  DefaultAudioPage({Key? key, this.booksData, required this.index})
      : super(key: key);

  @override
  DefaultAudioPageState createState() => DefaultAudioPageState();
}

class DefaultAudioPageState extends State<DefaultAudioPage> {
  late BannerAd bannerAd;
  bool isLoaded = false;
  late AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-9713728597582393/7721222169',
      //'ca-app-pub-3940256099942544/6300978111',
      //'ca-app-pub-9713728597582393/7721222169',
      //'ca-app-pub-9713728597582393/5362987291',
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isLoaded = true;
        });
        print("Ad loaded");
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
      request: AdRequest(),
    );
    bannerAd.load();
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
                    onPressed: () {
                      UnityAds.showVideoAd(placementId: "Rewarded_Android");
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        //  color: Colors.black,
                      ),

                      //  AdmobHelper.createInterAd();
                      onPressed: () => Navigator.of(context).pop(),
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
                      this.widget.booksData[this.widget.index]["title"],
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Text(
                      this.widget.booksData[this.widget.index]["text"],
                      style: TextStyle(fontSize: 17, color: Colors.yellow),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    AudioFile(
                      advancedPlayer: advancedPlayer,
                      audioPath: this.widget.booksData[this.widget.index]
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
                          this.widget.booksData[this.widget.index]["img1"],
                        ),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: UnityBannerAd(placementId: "Banner_Android"));
  }
}
