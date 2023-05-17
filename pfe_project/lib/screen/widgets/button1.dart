import 'package:flutter/material.dart';
import 'package:pfe_project/utils/global.colors.dart';

class Button1 extends StatelessWidget {
  final String title;
  final Function onPressed;
  bool loading;
  Button1({required this.title, required this.onPressed, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: GlobalColors.mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
