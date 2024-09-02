import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SummaryWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final String originalPriceLabel;
  final String discountLabel;
  final String amountToPayLabel;
  final double originalPrice;
  final double discount;
  final double amountToPay;
  final Color backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? labelTextStyle;
  final TextStyle? priceTextStyle;
  final TextStyle? amountTextStyle;

  const SummaryWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.originalPriceLabel,
    required this.discountLabel,
    required this.amountToPayLabel,
    required this.originalPrice,
    required this.discount,
    required this.amountToPay,
    required this.backgroundColor,
    this.titleTextStyle,
    this.labelTextStyle,
    this.priceTextStyle,
    this.amountTextStyle,
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
          Row(
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24.0,
                height: 24.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                title,
                style: titleTextStyle ??
                    const TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          _buildPriceRow(
            label: originalPriceLabel,
            price: originalPrice,
            textStyle: labelTextStyle,
            priceStyle: priceTextStyle,
          ),
          const SizedBox(height: 4.0),
          _buildPriceRow(
            label: discountLabel,
            price: discount,
            textStyle: labelTextStyle,
            priceStyle: priceTextStyle,
            isNegative: true,
          ),
          const Divider(color: Colors.grey),
          const SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                amountToPayLabel,
                style: amountTextStyle ??
                    const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
              ),
              Text(
                '₹${amountToPay.toStringAsFixed(2)}',
                style: amountTextStyle ??
                    const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
        ],
      ),
    );
  }

  Widget _buildPriceRow({
    required String label,
    required double price,
    TextStyle? textStyle,
    TextStyle? priceStyle,
    bool isNegative = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
              textStyle ?? const TextStyle(fontSize: 14.0, color: Colors.black),
        ),
        Text(
          '${isNegative ? '-' : ''}₹${price.toStringAsFixed(2)}',
          style: priceStyle ??
              const TextStyle(fontSize: 14.0, color: Colors.black),
        ),
      ],
    );
  }
}
