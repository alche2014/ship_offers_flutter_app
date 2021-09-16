import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                              decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email',
                          )))));
  }
}
