import 'dart:typed_data';
import 'package:flutter/material.dart';

class FullScreenImageDialog extends StatelessWidget {
  final Uint8List imageBytes;

  const FullScreenImageDialog({super.key, required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: InteractiveViewer(
          panEnabled: true, // Allows panning
          boundaryMargin: const EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 3.0,

          child: Image.memory(imageBytes, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
