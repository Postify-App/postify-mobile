import 'package:flutter/material.dart';

class BusinessInfoContent extends StatelessWidget {
  const BusinessInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Add business info form here
        Center(
          child: Text(
            'Business Info Content',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
