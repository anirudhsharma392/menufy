import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menufy_partner/generated/assets.dart';
import 'package:menufy_partner/theme/theme.dart';
import 'package:menufy_partner/widgets/common.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyle.padding,
      margin: EdgeInsets.only(bottom: 12),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("ID : 298072 7136"),
              Text(
                "06:25 PM",
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
          SpaceSmall(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff6977B9),
                ),
                child: Text(
                  "PREPARING",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                children: [
                  Icon(CupertinoIcons.phone,color: AppColors.success,),
                  //Text('Call Customer',style: TextStyle(color: Colors.green),)
                ],
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: CustomDivider()),
          FoodItem(
            name: "Chicken Ham Burger",
            isVeg: false,
            price: 169.0,
            count: 1,
          ),
          FoodItem(
            name: "Chipotle French Fries",
            isVeg: true,
            price: 109.0,
            count: 4,
          ),
          FoodItem(
            name: "Cold Coffee with caramel",
            isVeg: true,
            price: 199.0,
            count: 2,
          ),
          CustomDivider(),
          SpaceSmall(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total bill: ",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Text('₹499.0', style: Theme.of(context).textTheme.subtitle1)
            ],
          )
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final bool isVeg;
  final String name;
  final double price;
  final int count;

  const FoodItem(
      {Key? key,
      required this.isVeg,
      required this.name,
      required this.price,
      required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                isVeg ? Assets.iconsVeg : Assets.iconsNonVeg,
                height: 18,
              ),
              SpaceHorizontal(
                factor: 0.5,
              ),
              Text(
                count.toString() + ' x ',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text("₹$price")
        ],
      ),
    );
  }
}
