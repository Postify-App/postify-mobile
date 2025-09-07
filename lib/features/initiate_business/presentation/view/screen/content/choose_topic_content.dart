import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postify/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:postify/features/initiate_business/presentation/controller/initiate_business_cubit.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_topics_list_view_item_widget.dart';

class ChooseTopicContent extends StatelessWidget {
  const ChooseTopicContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitiateBusinessCubit, InitiateBusinessState>(
      buildWhen: (previous, current) =>
          previous.mainTopicsStatus != current.mainTopicsStatus ||
          previous.createBusinessBody != current.createBusinessBody ||
          previous.mainTopics != current.mainTopics,
      builder: (context, state) {
        return ApiResponseWidget(
          cubitState: state.mainTopicsStatus,
          isEmpty: state.mainTopics.isEmpty,
          onReload: () => context.read<InitiateBusinessCubit>().getMainTopics(),
          child: ListView.builder(
            itemCount: state.mainTopics.length,
            itemBuilder: (context, index) {
              return CustomTopicsListViewItemWidget(
                topic: state.mainTopics[index],
                isSelected:
                    state.createBusinessBody?.mainTopicId ==
                    state.mainTopics[index].id,
                onTap: () {
                  if (state.createBusinessBody?.mainTopicId ==
                      state.mainTopics[index].id) {
                    return;
                  }
                  context.read<InitiateBusinessCubit>().setTopic(
                    state.mainTopics[index].id ?? '',
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
