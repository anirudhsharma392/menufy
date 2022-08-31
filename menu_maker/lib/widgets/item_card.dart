import 'package:flutter/material.dart';
import 'package:menu_maker/theme/theme.dart';
import 'package:menu_maker/utils/images.dart';
import 'package:menu_maker/widgets/buttons.dart';
import 'package:menu_maker/widgets/common.dart';
import 'package:readmore/readmore.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWrapper(
      child: Row(

        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  Images.veg,
                  height: 20,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Big Mac burger",
                  style: AppStyle.headLine2,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Rs. 109",
                  style: AppStyle.body2,
                ),
                SizedBox(
                  height: 4,
                ),
                Description()
              ],
            ),
          ),SizedBox(width: 16,),
          Container(
            height: 115,
            width: 130,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 105,
                    width: 130,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://loveincorporated.blob.core.windows.net/contentimages/gallery/65e52a5e-7b25-4247-8927-f9f68fcd1aba-McSpicy_Paneer_India.jpg'))),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AddButton(
                    count: 0,
                    onAddition: () {},
                    onSubtraction: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatefulWidget {
  const Description({Key? key}) : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      "Mildly spiced grilled paneer patty topped with makhani sauce and shredded onions placed between freshly toasted sesame seeded buns.",
      style: AppStyle.subtitle2,
      trimLines: 2,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: '',
      moreStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
      lessStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
    );
  }
}
