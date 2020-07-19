import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

class RxTextField<T> extends StatelessWidget {
  final Stream<T> subscribe;
  final Function dispatch;
  final key;
  final controller;
  final focusNode;
  final decoration;
  final keyboardType;
  final textInputAction;
  final textCapitalization;
  final style;
  final strutStyle;
  final textAlign;
  final textAlignVertical;
  final textDirection;
  final readOnly;
  final toolbarOptions;
  final showCursor;
  final autofocus;
  final obscuringCharacter;
  final obscureText;
  final autocorrect;
  final smartDashesType;
  final smartQuotesType;
  final enableSuggestions;
  final maxLines;
  final minLines;
  final expands;
  final maxLength;
  final maxLengthEnforced;
  final onEditingComplete;
  final onSubmitted;
  final inputFormatters;
  final enabled;
  final cursorWidth;
  final cursorRadius;
  final cursorColor;
  final selectionHeightStyle;
  final selectionWidthStyle;
  final keyboardAppearance;
  final scrollPadding;
  final dragStartBehavior;
  final enableInteractiveSelection;
  final onTap;
  final buildCounter;
  final scrollController;
  final scrollPhysics;
  final autofillHints;
  final canAssertMaterialLocalizations;
  final onChanged;

  const RxTextField({
    this.subscribe,
    this.dispatch,
    this.key,
    this.controller,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.dragStartBehavior = DragStartBehavior.start,
    this.enableInteractiveSelection = true,
    this.onTap,
    this.buildCounter,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.canAssertMaterialLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: subscribe,
        builder: (context, snapshot) {
          InputDecoration decoration = this.decoration.copyWith(errorText: snapshot.error);

          return TextField(
              key: key,
              controller: controller,
              focusNode: focusNode,
              decoration : decoration,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              textCapitalization : textCapitalization,
              style: style,
              strutStyle: strutStyle,
              textAlign : textAlign,
              textAlignVertical: textAlignVertical,
              textDirection: textDirection,
              readOnly : readOnly,
              toolbarOptions: toolbarOptions,
              showCursor: showCursor,
              autofocus : autofocus,
              obscuringCharacter : obscuringCharacter,
              obscureText : obscureText,
              autocorrect : autocorrect,
              smartDashesType: smartDashesType,
              smartQuotesType: smartQuotesType,
              enableSuggestions : enableSuggestions,
              maxLines : maxLines,
              minLines: minLines,
              expands : expands,
              maxLength: maxLength,
              maxLengthEnforced : maxLengthEnforced,
              onEditingComplete: onEditingComplete,
              onSubmitted: onSubmitted,
              inputFormatters: inputFormatters,
              enabled: enabled,
              cursorWidth : cursorWidth,
              cursorRadius: cursorRadius,
              cursorColor: cursorColor,
              selectionHeightStyle : selectionHeightStyle,
              selectionWidthStyle : selectionWidthStyle,
              keyboardAppearance: keyboardAppearance,
              scrollPadding : scrollPadding,
              dragStartBehavior : dragStartBehavior,
              enableInteractiveSelection : enableInteractiveSelection,
              onTap: onTap,
              buildCounter: buildCounter,
              scrollController: scrollController,
              scrollPhysics: scrollPhysics,
              autofillHints: autofillHints,
              canAssertMaterialLocalizations: canAssertMaterialLocalizations,
              onChanged: dispatch
          );
        }
    );
  }
}
