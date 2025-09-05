import 'package:flutter/material.dart';
import 'package:my_portfolio_website/widgets/screenshot_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String? playStoreUrl;
  final List<String> screenshots;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.playStoreUrl,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      // Increased elevation for more depth
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      // Rounded corners
      shadowColor: Colors.black.withValues(alpha: 0.15),
      // Softer shadow color
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 350),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                    ScreenshotGallery(imagePaths: screenshots), // Rounded image
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold, // Bold title
                      fontSize: 20, // Larger font size
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              if(playStoreUrl!=null)ElevatedButton.icon(
                onPressed: () async {
                  final Uri url = Uri.parse(playStoreUrl!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    debugPrint('Could not launch $playStoreUrl');
                  }
                },
                icon: const Icon(Icons.open_in_new,
                    size: 18, color: Colors.white),
                label: const Text(
                  'View on Play Store',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
