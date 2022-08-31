import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_maker/theme/theme.dart';
import 'package:menu_maker/utils/images.dart';
import 'package:menu_maker/view/cart/cart_page.dart';
import 'package:menu_maker/widgets/buttons.dart';
import 'package:menu_maker/widgets/common.dart';
import 'package:menu_maker/widgets/hover_menu.dart';
import 'package:menu_maker/widgets/item_card.dart';
import 'package:menu_maker/widgets/loader.dart';
import 'package:menu_maker/widgets/text_field.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomePage extends StatelessWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:
          BottomButton(onTap: () => Get.toNamed(CartPage.route)),
      floatingActionButton: HoverMenu(),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(),Space(),
              StickyHeader(
                header: SearchTextField(),
                content: Column(
                  children: [
                    for (int i = 0; i < 10; i++) ItemCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
