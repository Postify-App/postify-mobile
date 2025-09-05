import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';

class InitiateBusinessStep {
  final String title;
  final String subtitle;
  final InitiateBusinessStepType stepType;

  InitiateBusinessStep({
    required this.title,
    required this.subtitle,
    required this.stepType,
  });
}
