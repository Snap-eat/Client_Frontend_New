// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/utils/colors.dart';
import '../component/text_constant_key.dart';
import '../component/text_style.dart';
import 'country_picker_widget.dart';

// Default text fornm field  for Add new Address class
DefaultTextFormField(
  TextEditingController controller,
  Function(String?) onchange,
  String? hintText,
  Function()? ontap,
) {
  return TextFormField(
      onTap: ontap,
      onChanged: onchange,
      cursorHeight: 20,
      cursorColor: grey90,
      controller: controller,
      enableInteractiveSelection: true,
      autofillHints: const [AutofillHints.newUsername],
      toolbarOptions: ToolbarOptions(copy: true, paste: true, selectAll: true, cut: true),
      style: const TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        filled: true,
        fillColor: white,
        alignLabelWithHint: true,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: black40),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: black40),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: black40),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: black40),
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
        hintText: hintText,
        // contentPadding: EdgeInsets.fromLTRB(10, 0, 15, 0),
      ));
}

// custom textForm field
Widget customTextFormField(Function(String)? onSubmitted, Function(String)? onChanged, bool obscureText, TextEditingController? controller, String autoHints, String? Function(String?)? validator, String? hintText, [Widget? suffixIcon]) {
  return TextFormField(
    onFieldSubmitted: onSubmitted,
    enableInteractiveSelection: true,
    onChanged: onChanged,
    cursorColor: primary,
    obscureText: obscureText,
    controller: controller,
    validator: validator,
    autofillHints: [autoHints],
    enableSuggestions: true,
    toolbarOptions: ToolbarOptions(copy: true, paste: true, cut: true, selectAll: true),
    style: GoogleFonts.ibmPlexSans(color: black, fontSize: 20, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      errorText: '',
      errorStyle: TextStyle(height: 0, fontSize: 0),
      suffixIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: suffixIcon,
      ),
      filled: true,
      hintStyle: TextStyle(color: grey90),
      fillColor: white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: white),
        borderRadius: BorderRadius.circular(8),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: white),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: white),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: white),
        borderRadius: BorderRadius.circular(8),
      ),
      hintText: hintText,
      // isDense: true,
      // contentPadding: EdgeInsets.zero
      contentPadding: EdgeInsets.fromLTRB(10, 15, 0, 15),
    ),
  );
}

//  Enter otp txt form filed onl for  otp verification page
// enterOTPTextFormFiled(
//   onchanged,
//   Function(String)? onFieldSubmitted,
//   controller,
//   Function()? onTap,
// ) {
//   return SizedBox(
//       height: 65,
//       width: 65,
//       child: TextFormField(
//         onTap: onTap,
//         autofocus: true,
//         controller: controller,
//         onChanged: onchanged,
//         showCursor: false,
//         cursorColor: black,
//         enableInteractiveSelection: true,
//         onFieldSubmitted: onFieldSubmitted,
//         style:
//             TextStyle(color: black, fontWeight: FontWeight.w500, fontSize: 20),
//         textAlign: TextAlign.center,
//         decoration: InputDecoration(
//             hintText: "―",
//             hintStyle: TextStyle(color: grey90),
//             filled: true,
//             fillColor: white,
//             isDense: false,
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: white),
//               borderRadius: BorderRadius.circular(50),
//             ),
//             enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(50),
//                 borderSide: const BorderSide(color: white))),
//         keyboardType: TextInputType.number,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//         ],
//       ));
// }

