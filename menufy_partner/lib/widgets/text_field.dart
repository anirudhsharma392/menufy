import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menufy_partner/theme/theme.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool showClearButton = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  onFocusChange() {
    setState(() {
      showClearButton = _focusNode.hasFocus;
    });
  }

  onClear() {
    _controller.clear();
    if (FocusManager.instance.primaryFocus != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: AppStyle.margin,
          right: AppStyle.margin,
          bottom: AppStyle.margin,
          top: 2),
      height: 50,
      decoration: const BoxDecoration(
        boxShadow: [AppStyle.shadow],
        borderRadius: BorderRadius.all(Radius.circular(AppStyle.radius)),
      ),
      child: TextField(
        focusNode: _focusNode,
        controller: _controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).primaryColor,
            ),
            suffixIcon: showClearButton
                ? GestureDetector(
                    onTap: onClear,
                    child: Icon(CupertinoIcons.clear,
                        color: Theme.of(context).primaryColor))
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(AppStyle.radius)),
            ),
            hintText: "Search here..",
            hintStyle: AppStyle.subtitle1,
            contentPadding: EdgeInsets.symmetric(horizontal: 16)),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final IconData icon;
  final Widget? prefix;
  final void Function(String)? onChange;

  const CustomTextField(
      {Key? key,
      this.hintText = "Enter your email",
      this.labelText = "Email",
      this.icon = Icons.email,
      this.prefix,
      this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    const OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.blackLightest),
      borderRadius: BorderRadius.all(Radius.circular(AppStyle.radius)),
    );
    final Color _focusedColor = Theme.of(context).primaryColor;
    return TextField(
      style: AppStyle.body1.copyWith(color: _focusedColor),
      keyboardType: TextInputType.phone,
      maxLength: 11,
      onChanged: onChange,
      decoration: InputDecoration(
          filled: true,
          counterText: '',
          fillColor: AppColors.white,
          prefix: prefix,
          suffixIcon: Icon(icon, color: AppColors.blackLightest),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: _focusedColor),
            borderRadius: BorderRadius.all(Radius.circular(AppStyle.radius)),
          ),
          labelText: labelText,
          enabledBorder: border,
          border: border,
          disabledBorder: border,
          errorBorder: border,
          focusedErrorBorder: border,
          hintText: hintText,
          hintStyle: AppStyle.subtitle1,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16)),
    );
  }
}
