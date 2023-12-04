import 'package:demo/controller/localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.allOrdersContent.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Image.network('src');
          },
        );
      },
    );
  }
}
