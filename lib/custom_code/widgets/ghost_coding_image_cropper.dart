// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// This code is the intellectual property of Ghost Coding and is not to be edited. This code is only allowed to be used for the purposes of implementation and not be sold.

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:typed_data' show Uint8List;
import 'dart:typed_data';

class GhostCodingImageCropper extends StatefulWidget {
  const GhostCodingImageCropper({
    super.key,
    this.width,
    this.height,
    this.imageFile,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.callBackAction,
    this.cancelButtonBackground,
    this.cropButtonBackground,
    this.cancelButtonBorderRadius,
    this.cropButtonBorderRadius,
    required this.cropButtonElevation,
    required this.cancelButtonElevation,
    required this.cancelButtonText,
    required this.cropButtonText,
    required this.widgetBackgroundColor,
    required this.baseColor,
    required this.maskColor,
    required this.dotControlColor,
    required this.cancelTextFontSize,
    required this.cropTextFontSize,
    required this.cancelTextColor,
    required this.cropTextColor,
    required this.buttonSpacing,
    required this.rowAllAroundPadding,
    required this.cancelButtonPaddingVertical,
    required this.cancelButtonPaddingHorizontal,
    required this.cropButtonPaddingVertical,
    required this.cropButtonPaddingHorizontal,
    required this.aspectRatio,
    required this.withCircleUI,
    required this.cropInitialAreaPadding,
    this.showDotControl = true,
  });

  final double? width;
  final double? height;
  final FFUploadedFile? imageFile;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? cropButtonBorderRadius;
  final double? cancelButtonBorderRadius;
  final double? cancelButtonElevation;
  final double? cropButtonElevation;
  final String cancelButtonText;
  final String cropButtonText;
  final double cancelTextFontSize;
  final double cropTextFontSize;
  final Color cancelTextColor;
  final Color cropTextColor;
  final double buttonSpacing;
  final double rowAllAroundPadding;
  final double cancelButtonPaddingVertical;
  final double cancelButtonPaddingHorizontal;
  final double cropButtonPaddingVertical;
  final double cropButtonPaddingHorizontal;
  final Color? cancelButtonBackground;
  final Color? cropButtonBackground;
  final Color widgetBackgroundColor;
  final Color baseColor;
  final Color maskColor;
  final Color dotControlColor;
  final double aspectRatio;
  final bool showDotControl;
  final bool withCircleUI;
  final double cropInitialAreaPadding;
  final Future Function(FFUploadedFile croppedImage)? callBackAction;

  @override
  State<GhostCodingImageCropper> createState() =>
      _GhostCodingImageCropperState();
}

class _GhostCodingImageCropperState extends State<GhostCodingImageCropper> {
  bool loading = false;
  final _cropController = CropController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: widget.widgetBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Crop(
                image: Uint8List.fromList(widget.imageFile!.bytes!),
                controller: _cropController,
                onCropped: (image) async {
                  // Create FFUploadedFile from cropped image bytes
                  final croppedFile = FFUploadedFile(
                    name: widget.imageFile!.name,
                    bytes: image,
                    height: null, // Height can be calculated if needed
                    width: null, // Width can be calculated if needed
                    blurHash: null,
                  );

                  // Call the callback action with the cropped file
                  if (widget.callBackAction != null) {
                    await widget.callBackAction!(croppedFile);
                  }

                  setState(() {
                    loading = false;
                  });
                },
                aspectRatio: widget.aspectRatio,
                initialSize: 0.5,
                initialAreaBuilder: (rect) {
                  final aspectRatio = widget.aspectRatio;
                  final imageAspectRatio = rect.width / rect.height;

                  double cropWidth, cropHeight;
                  double offsetX = 0, offsetY = 0;

                  if (imageAspectRatio > aspectRatio) {
                    // Image is wider than the desired aspect ratio
                    cropHeight = rect.height;
                    cropWidth = cropHeight * aspectRatio;
                    offsetX = (rect.width - cropWidth) / 2;
                  } else {
                    // Image is taller than the desired aspect ratio or perfectly matched
                    cropWidth = rect.width;
                    cropHeight = cropWidth / aspectRatio;
                    offsetY = (rect.height - cropHeight) / 2;
                  }

                  final padding = widget.cropInitialAreaPadding;
                  return Rect.fromLTWH(
                    rect.left + offsetX + padding,
                    rect.top + offsetY + padding,
                    cropWidth - padding * 2,
                    cropHeight - padding * 2,
                  );
                },
                withCircleUi: widget.withCircleUI,
                baseColor: widget.baseColor,
                maskColor: widget.maskColor,
                radius: 20,
                onMoved: (newRect) {},
                onStatusChanged: (status) {},
                cornerDotBuilder: (size, edgeAlignment) => widget.showDotControl
                    ? DotControl(
                        color: widget.dotControlColor,
                      )
                    : Container(),
                interactive: true,
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.rowAllAroundPadding),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: widget.cancelButtonPaddingVertical,
                          horizontal: widget.cancelButtonPaddingHorizontal,
                        ),
                        backgroundColor: widget.cancelButtonBackground,
                        textStyle: TextStyle(
                          fontFamily: 'Inter',
                          color: widget.cancelTextColor,
                          fontSize: widget.cancelTextFontSize,
                          letterSpacing: 0,
                        ),
                        elevation: widget.cancelButtonElevation,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              widget.cancelButtonBorderRadius ?? 0),
                        ),
                      ),
                      child: Text(
                        widget.cancelButtonText,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: widget.cancelTextFontSize,
                          letterSpacing: 0.0,
                          color: widget.cancelTextColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: widget.buttonSpacing),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (!loading) {
                          setState(() {
                            loading = true;
                          });
                          await Future.delayed(
                              const Duration(milliseconds: 200), () {
                            _cropController.crop();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: widget.cropButtonPaddingVertical,
                          horizontal: widget.cropButtonPaddingHorizontal,
                        ),
                        backgroundColor: widget.cropButtonBackground,
                        textStyle: TextStyle(
                          fontFamily: 'Inter',
                          color: widget.cropTextColor,
                          fontSize: widget.cropTextFontSize,
                          letterSpacing: 0,
                        ),
                        elevation: widget.cropButtonElevation,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              widget.cropButtonBorderRadius ?? 0),
                        ),
                      ),
                      child: Text(
                        widget.cropButtonText,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: widget.cropTextFontSize,
                          letterSpacing: 0.0,
                          color: widget.cropTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
