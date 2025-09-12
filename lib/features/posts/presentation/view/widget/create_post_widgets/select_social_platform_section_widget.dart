import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:postify/core/extension/animation_extensions/tap_scale_animation_extension.dart';
import 'package:postify/core/extension/widget_extension.dart';
import 'package:postify/core/theme/app_colors.dart';
import 'package:postify/features/home/data/model/connect_socials_model.dart';

class SelectSocialPlatformListWidget extends StatefulWidget {
  const SelectSocialPlatformListWidget({super.key});

  @override
  State<SelectSocialPlatformListWidget> createState() =>
      _SelectSocialPlatformListWidgetState();
}

class _SelectSocialPlatformListWidgetState
    extends State<SelectSocialPlatformListWidget> {
  ValueNotifier<List<ConnectSocialsModel>> socialOptionsNotifier =
      ValueNotifier([]);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: socialOptionsNotifier,
      builder: (context, value, child) {
        return Row(
          children: [
            ...List.generate(
              mockConnectSocials.length,
              (index) =>
                  ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(
                          mockConnectSocials[index].socialIcon,
                          height: 40,
                          colorFilter:
                              socialOptionsNotifier.value.contains(
                                mockConnectSocials[index],
                              )
                              ? ColorFilter.mode(
                                  AppColor.darkTextColor(context),
                                  BlendMode.xor,
                                )
                              : null,
                        ),
                      )
                      .paddingEnd(8)
                      .onTapScaleAnimation(
                        onTap: () {
                          final updated = List<ConnectSocialsModel>.from(
                            socialOptionsNotifier.value,
                          );
                          if (updated.contains(mockConnectSocials[index])) {
                            updated.remove(mockConnectSocials[index]);
                          } else {
                            updated.add(mockConnectSocials[index]);
                          }
                          socialOptionsNotifier.value = updated;
                        },
                      ),
            ),
          ],
        );
      },
    );
  }
}
