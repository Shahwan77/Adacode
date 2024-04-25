import 'package:flutter/cupertino.dart';

class HeadWidget extends StatelessWidget {
  final String txt;
  final Color clr;
  final FontWeight fntwei;
  final double size;
  const HeadWidget(
      {super.key,
      required this.txt,
      required this.clr,
      required this.fntwei,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: clr,
        fontWeight: fntwei,
        fontSize: size,
      ),
    );
  }
}
