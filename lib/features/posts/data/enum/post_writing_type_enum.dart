import 'package:postify/core/locale/app_locale_key.dart';

enum PostWritingTypeEnum { HASHTAGS, EMOJIS }

extension PostWritingTypeEnumExtension on PostWritingTypeEnum {
  String get value {
    switch (this) {
      case PostWritingTypeEnum.HASHTAGS:
        return AppLocaleKey.hashtags;
      case PostWritingTypeEnum.EMOJIS:
        return AppLocaleKey.emojis;
    }
  }
}