// // custom cuntry code picker
Widget customCuntryCodePicker(
  TextEditingController? controller,
  String? labelText,
  String? hintText,
  Color borderColor, [
  Widget? child,
  FutureOr<String?> Function(PhoneNumber?)? validator,
  Function(PhoneNumber)? onChanged,
]) {
  return IntlPhoneFieldPicker(
    controller: controller,
    invalidNumberMessage: '',
    cursorColor: primary1,
    keyboardType: TextInputType.number,
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black87),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: h * 0.01),
      suffixIcon: Padding(padding: const EdgeInsets.symmetric(vertical: 17), child: child),
      labelText: labelText,
      floatingLabelStyle: TextStyle(color: transparent, fontSize: 0, overflow: TextOverflow.fade),
      labelStyle: TextStyle(color: greyblack, fontSize: 20),
      // hintText: hintText,
      hintStyle: TextStyle(color: grey90, fontSize: 20),
      fillColor: white,
      filled: true,
      errorText: '',
      errorStyle: TextStyle(fontSize: 0, height: 0),
      counterText: '',
      counterStyle: TextStyle(color: Colors.transparent, height: 0, fontSize: 0),
      counter: Offstage(
        offstage: true,
      ),
      border: OutlineInputBorder(borderSide: BorderSide(color: borderColor, width: 0), borderRadius: BorderRadius.circular(8)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor, width: 0), borderRadius: BorderRadius.circular(8)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor, width: 0), borderRadius: BorderRadius.circular(8)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor, width: 0), borderRadius: BorderRadius.circular(8)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor, width: 0), borderRadius: BorderRadius.circular(8)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor, width: 0), borderRadius: BorderRadius.circular(8)),
    ),
    initialCountryCode: 'GB',
    validator: validator,
    onChanged: onChanged,
  );

  // SizedBox(
  //   height: 48,
  //   child: IntlPhoneField(
  //     keyboardType: TextInputType.number,
  //     textAlign: TextAlign.start,
  //     onSubmitted: onSubmitted,
  //     controller: controller,
  //     cursorColor: grey90,
  //     style: TextStyle(
  //         color: Colors.black87, fontSize: 20, fontWeight: FontWeight.w500),
  //     decoration: InputDecoration(
  //         // constraints: BoxConstraints(maxHeight: 55),
  //         isCollapsed: false,
  //         contentPadding: EdgeInsets.only(top: 18),
  //         suffixIcon: suffix,
  //         hintText: hintText,
  //         errorText: '',
  //         errorStyle: TextStyle(fontSize: 0, height: 0),
  //         counterText: '',
  //         counterStyle:
  //             TextStyle(color: Colors.transparent, height: 0, fontSize: 0),
  //         counter: Offstage(
  //           offstage: true,
  //         ),
  //         fillColor: white,
  //         filled: true,
  //         // enabledBorder: OutlineInputBorder(
  //         //   borderSide: const BorderSide(color: black40),
  //         //   borderRadius: BorderRadius.circular(10),
  //         // ),
  //         // focusedBorder: OutlineInputBorder(
  //         //   borderSide: const BorderSide(color: grey),
  //         //   borderRadius: BorderRadius.circular(10),
  //         // ),
  //         hintStyle: TextStyle(
  //             fontSize: 19, color: greyblack, fontWeight: FontWeight.w500),
  //         border: InputBorder.none),
  //     initialCountryCode: 'GB',
  //     showDropdownIcon: true,
  //     dropdownIconPosition: IconPosition.leading,
  //     validator: validator,
  //     onChanged: onChanged,
  //   ),
  // );
}

// defalut textform Field on My detail Profile Screen
Widget DefaultTFField(TextEditingController controller, Function(String?) onchange, String? hintText, Widget? prefixIcon, [Widget? suffixIcon, TextStyle? style]) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: SizedBox(
      height: 55,
      child: TextFormField(
          onChanged: onchange,
          cursorHeight: 20,
          cursorColor: primary_light,
          controller: controller,
          style: const TextStyle(color: black, fontSize: 17),
          decoration: InputDecoration(
              filled: true,
              fillColor: white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: grey, width: 0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: grey, width: 0.8),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: hintText,
              hintStyle: style,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: suffixIcon,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(15),
                child: prefixIcon,
              ))),
    ),
  );
}

// search text form field
Widget searchTextField(Widget? prefix, String? hintText, TextStyle? style, TextStyle? hintStyle, Function()? onTap, Widget? suffix, TextEditingController? controller) {
  return TextFormField(
      controller: controller,
      onTap: () {},
      style: style,
      cursorColor: grey90,
      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: prefix,
          ),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: suffix,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: const EdgeInsets.fromLTRB(15, 15, 0, 10),
          hintText: hintText,
          hintStyle: hintStyle));
}

// message textform filed
Widget messageTextformFiled(
  String? hintText,
  TextEditingController? controller,
) {
  return GestureDetector(
    child: Container(
        height: h * 0.15,
        width: w * 1,
        padding: EdgeInsets.only(left: w * 0.025, top: h * 0.01),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: grey.withOpacity(0.5))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IBMPlexsansText(MESSAGE, black80, FontWeight.bold, 14),
            SizedBox(
              width: w * 0.7,
              child: TextFormField(
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                  textDirection: TextDirection.ltr,
                  controller: controller,
                  cursorHeight: 17,
                  onTap: () {},
                  style: GoogleFonts.alegreyaSans(fontSize: 17, color: grey90),
                  cursorColor: primary_light,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                    hintText: hintText,
                    hintStyle: GoogleFonts.alegreyaSans(fontSize: 17, color: grey90, fontStyle: FontStyle.italic),
                  )),
            ),
          ],
        )),
  );
}

