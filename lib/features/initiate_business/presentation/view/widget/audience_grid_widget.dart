import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart'
    show InitiateBusinessCubit, InitiateBusinessState;
import 'package:postify/features/initiate_business/presentation/view/widget/custom_target_audience_card.dart';

class AudienceGridWidget extends StatelessWidget {
  const AudienceGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitiateBusinessCubit, InitiateBusinessState>(
      buildWhen: (previous, current) =>
          previous.targetAudienceStatus != current.targetAudienceStatus ||
          previous.targetAudience != current.targetAudience ||
          previous.createBusinessBody != current.createBusinessBody,
      builder: (context, state) {
        return ApiResponseWidget.sliver(
          cubitState: state.targetAudienceStatus,
          isEmpty: state.targetAudience.isEmpty,
          onReload: () =>
              context.read<InitiateBusinessCubit>().getTargetAudience(),
          sliverChild: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 2.5,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomTargetAudienceCard(
                label: state.targetAudience[index].title ?? '',
                isSelected:
                    state.createBusinessBody?.targetAudienceId ==
                    state.targetAudience[index].id,
                onTap: () {
                  if (state.createBusinessBody?.targetAudienceId ==
                      state.targetAudience[index].id) {
                    return;
                  }
                  context.read<InitiateBusinessCubit>().setTargetAudience(
                    state.targetAudience[index].id ?? '',
                  );
                },
              );
            }, childCount: state.targetAudience.length),
          ),
        );
      },
    );
  }
}
