import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interview_task/src/presentation/core/constants/app_colors.dart';
import 'package:interview_task/src/presentation/core/theme/typography.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.controller,
    this.errorMessage,
    this.keyboardType,
    this.obscureText,
    this.textCapitalization,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.textInputAction,
    this.hint,
    this.autoFocus,
    this.enabled,
    this.maxLength,
    this.passwordField = false,
    this.suffix,
    this.prefix,
    this.validator,
    this.style,
    this.focusNode,
    this.onFieldSubmitted,
    this.inputFormatter,
    this.onChanged,
    this.labelStyle,
    this.autoFillHints,
    this.errorStyle,
    this.suffixIcon,
    this.prefixIcon,
  }) : super(key: key);
  final String label;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final TextStyle? style;
  final bool passwordField;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;
  final Iterable<String>? autoFillHints;
  final TextStyle? errorStyle;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(bottom: kSize.height * 0.015),
            child: Text(
              widget.label,
              style: AppTypography.interSemiBold.copyWith(fontSize: 14, color: AppColors.black),
            ),
          ),
        TextFormField(
          validator: widget.validator,
          obscureText: widget.obscureText ?? false,
          obscuringCharacter: "*",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: widget.style ?? AppTypography.interMedium.copyWith(color: AppColors.black, fontSize: 15),
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
              suffix: widget.suffix,
              suffixIcon: widget.suffixIcon,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppColors.lightRed)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: AppColors.lightRed)),
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
              helperText: widget.errorMessage ?? '',
              hintText: widget.hint,
              hintStyle: AppTypography.interRegular.copyWith(color: AppColors.white),
              errorText: widget.errorMessage,
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
              errorStyle: widget.errorStyle ?? AppTypography.interRegular.copyWith(color: AppColors.lightRed),
              isDense: true,
              counterText: "",
              counter: const SizedBox(),
              contentPadding: const EdgeInsets.all(16.0),
              filled: true,
              fillColor: AppColors.grey, // Colors.white,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide.none)),
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          controller: widget.controller,
        ),
      ],
    );
  }
}
