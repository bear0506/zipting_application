import 'package:flutter/material.dart';

Widget globalDividerWidget({double top = 20, double bottom = 20}) => Column(
      children: [
        SizedBox(height: top),
        const Divider(thickness: 1),
        SizedBox(height: bottom),
      ],
    );
