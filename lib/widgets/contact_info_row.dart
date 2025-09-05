import 'package:flutter/material.dart';
class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(width: 12),
        Expanded(
          child: SelectableText(
            '$label: $value',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
