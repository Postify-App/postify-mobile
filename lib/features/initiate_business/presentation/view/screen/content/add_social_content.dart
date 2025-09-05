import 'package:flutter/material.dart';

class AddSocialContent extends StatelessWidget {
  const AddSocialContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Add social media links here
        Center(
          child: Text(
            'Social Media Content',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
