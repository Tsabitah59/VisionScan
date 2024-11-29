import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_scanner/const.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

final ScreenshotController screenshotController = ScreenshotController();

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrRawValue;
  String? nameQrValue;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  void generateQr() {
    setState(() {
      nameQrValue = nameController.text.trim();
      qrRawValue = linkController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text( 
          "QR Generator",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
          
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      label: Text("Name Your QR")
                    ),
                    style: const TextStyle(color: textColor),
                    onSubmitted: (value) {
                      setState(() {
                        nameQrValue = value;
                      });
                    },
                  ),
          
                  const SizedBox(height: defaultPadding),
                  
                  TextField(
                    controller: linkController,
                    decoration: const InputDecoration(
                      label: Text("The Link"),
                    ),
                    style: const TextStyle(color: textColor),
                    onSubmitted: (value) {
                      setState(() {
                        qrRawValue = value;
                      });
                    },
                  ),
          
                  const SizedBox(height: defaultPadding),
          
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 3,
                        vertical: defaultPadding / 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(defaultrRadius)
                      )
                    ),
                    onPressed: generateQr,
                    child: const Text(
                      "Generate",
                      style: buttonText,
                    ),
                  ),
          
                ],
              ),
          
              if(qrRawValue != null && nameQrValue != null)
              Column(
                children: [
                  const SizedBox(height: defaultPadding * 3),

                  Screenshot(
                    controller: screenshotController,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1, 
                          color: primaryColor.withOpacity(.3)
                        ),
                        borderRadius: BorderRadius.circular(defaultrRadius + defaultPadding),
                        gradient: backgroundGradientColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Column(
                          children: [
                            Text(
                              nameQrValue!,
                              style: titleLarge,
                            ),
                            const SizedBox(height: defaultPadding),
                            Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(defaultrRadius),
                                color: textColor
                              ),
                              child: PrettyQrView.data(data: qrRawValue!)
                            ),
                          ],
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 3,
                        vertical: defaultPadding / 2,
                      ),
                    ),
                    onPressed: () async {
                      final image = await screenshotController.capture();
                      if (image != null) {
                        Share.shareXFiles([XFile.fromData(image, mimeType: "image/png")]);
                      }
                    }, 
                    child: const Text(
                    "Screenshot",
                      style: buttonText,
                    )
                  )
                ],
              )

              else Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
                child: const Text(
                  "Your QR code will show here.",
                  style: buttonText
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}