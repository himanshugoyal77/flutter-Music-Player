//ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, unused_local_variable, unused_import

import 'dart:convert';
import 'dart:math';

import 'dart:ui';
import 'package:flutter_application_1/appbar.dart';
import 'package:flutter_application_1/detail_page.dart';
import 'package:flutter_application_1/detail_page1.dart';
import 'package:flutter_application_1/drawer.dart';
import 'package:flutter_application_1/mytabs.dart';

//import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'admob.dart';
import 'app_colors.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late BannerAd bannerAd;
  bool isLoaded = false;
  List? popularAnime;
  List? Anime;
  List? Actionime;
  late ScrollController _scrollController;
  late TabController _tabController;
  // static final AdmobHelper admobHelper = new AdmobHelper();

  @override
  void initState() {
    super.initState();

    UnityAds.init(gameId: "4491369");

    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popular.json")
        .then((s) {
      setState(() {
        popularAnime = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/popular.json")
        .then((s) {
      setState(() {
        Anime = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/actionanime.json")
        .then((f) {
      setState(() {
        Actionime = json.decode(f);
      });
    });
  }

  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   bannerAd = BannerAd(
  //     size: AdSize.banner,
  //     adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //     //'ca-app-pub-9713728597582393/7721222169',
  //     //'ca-app-pub-9713728597582393/5362987291',
  //     listener: BannerAdListener(onAdLoaded: (ad) {
  //       setState(() {
  //         isLoaded = true;
  //       });
  //       print("Ad loaded");
  //     }, onAdFailedToLoad: (ad, error) {
  //       ad.dispose();
  //     }),
  //     request: AdRequest(),
  //   );
  //   bannerAd.load();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ))),
          actions: [
            IconButton(
              onPressed: () {
                UnityAds.showVideoAd(placementId: "Rewarded_Android");
              },
              icon: Icon(Icons.search),
              color: Colors.black,
            ),
            //  IconButton (
            //    icon: Icons.search,
            //     color: Colors.black,
            //   ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.light_mode,
              color: Colors.black,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        drawer: Mydrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Popular Anime",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 180,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -30,
                    right: 10,
                    child: Container(
                      height: 180,
                      child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount:
                              popularAnime == null ? 0 : popularAnime!.length,
                          itemBuilder: (_, i) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DefaultAudioPage(
                                            booksData: popularAnime,
                                            index: i)));
                              },
                              child: Container(
                                height: 180,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            popularAnime![i]["img2"]),
                                        fit: BoxFit.fill)),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, isScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: AppColors.sliverBackground,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(25),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, left: 10),
                        child: TabBar(
                          physics: BouncingScrollPhysics(),
                          indicatorPadding: const EdgeInsets.all(0),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: const EdgeInsets.only(right: 10),
                          controller: _tabController,
                          isScrollable: true,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: Offset(0, 0),
                                )
                              ]),
                          tabs: const [
                            AppTabs(color: Colors.amber, text: "POPULAR"),
                            AppTabs(color: Colors.deepPurple, text: "TRENDING"),
                            AppTabs(color: Colors.red, text: "NEW"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    // padding: const EdgeInsets.only(left: 30),
                    // scrollDirection: Axis.vertical,
                    itemCount: Anime == null ? 0 : popularAnime!.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DefaultAudioPage(
                                      booksData: popularAnime, index: i)));
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabvar,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 90,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image:
                                                  AssetImage(Anime![i]["img1"]),
                                              fit: BoxFit.cover,
                                            ))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Icon(Icons.star,
                                              size: 24,
                                              color: AppColors.starcolor),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            Anime![i]["rating"],
                                            style:
                                                TextStyle(color: Colors.purple),
                                          ),
                                        ]),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(Anime![i]["title"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: "Avenir",
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            width: 40,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Image.asset(
                                                "assets/img/download.png"))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                ListView.builder(
                    // padding: const EdgeInsets.only(left: 30),
                    // scrollDirection: Axis.vertical,
                    itemCount: Actionime == null ? 0 : popularAnime!.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DefaultAudioPage1(
                                      ActionData: Actionime, index: i)));

                          // AdmobHelper.createInterAd();
                        },
                        child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 5,
                              bottom: 5,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.tabvar,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2),
                                    ),
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 90,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  Actionime![i]["img1"]),
                                              fit: BoxFit.cover,
                                            ))),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Icon(Icons.star,
                                              size: 24,
                                              color: AppColors.starcolor),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            Actionime![i]["rating"],
                                            style:
                                                TextStyle(color: Colors.purple),
                                          ),
                                        ]),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(Actionime![i]["title"],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: "Avenir",
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            width: 40,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Image.asset(
                                                "assets/img/download.png"))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      );
                    }),
                ListView.builder(
                    // padding: const EdgeInsets.only(left: 30),
                    // scrollDirection: Axis.vertical,
                    itemCount: Anime == null ? 0 : popularAnime!.length,
                    itemBuilder: (_, i) {
                      return Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 5,
                            bottom: 5,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.tabvar,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: Offset(0, 0),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ]),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image:
                                                AssetImage(Anime![i]["img1"]),
                                            fit: BoxFit.cover,
                                          ))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Icon(Icons.star,
                                            size: 24,
                                            color: AppColors.starcolor),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          Anime![i]["rating"],
                                          style:
                                              TextStyle(color: Colors.purple),
                                        ),
                                      ]),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(Anime![i]["title"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontFamily: "Avenir",
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                          width: 40,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Image.asset(
                                              "assets/img/download.png"))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }),
              ]),
            )),
          ],
        ),
        bottomNavigationBar: isLoaded
            ? UnityBannerAd(placementId: "Interstitial_Android")
            : SizedBox(),
      ),
    );
  }
}
