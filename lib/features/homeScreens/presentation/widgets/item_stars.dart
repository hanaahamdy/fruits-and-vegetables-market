import 'package:flutter/material.dart';

Row stars() {
  return Row(
    children: List.generate(
        5,
            (index) => Icon(
          Icons.star,
          color: Colors.yellowAccent,
        )),
  );
}
