import 'package:flutter/material.dart';
import 'package:qr_scanner/const.dart';
import 'package:qr_scanner/splash_screen.dart';
import 'package:qr_scanner/ui/home/home_screen.dart';
import 'package:qr_scanner/ui/qr_generator_screen.dart';
import 'package:qr_scanner/ui/qr_scanner_screen.dart';

void main() {
  runApp(const QrScannerApp());
}

class QrScannerApp extends StatelessWidget {
  const QrScannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VisionScan",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: textColor,
          ),

          centerTitle: true,
          backgroundColor: backgroundColor,

          titleTextStyle: TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins'
          )
        ),

        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: enableOutlineInputBorderMine,
          focusedBorder: focusOutlineInputBorderMine,
          filled: true,
          fillColor: textColor.withOpacity(.05),
          labelStyle: const TextStyle(color: textColor)

        )

      ),
      initialRoute: "/",
      routes: {
        "/" : (context) => const SplashScreen(),
        "/home" : (context) => const HomeScreen(),
        "/scan": (context) => const QrScannerScreen(),
        "/generator" : (context) => const QrGeneratorScreen(),
      },
    );
  }
}