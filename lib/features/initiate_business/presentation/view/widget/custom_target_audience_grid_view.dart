import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_target_audience_card.dart';

class CustomTargetAudienceGridView extends StatelessWidget {
  const CustomTargetAudienceGridView({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onSelect,
  });
  final List<String> options;
  final int selectedIndex;
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 16.h,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        return CustomTargetAudienceCard(
          label: options[index],
          isSelected: selectedIndex == index,
          onTap: () => onSelect(index),
        );
      },
    );
  }
}