// custom textform field for add payment method bottom seet  only

Widget searchTextformField(
  // FocusNode? focusNode,
  Function(String)? onFieldSubmitted,
  Widget? prefix,
  TextEditingController? controller,
  String? hintText,
  TextAlign textAlign,
  int? maxLength,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters, [
  Widget? suffixIcon,
]) {
  return TextFormField(
      autofocus: true,
      // focusNode: focusNode,
      controller: controller,
      textAlign: textAlign,
      maxLength: maxLength,
      keyboardType: keyboardType,
      cursorHeight: 17,
      onChanged: onFieldSubmitted,
      style: TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 14),
      cursorColor: primary_light,
      decoration: InputDecoration(
        counterStyle: TextStyle(height: 0, fontSize: 0),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: prefix,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: grey),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.fromLTRB(15, 15, 0, 10),
        hintText: hintText,
        hintStyle: TextStyle(color: black30, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      inputFormatters: inputFormatters);
}

// country picker
class IntlPhoneFieldPicker extends StatefulWidget {
  final bool obscureText;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final VoidCallback? onTap;
  final bool readOnly;
  final FormFieldSetter<PhoneNumber>? onSaved;
  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<Country>? onCountryChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final Brightness? keyboardAppearance;
  final String? initialValue;
  final String? initialCountryCode;
  final List<String>? countries;
  final InputDecoration decoration;
  final TextStyle? style;
  final bool disableLengthCheck;
  final bool showDropdownIcon;
  final BoxDecoration dropdownDecoration;
  final TextStyle? dropdownTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final String searchText;
  final IconPosition dropdownIconPosition;
  final Icon dropdownIcon;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool showCountryFlag;
  final String? invalidNumberMessage;
  final Color? cursorColor;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final double cursorWidth;
  final bool? showCursor;
  final EdgeInsetsGeometry flagsButtonPadding;
  final TextInputAction? textInputAction;
  final PickerDialogStyle? pickerDialogStyle;
  final EdgeInsets flagsButtonMargin;

