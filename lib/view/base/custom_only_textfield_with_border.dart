

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomOnlyTextFieldWithBorder extends StatefulWidget {

  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final IconData? suffixIcon;
  final Function? onChanged;
  final Function? sufixIconFun;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final Color? color;
  final TextCapitalization capitalization;
  final String? prefixIcon;
  final bool divider;

  CustomOnlyTextFieldWithBorder(
      {this.hintText = 'Write something...',
        required this.controller,
        required this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
         this.onSubmit,
        this.onChanged,
        this.suffixIcon,
        this.sufixIconFun,
        this.prefixIcon,
        this.color,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.divider = false, }
      );

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomOnlyTextFieldWithBorder> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        TextField(
          maxLines: widget.maxLines,
          minLines: 1,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color:widget.color!=null?widget.color:null),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))] : null,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top:10,bottom:10,left: 5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
              borderSide: BorderSide(style: BorderStyle.none, width: 1),
            ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: Theme.of(context).cardColor,
            hintStyle: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).hintColor),
            filled: true,
            prefixIcon: widget.prefixIcon != null ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(widget.prefixIcon!, height: 10, width: 10,),
            ) : null,
            suffixIcon: widget.isPassword ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.black.withOpacity(0.6)),
              onPressed: _toggle,
            ) : widget.suffixIcon!=null?IconButton(
              icon: Icon(widget.suffixIcon!, color: Colors.black.withOpacity(0.6)),
              onPressed:()=> widget.sufixIconFun!=null?widget.sufixIconFun!():null,
            ):null,
          ),
          onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null ? widget.onSubmit!(text) : null,
          onChanged:(text)=> widget.onChanged!=null?widget.onChanged!(text):widget.onChanged,
        ),

        widget.divider ? Padding(padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE), child: Divider()) : SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

}
