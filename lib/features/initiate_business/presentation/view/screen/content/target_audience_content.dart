import 'package:flutter/material.dart';

class TargetAudienceContent extends StatelessWidget {
  const TargetAudienceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Add target audience content here
        Center(
          child: Text(
            'Target Audience Content',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}