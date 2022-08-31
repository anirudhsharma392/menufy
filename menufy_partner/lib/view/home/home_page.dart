import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menufy_partner/theme/theme.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,




    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("McDonald's", style: AppStyle.headLine1),
          Image.network(
            'https://cdn-icons-png.flaticon.com/512/732/732217.png',
            height: 30,
          )
        ],
      ),
    );
  }
}
