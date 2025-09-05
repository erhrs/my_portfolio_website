import 'package:flutter/material.dart';

class ScreenshotGallery extends StatefulWidget {
  final List<String> imagePaths;

  const ScreenshotGallery({super.key, required this.imagePaths});

  @override
  State<ScreenshotGallery> createState() => _ScreenshotGalleryState();
}

class _ScreenshotGalleryState extends State<ScreenshotGallery> {
  int _currentIndex = 0;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      insetPadding: const EdgeInsets.all(10),
                      backgroundColor: Colors.black,
                      child: Stack(
                        children: [
                          InteractiveViewer(
                            child: Image.asset(
                              widget.imagePaths[_currentIndex],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ],
                      )

                    );
                  },
                );
              },
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovering = true),
                onExit: (_) => setState(() => _isHovering = false),
                child: AnimatedScale(
                  scale: _isHovering && !isMobile ? 1.03 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: Image.asset(
                        widget.imagePaths[_currentIndex],
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 5,
              children: List.generate(widget.imagePaths.length, (index) {
                final selected = _currentIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _currentIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: selected ? Colors.indigo : Colors.grey,
                          width: selected ? 2 : 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        widget.imagePaths[index],
                        width: 60,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            )
          ],
        );
      },
    );
  }
}

