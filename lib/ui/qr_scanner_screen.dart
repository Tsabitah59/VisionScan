import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/const.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 
          "QR Scanner",
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor,
          ),

          // Scanner
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultrRadius),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .70,
                child: MobileScanner(
                  controller: MobileScannerController(
                    // Berapa lama camera menunggu result. noDuplicate berfungsi untuk sekali take
                    detectionSpeed: DetectionSpeed.noDuplicates,
                
                    // Mengembalikan image
                    returnImage: true,
                  ),
                  onDetect: (capture) {
                    // Menyimpan barcode yang ditangkap
                    final List<Barcode> barcodes = capture.barcodes;
                    
                    // Uint8List => Menyimpan data sebesar 8 bit
                    final Uint8List? image = capture.image;
                
                    // Jika ada barcode yang terdeteksi
                    for (final barcode in barcodes) {
                      // rawValue adalah data mentah dari QR-nya. Berupa link atau kode dari QR tersebut
                      print('Barcode is valid! Here is the source: ${barcode.rawValue}');
                    }
                
                    if (image != null) {
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: MediaQuery.of(context).size.height * .75,
                                  decoration: BoxDecoration(
                                    gradient: backgroundGradientThinColor,
                                    border: Border.all(
                                      width: 1,
                                      color: primaryColor.withOpacity(.3)
                                    ),
                                    borderRadius: BorderRadius.circular(defaultrRadius)
                                  ),
                                  child: AlertDialog(
                                    backgroundColor: Colors.transparent,
                                    title: InkWell(
                                      onTap: () {
                                        final String? rawValue = barcodes.first.rawValue;
                                        if (rawValue != null) {
                                          if (Uri.tryParse(rawValue)?.hasAbsolutePath ?? false) {
                                            _launchUrl(rawValue);
                                          } else {
                                            print('$rawValue');
                                          }
                                        } 
                                      },
                                      child: Text(
                                        barcodes.first.rawValue ?? "No reference found from this QR code",
                                        style: buttonText,
                                      ),
                                    ),
                                    content: ClipRRect(
                                      borderRadius: BorderRadius.circular(defaultrRadius),
                                      child: Image(
                                        // Cara menampilkan image yang ramah ke RAM
                                        image: MemoryImage(image)
                                        // Decode: Compress size dari sebuah objek
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(
                  color: textColor, 
                  width: 2
                ),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          // Ikon tambahan 
          Positioned(
            bottom: MediaQuery.of(context).size.height * .06,
            left: 0,
            right: 0,
            child: Center(
              child: IconButton(
                style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(defaultPadding),
                  backgroundColor: primaryColor
                ),
                icon: const Icon(Icons.qr_code_rounded, color: textColor, size: 32),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}