  IntlPhoneFieldPicker({
    Key? key,
    this.initialCountryCode,
    this.obscureText = false,
    this.textAlign = TextAlign.left,
    this.textAlignVertical,
    this.onTap,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType = TextInputType.phone,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.style,
    this.dropdownTextStyle,
    this.onSubmitted,
    this.validator,
    this.onChanged,
    this.countries,
    this.onCountryChanged,
    this.onSaved,
    this.showDropdownIcon = true,
    this.dropdownDecoration = const BoxDecoration(),
    this.inputFormatters,
    this.enabled = true,
    this.keyboardAppearance,
    @Deprecated('Use searchFieldInputDecoration of PickerDialogStyle instead') this.searchText = 'Search country',
    this.dropdownIconPosition = IconPosition.leading,
    this.dropdownIcon = const Icon(Icons.arrow_drop_down),
    this.autofocus = false,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.showCountryFlag = true,
    this.cursorColor,
    this.disableLengthCheck = false,
    this.flagsButtonPadding = EdgeInsets.zero,
    this.invalidNumberMessage = 'Invalid Mobile Number',
    this.cursorHeight,
    this.cursorRadius = Radius.zero,
    this.cursorWidth = 2.0,
    this.showCursor = true,
    this.pickerDialogStyle,
    this.flagsButtonMargin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  _IntlPhoneFieldPickerState createState() => _IntlPhoneFieldPickerState();
}

class _IntlPhoneFieldPickerState extends State<IntlPhoneFieldPicker> {
  late List<Country> _countryList;
  late Country _selectedCountry;
  late List<Country> filteredCountries;
  late String number;

  String? validatorMessage;
  // Initialise a scroll controller.
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _countryList = widget.countries == null ? countries : countries.where((country) => widget.countries!.contains(country.code)).toList();
    filteredCountries = _countryList;
    number = widget.initialValue ?? '';
    if (widget.initialCountryCode == null && number.startsWith('+')) {
      number = number.substring(1);
      // parse initial value
      _selectedCountry = countries.firstWhere((country) => number.startsWith(country.dialCode), orElse: () => _countryList.first);
      number = number.substring(_selectedCountry.dialCode.length);
    } else {
      _selectedCountry = _countryList.firstWhere((item) => item.code == (widget.initialCountryCode ?? 'US'), orElse: () => _countryList.first);
    }
    if (widget.autovalidateMode == AutovalidateMode.always) {
      final initialPhoneNumber = PhoneNumber(
        countryISOCode: _selectedCountry.code,
        countryCode: '+${_selectedCountry.dialCode}',
        number: widget.initialValue ?? '',
      );

      final value = widget.validator?.call(initialPhoneNumber);

      if (value is String) {
        validatorMessage = value;
      } else {
        (value as Future).then((msg) {
          validatorMessage = msg;
        });
      }
    }
  }

  Future<void> _changeCountry() async {
    filteredCountries = _countryList;
    await showDialog(
      barrierColor: Colors.transparent,
      context: context,
      useRootNavigator: false,
      builder: (context) => StatefulBuilder(
        builder: (ctx, setState) => CountryPickerDialogStyle(
          style: widget.pickerDialogStyle,
          filteredCountries: filteredCountries,
          searchText: widget.searchText,
          countryList: _countryList,
          selectedCountry: _selectedCountry,
          onCountryChanged: (Country country) {
            _selectedCountry = country;
            widget.onCountryChanged?.call(country);
            setState(() {});
          },
        ),
      ),
    );
    if (this.mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: true,
      enableSuggestions: true,
      toolbarOptions: ToolbarOptions(copy: true, paste: true, selectAll: true, cut: true),
      autofillHints: [AutofillHints.telephoneNumber],
      initialValue: (widget.controller == null) ? number : null,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      cursorColor: widget.cursorColor,
      onTap: widget.onTap,
      scrollController: _scrollController,
      controller: widget.controller,
      focusNode: widget.focusNode,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth,
      showCursor: widget.showCursor,
      onFieldSubmitted: widget.onSubmitted,
      decoration: widget.decoration.copyWith(
        prefixIcon: _buildFlagsButton(),
        counterText: !widget.enabled ? '' : null,
      ),
      style: widget.style,
      onSaved: (value) {
        widget.onSaved?.call(
          PhoneNumber(
            countryISOCode: _selectedCountry.code,
            countryCode: '+${_selectedCountry.dialCode}',
            number: value!,
          ),
        );
      },
      onChanged: (value) async {
        final phoneNumber = PhoneNumber(
          countryISOCode: _selectedCountry.code,
          countryCode: '+${_selectedCountry.dialCode}',
          number: value,
        );

        if (widget.autovalidateMode != AutovalidateMode.disabled) {
          validatorMessage = await widget.validator?.call(phoneNumber);
        }

        widget.onChanged?.call(phoneNumber);
      },
      validator: (value) {
        if (!widget.disableLengthCheck && value != null) {
          return value.length >= _selectedCountry.minLength && value.length <= _selectedCountry.maxLength ? null : widget.invalidNumberMessage;
        }
        return validatorMessage;
      },
      maxLength: widget.disableLengthCheck ? null : _selectedCountry.maxLength,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      keyboardAppearance: widget.keyboardAppearance,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      autovalidateMode: widget.autovalidateMode,
    );
  }

  Container _buildFlagsButton() {
    return Container(
      margin: widget.flagsButtonMargin,
      child: DecoratedBox(
        decoration: widget.dropdownDecoration,
        child: InkWell(
          borderRadius: widget.dropdownDecoration.borderRadius as BorderRadius?,
          child: Padding(
            padding: widget.flagsButtonPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 10),
                if (widget.showCountryFlag) ...[
                  CircleAvatar(
                      radius: 13,
                      backgroundImage: AssetImage(
                        'assets/flags/${_selectedCountry.code.toLowerCase()}.png',
                        package: 'intl_phone_field',
                      ))
                ],
                if (widget.enabled && widget.showDropdownIcon && widget.dropdownIconPosition == IconPosition.leading) ...[
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                    size: 30,
                  )
                ],
                FittedBox(
                  child: Text(
                    '+${_selectedCountry.dialCode}',
                    style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                ),
                if (widget.enabled && widget.showDropdownIcon && widget.dropdownIconPosition == IconPosition.trailing) ...[
                  SizedBox(width: 5),
                  widget.dropdownIcon,
                ],
                SizedBox(width: 4),
              ],
            ),
          ),
          onTap: widget.enabled ? _changeCountry : null,
        ),
      ),
    );
  }
}

enum IconPosition {
  leading,
  trailing,
}
