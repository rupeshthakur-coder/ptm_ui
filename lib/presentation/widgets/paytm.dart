import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayOptionWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  const PayOptionWidget({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.titleTextStyle,
    this.subtitleTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8.0,
              // offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath, width: 30.0, height: 30.0),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: titleTextStyle ??
                      const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: subtitleTextStyle ??
                      const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
            const Spacer(),

            IconButton(
              onPressed: () {}, // Handle press action here if needed
              icon: const Icon(Icons.arrow_forward_ios,
                  color: Colors.black, size: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
