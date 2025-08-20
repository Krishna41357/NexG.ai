import 'package:flutter/material.dart';
import 'package:nexgai_website/home_page/hero_section/hero_section.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageBodyState();
  }
}

class HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [HeroSection()],
    );
  }
}
