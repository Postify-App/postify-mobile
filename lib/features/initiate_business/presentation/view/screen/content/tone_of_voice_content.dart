import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  ValueNotifier<String?> selectedTone = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              final tone = tones[index];
              return ValueListenableBuilder(
                valueListenable: selectedTone,
                builder: (context, value, child) {
                  return CustomBusinessCard(
                    value: tone,
                    isSelected: value == tone,
                    onTap: () {
                      selectedTone.value = tone;
                    },
                  );
                },
              );
            },
            separatorBuilder: (context, index) => 24.verticalSpace,
            itemCount: tones.length,
          ),
        ),
      ],
    );
  }
}
