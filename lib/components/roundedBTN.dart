// Copyright (c) 2023 KibaOfficial
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RoundedBTN extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpress;
  final Color color;

  const RoundedBTN(
      {required this.color,
      required this.icon,
      required this.onpress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // ignore: sort_child_properties_last
      child: Icon(
        icon,
        size: 15.0,
      ),
      onPressed: onpress,
      elevation: 8,
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      shape: const CircleBorder(),
      fillColor: color,
    );
  }
}