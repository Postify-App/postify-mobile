import 'package:flutter/material.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_topics_list_view_item_widget.dart';

class ChooseTopicContent extends StatelessWidget {
  const ChooseTopicContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CustomTopicsListViewItemWidget();
      },
    );
  }
}
