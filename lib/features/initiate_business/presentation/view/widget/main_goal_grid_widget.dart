import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_target_audience_card.dart';

class MainGoalGridWidget extends StatelessWidget {
  const MainGoalGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitiateBusinessCubit, InitiateBusinessState>(
      buildWhen: (previous, current) =>
          previous.mainGoalStatus != current.mainGoalStatus ||
          previous.createBusinessBody != current.createBusinessBody ||
          previous.mainGoal != current.mainGoal,
      builder: (context, state) {
        return ApiResponseWidget(
          cubitState: state.mainGoalStatus,
          isEmpty: state.mainGoal.isEmpty,
          onReload: () => context.read<InitiateBusinessCubit>().getMainGoal(),
          child: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 2.5,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomTargetAudienceCard(
                label: state.mainGoal[index].title ?? '',
                isSelected:
                    state.createBusinessBody?.mainGoalId ==
                    state.mainGoal[index].id,
                onTap: () {
                  if (state.createBusinessBody?.mainGoalId ==
                      state.mainGoal[index].id) {
                    return;
                  }
                  context.read<InitiateBusinessCubit>().setMainGoal(
                    state.mainGoal[index].id ?? '',
                  );
                },
              );
            }, childCount: state.mainGoal.length),
          ),
        );
      },
    );
  }
}