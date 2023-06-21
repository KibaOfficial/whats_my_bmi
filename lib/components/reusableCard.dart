// Copyright (c) 2023 KibaOfficial
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget myChild;
  final VoidCallback onpress;
  const ReusableCard({
    super.key, 
    required this.color,
    required this.myChild,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: onpress,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10)
            ),
            child: myChild,
          ),
        ),
      ),
    );
  }
}