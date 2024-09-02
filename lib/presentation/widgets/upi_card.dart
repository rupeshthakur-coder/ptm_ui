import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

class UpiAppsWidget extends StatelessWidget {
  final String title;
  final List<UpiApp> apps;
  final String otherOptionsLabel;
  final VoidCallback onOtherOptionsTap;
  final Color backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? appLabelTextStyle;
  final TextStyle? otherOptionsTextStyle;

  const UpiAppsWidget({
    super.key,
    required this.title,
    required this.apps,
    required this.otherOptionsLabel,
    required this.onOtherOptionsTap,
    this.backgroundColor = Colors.white,
    this.titleTextStyle,
    this.appLabelTextStyle,
    this.otherOptionsTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius:
            BorderRadius.circular(12.0), // Optional: Add border radius
        boxShadow: const [
          BoxShadow(
            color: Colors.black26, // Shadow color
            blurRadius: 8.0, // Shadow blur radius
            // offset: Offset(0, 4), // Shadow offset
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleTextStyle ??
                const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: apps.map((app) => _buildAppItem(app)).toList(),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: onOtherOptionsTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  otherOptionsLabel,
                  style: otherOptionsTextStyle ??
                      const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {}, // Handle press action here if needed
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppItem(UpiApp app) {
    return Column(
      children: [
        SvgPicture.asset(
          app.iconPath,
          width: 40.0,
          height: 40.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          app.label,
          style: appLabelTextStyle ??
              const TextStyle(fontSize: 14.0, color: Colors.black),
        ),
      ],
    );
  }
}

class UpiApp {
  final String iconPath;
  final String label;

  UpiApp({
    required this.iconPath,
    required this.label,
  });
}
