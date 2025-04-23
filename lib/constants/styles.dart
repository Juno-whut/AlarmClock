import 'package:alarm_clock/constants/colors.dart';
import 'package:flutter/material.dart';



// appbar decoration
BoxDecoration headerDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.transparent,
      AppColors.primary
    ],
  ),
  borderRadius: BorderRadius.circular(50),
);

// tile  decoration
BoxDecoration tileDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.transparent,
      AppColors.primaryContainer
    ],
  ),
  borderRadius: BorderRadius.circular(50),
);

// text style for the appbar
const appBarStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 42
);

// heading style
const headingStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 32,
);


// time style
const timeStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 28,
);


// body style
const bodyStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w300,
  fontSize: 24,
);