import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final items = ['Home', 'Projects', 'Contact'];
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return isMobile
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleRow(),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                children: _buildNavItems(items),
              ),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _titleRow(),
              Row(children: _buildNavItems(items)),
            ],
          );
        },
      ),
    );
  }

  Widget _titleRow() {
    return Row(
      children: [
        const Text(
          'Harsh Yadav',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: onToggleTheme,
          icon: Icon(isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round),
        ),
      ],
    );
  }

  List<Widget> _buildNavItems(List<String> items) {
    return List.generate(items.length, (index) {
      final selected = selectedIndex == index;
      return NavItem(
        label: items[index],
        isSelected: selected,
        onTap: () => onItemSelected(index),
      );
    });
  }

}

class NavItem extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isSelected || isHovering
        ? Colors.blue
        : Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isHovering ? Colors.white.withOpacity(0.05) : Colors.transparent,
            boxShadow: isHovering
                ? [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 1,
              )
            ]
                : [],
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
