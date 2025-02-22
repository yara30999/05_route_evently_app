import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../app/di.dart';
import '../../../data/network/network_info.dart';
import '../../../domain/entities/bottom_nav_bar_entity.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/routes_manager.dart';
import '../../resourses/styles_manager.dart';
import 'tabs/1_home/home_tab.dart';
import 'tabs/2_map/map_tab.dart';
import 'tabs/3_love/love_tab.dart';
import 'tabs/4_profile/profile_tab.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late StreamSubscription<InternetConnectionStatus> networkSubscription;
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    networkSubscription = instance<NetworkInfo>()
        .isConnectedStream
        .listen(_onInternetConnectionChanged);
  }

  @override
  void dispose() {
    _pageController.dispose();
    networkSubscription.cancel();
    super.dispose();
  }

  void _onInternetConnectionChanged(InternetConnectionStatus status) {
    if (status == InternetConnectionStatus.connected) {
      FirebaseFirestore.instance.enableNetwork();
    } else {
      FirebaseFirestore.instance.disableNetwork();
    }
  }

  List<BottomNavIconEntity> get _navigationItems => [
        BottomNavIconEntity(svgIcon: SvgAssets.home, label: "home_tab"),
        BottomNavIconEntity(svgIcon: SvgAssets.map, label: "map_tab"),
        BottomNavIconEntity(svgIcon: SvgAssets.love, label: "love_tab"),
        BottomNavIconEntity(svgIcon: SvgAssets.profile, label: "profile_tab"),
      ];

  void onTabTapped(int index) {
    if (_currentPage != index) {
      setState(() {
        _currentPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.createEditEventRoute);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: IndexedStack(
        index: _currentPage,
        children: [
          HomeTab(),
          MapTab(),
          LoveTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: onTabTapped,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.black,
        items: _navigationItems.map((e) {
          return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                e.svgIcon,
              ),
              label: context.tr(e.label),
              backgroundColor: ColorsManager.blue);
        }).toList(),
        selectedLabelStyle: Styles.style14Medium(),
        unselectedLabelStyle: Styles.style14Medium(),
      ),
    );
  }
}
