import 'package:flutter/material.dart';
import 'package:myapp/presentation/widgets/paytm.dart';
import 'package:myapp/presentation/widgets/summary_card.dart';
import 'package:myapp/presentation/widgets/upi_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Title(color: Colors.black, child: const Text('Payment Page')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SummaryWidget(
                title: "SUMMARY",
                iconPath: 'assets/summary_icon.svg',
                originalPriceLabel: "Original Course Price:",
                discountLabel: "Discount Applied:",
                amountToPayLabel: "Amount to be paid:",
                originalPrice: 11999,
                discount: 4000,
                amountToPay: 7999,
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(fontSize: 16, color: Colors.black),
                labelTextStyle: TextStyle(fontSize: 14, color: Colors.black),
                priceTextStyle: TextStyle(fontSize: 14, color: Colors.black),
                amountTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              UpiAppsWidget(
                title: "UPI APPS",
                apps: [
                  UpiApp(iconPath: 'assets/phonepe_icon.svg', label: 'PhonePe'),
                  UpiApp(iconPath: 'assets/google-pay-icon.svg', label: 'GPay'),
                  UpiApp(iconPath: 'assets/bhim_icon.svg', label: 'BHIM'),
                  UpiApp(iconPath: 'assets/Amazon_icon.svg', label: 'Amazon'),
                ],
                otherOptionsLabel: "OTHER UPI OPTIONS",
                onOtherOptionsTap: () {
                  // Handle tap on 'Other UPI Options'
                },
                backgroundColor: Colors.white,
                titleTextStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                appLabelTextStyle:
                    const TextStyle(fontSize: 14, color: Colors.black),
                otherOptionsTextStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 16.0),
              PayOptionWidget(
                iconPath:
                    'assets/Paytm_logo.svg', // Replace with your asset path
                title: "PAY VIA PAYTM",
                subtitle: "PayTM wallet, UPI & others",
                onTap: () {
                  // Handle tap on PayTM option
                },
                backgroundColor: Colors.white,
                titleTextStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                subtitleTextStyle:
                    const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
