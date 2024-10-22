import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'image_cropper_model.dart';
export 'image_cropper_model.dart';

class ImageCropperWidget extends StatefulWidget {
  const ImageCropperWidget({
    super.key,
    required this.uploadedFile,
  });

  final FFUploadedFile? uploadedFile;

  @override
  State<ImageCropperWidget> createState() => _ImageCropperWidgetState();
}

class _ImageCropperWidgetState extends State<ImageCropperWidget> {
  late ImageCropperModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageCropperModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: custom_widgets.GhostCodingImageCropper(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        top: 0.0,
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        cancelButtonBackground: FlutterFlowTheme.of(context).primaryBackground,
        cropButtonBackground: FlutterFlowTheme.of(context).primaryBackground,
        cancelButtonBorderRadius: 0.0,
        cropButtonBorderRadius: 0.0,
        cropButtonElevation: 0.0,
        cancelButtonElevation: 0.0,
        cancelButtonText: 'Cancel',
        cropButtonText: 'Crop',
        widgetBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        baseColor: FlutterFlowTheme.of(context).primaryBackground,
        maskColor: const Color(0x4C08536F),
        dotControlColor: const Color(0x8300FF3A),
        cancelTextFontSize: 16.0,
        cropTextFontSize: 16.0,
        cancelTextColor: FlutterFlowTheme.of(context).alternate,
        cropTextColor: const Color(0xFF03FF3B),
        buttonSpacing: 0.0,
        rowAllAroundPadding: 10.0,
        cancelButtonPaddingVertical: 0.0,
        cancelButtonPaddingHorizontal: 0.0,
        cropButtonPaddingVertical: 0.0,
        cropButtonPaddingHorizontal: 0.0,
        imageFile: widget.uploadedFile,
        aspectRatio: 1.0,
        withCircleUI: true,
        cropInitialAreaPadding: 10.0,
        showDotControl: false,
        callBackAction: (croppedImage) async {
          FFAppState().croppedImage =
              functions.convertUploadedFileToString(croppedImage)!;
          safeSetState(() {});
          Navigator.pop(context);
        },
      ),
    );
  }
}
