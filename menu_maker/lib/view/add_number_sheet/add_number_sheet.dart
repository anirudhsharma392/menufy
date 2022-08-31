import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_maker/theme/theme.dart';
import 'package:menu_maker/widgets/common.dart';
import 'package:menu_maker/widgets/text_field.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

showAddNumberSheet(context) => showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: AddNumberSheet()),
    );

class AddNumberSheet extends StatelessWidget {
  const AddNumberSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: AppStyle.horizontalPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  height: 4,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppStyle.radius),
                      color: Colors.black12),
                ),
              ),
              Space(),
              Text(
                "Add details to complete your order",
                style: AppStyle.headLine2,
              ),
              Space(),
              CustomTextField(),
              Space(),
              CustomTextField(
                icon: Icons.person,
                hintText: 'Name',
              ),
              Space(
                factor: 2,
              ),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Theme.of(context).primaryColor,
                  minimumSize: Size(double.infinity, 55),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppStyle.radius)),
                  ),
                ),
                onPressed: () {},
                child: Container(
                    child: Text('Confirm',
                        style: AppStyle.buttonStyle)),
              ),
              Space(
                factor: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
