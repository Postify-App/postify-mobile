import 'package:flutter/material.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/tone_of_voice_card.dart';

class ToneOfVoiceContent extends StatefulWidget {
  const ToneOfVoiceContent({super.key});

  @override
  State<ToneOfVoiceContent> createState() => _ToneOfVoiceContentState();
}

class _ToneOfVoiceContentState extends State<ToneOfVoiceContent> {
      final tones = [
      'Friendly & Fun',
      'Bold & Direct',
      'Silly & Goofy',
      'Wellness & Calm',
      'Motivational',
    ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: tones
          .map(
            (tone) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ToneOfVoiceCard(tone: tone, isSelected: tone == 'Friendly & Fun',),
            ),
          )
          .toList(),
    );
  }
}