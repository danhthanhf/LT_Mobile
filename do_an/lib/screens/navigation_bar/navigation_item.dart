import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationItem extends StatefulWidget {
  final String icon;
  final double iconWidth;
  final double iconHeight;
  final Color textColor;
  final VoidCallback onTap;
  final bool isSelected;

  const NavigationItem({
    super.key,
    required this.icon,
    required this.iconWidth,
    required this.iconHeight,
    this.textColor = const Color(0xFF202244),
    required this.onTap,
    required this.isSelected,
  });

  @override
  _NavigationItemState createState() => _NavigationItemState();
}

class _NavigationItemState extends State<NavigationItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // Xử lý khi nhấn vào
      borderRadius: BorderRadius.circular(8), // Thêm bo góc cho vùng nhấn
      splashColor: Colors.blue.withOpacity(0.3), // Màu splash (hiệu ứng khi nhấn)
      highlightColor: Colors.blue.withOpacity(0.1), // Màu highlight (khi nhấn vào)
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: widget.isSelected ? 1.2 : 1.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: AnimatedOpacity(
                opacity: widget.isSelected ? 1.0 : 0.7,
                duration: const Duration(milliseconds: 150),
                child: SvgPicture.asset(
                  widget.icon,
                  width: widget.iconWidth,
                  height: widget.iconHeight,
                  fit: BoxFit.contain,
                  color: widget.isSelected ? widget.textColor : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
