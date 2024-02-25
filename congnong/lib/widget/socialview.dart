import 'package:congnong/appconstant.dart';
import 'package:congnong/widget/market_view.dart';
import 'package:congnong/widget/nav_item.dart';
import 'package:congnong/widget/news_view.dart';
import 'package:congnong/widget/weather_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialView extends ConsumerStatefulWidget {
  SocialView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SocialViewState();
  }
}

class _SocialViewState extends ConsumerState<SocialView> {
  var view;
  @override
  void initState() {
    super.initState();
    view = {
      "news": NewsView(),
      "market": MarketView(),
      "weather": WeatherView(),
    };
  }

  void changeTab(String newTab) {
    if (newTab != _currentTab) {
      setState(() {
        _currentTab = newTab;
      });
    }
  }

  String _currentTab = 'news';
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        color: background,
        child: Column(
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NavItem(
                    name: 'market',
                    icon: Icons.local_grocery_store_outlined,
                    onTap: () {
                      changeTab("market");
                    },
                    color:
                        _currentTab == 'market' ? Colors.pink : Colors.black),
                NavItem(
                    name: 'weather',
                    icon: Icons.wb_sunny_outlined,
                    onTap: () {
                      changeTab("weather");
                    },
                    color:
                        _currentTab == 'weather' ? Colors.pink : Colors.black),
                NavItem(
                    name: 'news',
                    icon: Icons.newspaper_outlined,
                    onTap: () {
                      changeTab("news");
                    },
                    color: _currentTab == 'news' ? Colors.pink : Colors.black),
              ],
            )),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 1.5,
              width: double.infinity,
              color: Colors.black,
            ),
            view[_currentTab]
          ],
        ));
  }
}
