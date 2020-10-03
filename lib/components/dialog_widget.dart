import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Style.dart';

void confirmDialog(BuildContext context, String title, String description) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: primaryDarkColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            padding: EdgeInsets.all(16),
            height: 200,
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(description,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
