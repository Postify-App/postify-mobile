import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:postify/core/locale/app_locale_key.dart';
import 'package:postify/features/initiate_business/data/enum/initiate_business_step_type_enum.dart';
import 'package:postify/features/initiate_business/presentation/view/screen/content/add_social_content.dart';
import 'package:postify/features/initiate_business/presentation/view/screen/content/business_info_content.dart';
import 'package:postify/features/initiate_business/presentation/view/screen/content/choose_topic_content.dart';
import 'package:postify/features/initiate_business/presentation/view/screen/content/target_audience_content.dart';
import 'package:postify/features/initiate_business/presentation/view/screen/content/tone_of_voice_content.dart';

extension InitiateBusinessStepExtension on InitiateBusinessStepType {
  String get title {
    switch (this) {
      case InitiateBusinessStepType.topic:
        return AppLocaleKey.chooseTopic.tr();
      case InitiateBusinessStepType.tone:
        return AppLocaleKey.toneOfVoice.tr();
      case InitiateBusinessStepType.target:
        return AppLocaleKey.targetAudience.tr();
      case InitiateBusinessStepType.businessInfo:
        return AppLocaleKey.businessInfo.tr();
      case InitiateBusinessStepType.social:
        return AppLocaleKey.socialMedia.tr();
    }
  }

  String get subtitle {
    switch (this) {
      case InitiateBusinessStepType.topic:
        return AppLocaleKey.whatBusinessBasedOn.tr();
      case InitiateBusinessStepType.tone:
        return AppLocaleKey.howBrandSound.tr();
      case InitiateBusinessStepType.target:
        return AppLocaleKey.whoTryingToReach.tr();
      case InitiateBusinessStepType.businessInfo:
        return AppLocaleKey.setupBusinessProfile.tr();
      case InitiateBusinessStepType.social:
        return AppLocaleKey.linkYourAccounts.tr();
    }
  }

  Widget get content {
    switch (this) {
      case InitiateBusinessStepType.topic:
        return const ChooseTopicContent();
      case InitiateBusinessStepType.tone:
        return const ToneOfVoiceContent();
      case InitiateBusinessStepType.target:
        return const TargetAudienceContent();
      case InitiateBusinessStepType.businessInfo:
        return const BusinessInfoContent();
      case InitiateBusinessStepType.social:
        return const AddSocialContent();
    }
  }
}
