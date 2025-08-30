import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../custom_form_field/custom_form_field.dart';
import '../../../../core/enum/cubit_state/cubit_status.dart';
import '../../images/app_images.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomTextFormFieldDropdownOverlay extends StatefulWidget {
  final List<CustomSelectDropdownItem> items;
  final String? title;
  final String? hintText;
  final Function(dynamic) onItemSelected;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final CubitStatus? cubitState;
  final String? Function(String?)? validator;
  final String? selectedItem;

  const CustomTextFormFieldDropdownOverlay({
    super.key,
    required this.items,
    this.title,
    this.hintText,
    required this.onItemSelected,
    this.width,
    this.height,
    this.prefixIcon,
    this.cubitState,
    this.validator,
    this.selectedItem,
  });

  @override
  State<CustomTextFormFieldDropdownOverlay> createState() =>
      _CustomTextFormFieldDropdownOverlayState();
}

class _CustomTextFormFieldDropdownOverlayState
    extends State<CustomTextFormFieldDropdownOverlay> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _selectedItemEc = TextEditingController();
  dynamic value;
  final ValueNotifier<bool> _isDropdownVisible = ValueNotifier<bool>(false);

  void _showOverlay(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: widget.width ?? MediaQuery.of(context).size.width - 32.w,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, widget.height ?? 40.h),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(8.r),
              color: AppColor.whiteColor(context),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 250.h, minHeight: 50.h),
                child: widget.items.isEmpty
                    ? const Center(
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("لا يوجد بيانات")),
                      )
                    : Scrollbar(
                        interactive: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemCount: widget.items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedItemEc.text =
                                      widget.items[index].name;
                                  value = widget.items[index].value;
                                });
                                widget
                                    .onItemSelected(widget.items[index].value);
                                _isDropdownVisible.value = false;
                                _removeOverlay();
                              },
                              child: Container(
                                color: value == widget.items[index].value
                                    ? AppColor.mainAppColor(context)
                                        .withValues(alpha: .1)
                                    : Colors.transparent,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 8.h),
                                  child: Text(widget.items[index].name,
                                      style:
                                          AppTextStyle.text14BSecond(context)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    _selectedItemEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: CustomFormField(
        readOnly: true,
        onTap: () {
          if (_overlayEntry == null) {
            if (widget.cubitState != CubitStatus.loading) {
              _showOverlay(context);
              _isDropdownVisible.value = true;
            }
          } else {
            _isDropdownVisible.value = false;
            _removeOverlay();
          }
        },
        validator: widget.validator,
        title: widget.title,
        hintText: widget.hintText,
        controller: _selectedItemEc,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.cubitState == CubitStatus.loading
            ? const CupertinoActivityIndicator()
            : ValueListenableBuilder(
                valueListenable: _isDropdownVisible,
                builder: (BuildContext context, bool isVisible, _) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: isVisible
                      ? RotatedBox(
                          quarterTurns: 2,
                          child: SvgPicture.asset(AppImages.assetsSvgArrowDown))
                      : SvgPicture.asset(AppImages.assetsSvgArrowDown),
                ),
              ),
      ),
    );
  }
}

class CustomSelectDropdownItem {
  final dynamic value;
  final String name;

  CustomSelectDropdownItem({required this.value, required this.name});
}
