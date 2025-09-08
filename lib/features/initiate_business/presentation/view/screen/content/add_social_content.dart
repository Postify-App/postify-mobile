import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/features/initiate_business/data/model/initiate_general_model.dart';
import 'package:postify/features/initiate_business/presentation/view/widget/custom_add_social_card.dart';

class AddSocialContent extends StatefulWidget {
  const AddSocialContent({super.key});

  @override
  State<AddSocialContent> createState() => _AddSocialContentState();
}

class _AddSocialContentState extends State<AddSocialContent> {

  final ValueNotifier<Set<int>> selectedIndices = ValueNotifier({});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,

        Expanded(
          child: ValueListenableBuilder<Set<int>>(
            valueListenable: selectedIndices,
            builder: (context, selected, _) {
              return ListView.separated(
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemCount: socialOptions.length,
                itemBuilder: (context, index) {
                  final isSelected = selected.contains(index);

                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: CustomAddSocialCard(
                      model: socialOptions[index],
                      isSelected: isSelected,
                      onTap: () {
                        final updated = Set<int>.from(selected);
                        if (isSelected) {
                          updated.remove(index);
                        } else {
                          updated.add(index);
                        }
                        selectedIndices.value = updated;
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
