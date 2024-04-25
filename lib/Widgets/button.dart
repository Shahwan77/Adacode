import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget text;
  final void Function()? ontap;
  const Button({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize:Size(350, 50),
            backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          
        ),
        onPressed: ontap,
        child: text
    );
  }
}
