// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AppButton extends StatelessWidget {
  final bool? responsive;
  final double? buttonWidth;
  final String? text;
  const AppButton({
    Key? key,
    this.responsive = false,
    this.buttonWidth,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
          child: Text(
        text!,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      )),
    );
  }
}
