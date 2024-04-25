import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  final String lbtxt;
  final Color fcsclr;
  final double bdrds;
  final bool isValid;
  final Widget? suffix;
  final AutovalidateMode? valid;
  final ValueChanged<String>? onchange;
  final TextEditingController? controller;
  final bool obsecuretext;
  final String? Function(String?)? validator;
  final void Function(String?)? on_saveds;
  final String? Function(String?)? Validators;

  const Textfield({
    Key? key,
    required this.lbtxt,
    required this.fcsclr,
    required this.bdrds,
    required this.isValid,
    required this.obsecuretext, this.onchange, this.suffix, this.valid,  this.validator, this.controller, this.on_saveds, this.Validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: validator,
            autovalidateMode: valid,
            obscureText: obsecuretext,
        controller:controller ,
        onSaved: on_saveds,
        decoration: InputDecoration( contentPadding: EdgeInsets.all(25),
          filled: true,
          fillColor: Colors.grey.shade200,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(bdrds),
          ),
          labelText: lbtxt,
          labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
          focusColor: fcsclr,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(bdrds),
          ),
          suffixIcon: isValid
              ? suffix
              : null,
        ),
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
       onChanged: onchange,
      );
  }
}