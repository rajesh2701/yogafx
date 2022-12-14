// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yogafx/view/view.dart';

class CheckBoxFormField extends FormField<bool> {
  final bool isChecked;
  final Widget label;
  final void Function(bool?) onChanged;

  CheckBoxFormField({
    super.key,
    required this.isChecked,
    required this.label,
    required this.onChanged,
    required FormFieldValidator<bool> validator,
  }) : super(
            initialValue: isChecked,
            validator: validator,
            builder: (field) {
              void onChangedHandler(bool? value) {
                field.didChange(value);
                onChanged(value);
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: onChangedHandler,
                        activeColor: AppColorsTheme.accentColor,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      label
                    ],
                  ),
                  field.isValid
                      ? const SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            field.errorText ?? '',
                            style:
                                TextStyle(color: Colors.red, fontSize: 16.sp),
                          ),
                        )
                ],
              );
            });

  @override
  _CheckBoxFormFieldState createState() => _CheckBoxFormFieldState();
}

class _CheckBoxFormFieldState extends FormFieldState<bool> {
  @override
  CheckBoxFormField get widget => super.widget as CheckBoxFormField;

  @override
  void didChange(bool? value) {
    super.didChange(value);
  }
}
