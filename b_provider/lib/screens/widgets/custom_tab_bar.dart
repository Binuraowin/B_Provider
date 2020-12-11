import 'package:b_provider/cofig/palette.dart';
import 'package:flutter/material.dart';


class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final List<Color> colors;

  const CustomTabBar({Key key, this.icons, this.selectedIndex, this.onTap, this.colors}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
          border: Border(
              top:BorderSide(
                color: Palette.facebookBlue,
                width: 3.0,
              )
          )

      ),
      tabs:
      icons.asMap().map((i,e) =>MapEntry( i,
          Tab(icon: Icon(e,
            color: i == selectedIndex
                ? Palette.facebookBlue: Colors.grey,
            size: 30.0
            ,
          ),)
      )
      ).values
          .toList(),
      onTap: onTap,


    );
  }
}