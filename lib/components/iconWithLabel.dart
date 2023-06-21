// Copyright (c) 2023 KibaOfficial
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// ignore_for_file: file_names, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';

class iconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const iconWithLabel({
    required this.icon,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(
            icon,
            size: 80.0,
          ),
        ),
        Container(
          child: Text(label),
        )
      ],
    );
  }
}