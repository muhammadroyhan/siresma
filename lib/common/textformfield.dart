import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:siresma/common/colors.dart';
import 'package:siresma/common/text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.enable,
    required this.obscureText,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: TextFormField(
        style: AppStyle(16.sp, Colors.black, FontWeight.bold),
        enableInteractiveSelection: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        enabled: enable,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: backgroundft,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          hintStyle: AppStyle(16.sp, hintstyle, FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextFormFieldPassword extends StatefulWidget {
  const CustomTextFormFieldPassword({
    Key? key,
    required this.hint,
    required this.enable,
    required this.obscureText,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    // bool _showPassword = false;
    // void _togglePasswordVisibility() {
    //   setState(() {
    //     _showPassword = !_showPassword;
    //   });
    // }

    return SizedBox(
      width: 250.w,
      child: TextFormField(
        style: AppStyle(16.sp, Colors.black, FontWeight.bold),
        enableInteractiveSelection: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        enabled: widget.enable,
        controller: widget.controller,
        onChanged: widget.onChanged,
        initialValue: widget.initialValue,
        validator: widget.validator,
        obscureText: widget.obscureText && !_showPassword,
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          fillColor: backgroundft,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  color: _showPassword ? primaryColor1 : Colors.grey.shade600
                )
              : null,
          hintStyle: AppStyle(16.sp, hintstyle, FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextFormFieldNumber extends StatelessWidget {
  const CustomTextFormFieldNumber({
    Key? key,
    required this.hint,
    required this.enable,
    required this.obscureText,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: TextFormField(
        style: AppStyle(16.sp, Colors.black, FontWeight.bold),
        keyboardType: TextInputType.number,
        enableInteractiveSelection: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        enabled: enable,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: backgroundft,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          hintStyle: AppStyle(16.sp, hintstyle, FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextFormFieldSetor extends StatelessWidget {
  const CustomTextFormFieldSetor({
    Key? key,
    required this.hint,
    required this.enable,
    required this.obscureText,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: TextFormField(
        style: AppStyle(16.sp, primaryColor1, FontWeight.bold),
        enableInteractiveSelection: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        enabled: enable,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: backgroundft,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          hintStyle: AppStyle(16.sp, hintstyle, FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextFormFieldEdit extends StatelessWidget {
  const CustomTextFormFieldEdit({
    Key? key,
    required this.hint,
    required this.enable,
    required this.obscureText,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: TextFormField(
        style: AppStyle(16.sp, Colors.black, FontWeight.bold),
        enableInteractiveSelection: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        enabled: enable,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: backgroundft,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          hintStyle: AppStyle(16.sp, hintstyle, FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomTextFormFieldEditNumber extends StatelessWidget {
  const CustomTextFormFieldEditNumber({
    Key? key,
    required this.hint,
    required this.enable,
    required this.obscureText,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: TextFormField(
        style: AppStyle(16.sp, Colors.black, FontWeight.bold),
        enableInteractiveSelection: true,
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textAlignVertical: TextAlignVertical.center,
        obscuringCharacter: '*',
        enabled: enable,
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: backgroundft,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          hintStyle: AppStyle(16.sp, hintstyle, FontWeight.bold),
        ),
      ),
    );
  }
}
