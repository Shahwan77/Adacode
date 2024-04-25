import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? action;

  const CustomAppBar({Key? key, this.leading, required this.title, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: Colors.transparent,shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: leading,
      title: Text(title),
      actions: action != null ? [action!] : null,
    );
  }
}
