import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_selector.dart';

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  final _filters = [
    Colors.white,
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    ),
  ];

  final _filterColor = ValueNotifier<Color>(Colors.white);

  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Photo')),
      body: Material(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: _buildPhotoWithFilter(),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: _buildFilterSelector(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder<Color>(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        return Image.file(
          File(widget.imagePath),
          fit: BoxFit.cover,
          color: color.withOpacity(0.5),
          colorBlendMode: BlendMode.color,
        );
      },
    );
  }

  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged,
      filters: _filters,
    );
  }
}
