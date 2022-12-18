import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textFieldWithTitle({
    required TextEditingController controller,
    required Text titleText,
    String? placeHolderText,
    double height = 50,
    int maxLines = 1
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleText,
      const SizedBox(height: 5),
      SizedBox(
        height: null,
        child: CupertinoTextField(
          controller: controller,
          placeholder: placeHolderText,
          maxLines: maxLines,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
            color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ],
  );
}