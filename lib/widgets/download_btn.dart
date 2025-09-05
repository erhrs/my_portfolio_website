import 'package:flutter/material.dart';
import 'dart:html' as html;


class DownloadResumeButton extends StatefulWidget {
  const DownloadResumeButton({super.key});

  @override
  State<DownloadResumeButton> createState() => _DownloadResumeButtonState();
}

class _DownloadResumeButtonState extends State<DownloadResumeButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: isHovering
              ? const LinearGradient(
            colors: [Color(0xFF00F260), Color(0xFF0575E6)],
          )
              : const LinearGradient(
            colors: [Color(0xFF4A00E0), Color(0xFF8E2DE2)],
          ),
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 6,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            const url = 'assets/HarshYadav.pdf';
            html.AnchorElement(href: url)
              ..setAttribute('download', 'HarshYadav.pdf')
              ..click();
          },
          icon: const Icon(Icons.download, color: Colors.white),
          label: const Text(
            "Download Resume",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
