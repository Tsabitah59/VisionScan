import 'package:flutter/material.dart';

// =============== COLORS ===============
const primaryColor = Color(0xFFFFC100);
const secondaryColor = Color(0xFFF12821);
const backgroundColor = Color(0xFF292929);
const backgroundGradientColor = RadialGradient(
  center: Alignment(0, 1),
  radius: 0.0,
  colors: [
    Color(0xFF624A00), 
    Color(0xFF2F2E2A)
  ]
);
const backgroundGradientThinColor = RadialGradient(
  center: Alignment(0, 1),
  radius: 0.0,
  colors: [
    Color(0x7F624900), 
    Color(0x7F2F2E2A)
  ]
);
const textColor = Color(0xFFF0E3D3);

// =============== TEXT ===============
const headlineSmall = TextStyle(
  color: textColor,
  fontWeight: FontWeight.w700,
  fontSize: 24.0,
);

const titleLarge = TextStyle(
  color: textColor,
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

const buttonText = TextStyle(
  color: textColor,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

// =============== PADDING & SIZE ===============
const defaultPadding = 20.0;
const defaultrRadius = 24.0;

// =============== FORM INPUT ===============
// Default
OutlineInputBorder enableOutlineInputBorderMine = OutlineInputBorder(
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.grey.shade200.withOpacity(.2)
  ),
  borderRadius: BorderRadius.circular(defaultrRadius)
);

// Default
OutlineInputBorder focusOutlineInputBorderMine = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 1.0,
    color: primaryColor
  ),
  borderRadius: BorderRadius.circular(defaultrRadius)
);


