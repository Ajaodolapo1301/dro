
import 'package:dro_app/utils/navigation/navigator.dart';
import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Header extends StatelessWidget {
  final String text;
  final VoidCallback preferredActionOnBackPressed;

  const Header({
    Key key,
    this.text,
    this.preferredActionOnBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
            Platform.isAndroid ?   Icons.arrow_back  : Icons.arrow_back_ios,
              size: 18,
              color:  Colors.black,
            ),
            onTap: () {
              preferredActionOnBackPressed != null
                  ? preferredActionOnBackPressed()
                  : pop(context);
            },
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }
}

