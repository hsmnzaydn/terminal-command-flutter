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

void addCommandDialog(
    BuildContext context,
    TextEditingController titleController,
    TextEditingController descriptionController) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: primaryDarkColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            padding: EdgeInsets.all(16),
            height: 300,
            child: Column(
              children: [
                createTextField("Komut Başlığı", titleController),
                createTextField("Komut Açıklaması", descriptionController),
                Container(
                    width: 260,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () => {},
                      child: Text(
                        "Kaydet",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        );
      });
}
