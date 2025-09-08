import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postify/core/custom_widgets/api_response_widget/api_response_widget.dart';
import 'package:postify/core/extension/animation_extensions/animated_list_extension.dart';
import 'package:postify/features/businesses/presentation/controller/businesses_cubit.dart';
import 'package:postify/features/businesses/presentation/view/widget/custom_business_card_section.dart';

class BusinessesListWidget extends StatelessWidget {
  const BusinessesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BusinessesCubit, BusinessesState>(
        builder: (context, state) {
          return ApiResponseWidget(
            cubitState: state.getBusinessesStatus,
            onReload: () => context.read<BusinessesCubit>().getBusinesses(),
            isEmpty: state.businesses.isEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListView.separated(
                separatorBuilder: (context, index) => 24.verticalSpace,
                itemCount: state.businesses.length,
                itemBuilder: (context, index) =>
                    CustomBusinessCardSectionWidget(
                      businessModel: state.businesses[index],
                    ).animateStaggered(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
