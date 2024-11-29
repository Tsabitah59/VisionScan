import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_scanner/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            // Logo & Name
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2
                ),

                Image.asset(
                  'assets/image/logo-without-bg.png',
                  width: MediaQuery.of(context).size.width * .2,
                ),

                const SizedBox(height: defaultPadding / 2),

                const Text(
                  "VisionScan",
                  style: titleLarge,
                )
              ],
            ),

            const SizedBox(height: defaultPadding * 4),
            // Buttons For Navigation
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultrRadius),
                      ),
                      backgroundColor: primaryColor
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/scan');
                    }, 
                    child: const Text(
                      "QR Scanner",
                      style: headlineSmall
                    ),
                  ),
                ),
            
                const SizedBox(height: defaultPadding),
            
                SizedBox(
                  width: double.infinity,
                  height: 90,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultrRadius),
                      ),
                      backgroundColor: primaryColor
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/generator');
                    }, 
                    child: const Text(
                      "QR Generator",
                      style: headlineSmall
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}