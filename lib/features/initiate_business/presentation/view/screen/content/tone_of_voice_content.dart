import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/tone_of_voice_card.dart';

class ToneOfVoiceContent extends StatelessWidget {
  const ToneOfVoiceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Expanded(
          child: BlocBuilder<InitiateBusinessCubit, InitiateBusinessState>(
            buildWhen: (previous, current) =>
                previous.toneOfVoiceStatus != current.toneOfVoiceStatus ||
                previous.toneOfVoice != current.toneOfVoice ||
                previous.createBusinessBody != current.createBusinessBody,
            builder: (context, state) {
              return ApiResponseWidget(
                cubitState: state.toneOfVoiceStatus,
                isEmpty: state.toneOfVoice.isEmpty,
                onReload: () =>
                    context.read<InitiateBusinessCubit>().getToneOfVoice(),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final tone = state.toneOfVoice[index];
                    return ToneOfVoiceCard(
                      model: tone,
                      isSelected:
                          state.createBusinessBody?.toneOfVoiceId == tone.id,
                      onTap: () {
                        if (state.createBusinessBody?.toneOfVoiceId ==
                            tone.id) {
                          return;
                        }
                        context.read<InitiateBusinessCubit>().setTone(
                          tone.id ?? '',
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) => 24.verticalSpace,
                  itemCount: state.toneOfVoice.length,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
