import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveDropdownSearch<T, V> extends ReactiveFormField<T, V> {
  ReactiveDropdownSearch(
      {Key? key,
      String? formControlName,
      FormControl<T>? formControl,
      Map<String, ValidationMessageFunction>? validationMessages,
      ControlValueAccessor<T, V>? valueAccessor,
      ShowErrorsFunction? showErrors,
      required this.stringify,
      V Function(String)? viewDataTypeFromTextEditingValue,
      required SuggestionsCallback<V> suggestionsCallback,
      required ItemBuilder<V> itemBuilder,
      Duration debounceDuration = const Duration(milliseconds: 300),
      WidgetBuilder? loadingBuilder,
      WidgetBuilder? noItemsFoundBuilder,
      ErrorBuilder? errorBuilder,
      AnimationTransitionBuilder? transitionBuilder,
      double animationStart = 0.25,
      Duration animationDuration = const Duration(milliseconds: 500),
      bool getImmediateSuggestions = false,
      double suggestionsBoxVerticalOffset = 5.0,
      AxisDirection direction = AxisDirection.down,
      bool hideOnLoading = false,
      bool hideOnEmpty = false,
      bool hideOnError = false,
      bool hideSuggestionsOnKeyboardHide = true,
      bool keepSuggestionsOnLoading = true,
      bool keepSuggestionsOnSuggestionSelected = false,
      bool autoFlipDirection = false,
      bool hideKeyboard = false,
      TextFieldConfiguration textFieldConfiguration =
          const TextFieldConfiguration(),
      SuggestionsBoxController? suggestionsBoxController,
      InputDecoration decoration = const InputDecoration(),
      TextInputType? keyboardType,
      TextCapitalization textCapitalization = TextCapitalization.none,
      TextInputAction? textInputAction,
      TextStyle? style,
      StrutStyle? strutStyle,
      TextDirection? textDirection,
      TextAlign textAlign = TextAlign.start,
      TextAlignVertical? textAlignVertical,
      bool autofocus = false,
      bool readOnly = false,
      // ignore: deprecated_member_use
      ToolbarOptions? toolbarOptions,
      bool? showCursor,
      bool obscureText = false,
      String obscuringCharacter = '•',
      bool autocorrect = true,
      Function(V value)? onSuggestionSelected})
      : super(
          key: key,
          formControl: formControl,
          formControlName: formControlName,
          valueAccessor: valueAccessor,
          validationMessages: validationMessages,
          showErrors: showErrors,
          builder: (field) {
            final state = field as _UiDropdownSearchState<T, V>;
            final effectiveDecoration = textFieldConfiguration.decoration
                .applyDefaults(Theme.of(state.context).inputDecorationTheme);

            state._setFocusNode(textFieldConfiguration.focusNode);
            final controller =
                textFieldConfiguration.controller ?? state._textController;

            return TypeAheadField<V>(
              suggestionsCallback: suggestionsCallback,
              itemBuilder: itemBuilder,
              onSuggestionSelected: (value) {
                controller.text = stringify(value);
                field.didChange(value);
                if (onSuggestionSelected != null) {
                  onSuggestionSelected(value);
                }
              },
              textFieldConfiguration: textFieldConfiguration.copyWith(
                focusNode: textFieldConfiguration.focusNode ?? state.focusNode,
                controller: controller,
                decoration: effectiveDecoration.copyWith(
                  errorText: state.errorText,
                ),
                onChanged: (value) {
                  if (viewDataTypeFromTextEditingValue != null) {
                    field.didChange(
                        viewDataTypeFromTextEditingValue.call(value));
                  }
                },
              ),
              debounceDuration: debounceDuration,
              suggestionsBoxController: suggestionsBoxController,
              loadingBuilder: loadingBuilder,
              noItemsFoundBuilder: noItemsFoundBuilder,
              errorBuilder: errorBuilder,
              transitionBuilder: transitionBuilder,
              animationStart: animationStart,
              animationDuration: animationDuration,
              getImmediateSuggestions: getImmediateSuggestions,
              suggestionsBoxVerticalOffset: suggestionsBoxVerticalOffset,
              direction: direction,
              hideOnLoading: hideOnLoading,
              hideOnEmpty: hideOnEmpty,
              hideOnError: hideOnError,
              hideSuggestionsOnKeyboardHide: hideSuggestionsOnKeyboardHide,
              keepSuggestionsOnLoading: keepSuggestionsOnLoading,
              keepSuggestionsOnSuggestionSelected:
                  keepSuggestionsOnSuggestionSelected,
              autoFlipDirection: autoFlipDirection,
              hideKeyboard: hideKeyboard,
            );
          },
        );

  final String Function(V value) stringify;

  @override
  ReactiveFormFieldState<T, V> createState() => _UiDropdownSearchState<T, V>();
}

class _UiDropdownSearchState<T, V> extends ReactiveFormFieldState<T, V> {
  late TextEditingController _textController;
  FocusNode? _focusNode;
  late FocusController _focusController;

  @override
  FocusNode get focusNode => _focusNode ?? _focusController.focusNode;

  @override
  void initState() {
    super.initState();

    final initialValue = value;
    _textController = TextEditingController(
      text: initialValue == null
          ? ''
          : (widget as ReactiveDropdownSearch<T, V>).stringify(initialValue),
    );
  }

  @override
  void subscribeControl() {
    _registerFocusController(FocusController());
    super.subscribeControl();
  }

  @override
  void unsubscribeControl() {
    _unregisterFocusController();
    super.unsubscribeControl();
  }

  @override
  void onControlValueChanged(value) {
    final val = value as V;
    final effectiveValue = (val == null)
        ? ''
        : (widget as ReactiveDropdownSearch<T, V>).stringify(val);
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  void _registerFocusController(FocusController focusController) {
    _focusController = focusController;
    control.registerFocusController(focusController);
  }

  void _unregisterFocusController() {
    control.unregisterFocusController(_focusController);
    _focusController.dispose();
  }

  void _setFocusNode(FocusNode? focusNode) {
    if (_focusNode != focusNode) {
      _focusNode = focusNode;
      _unregisterFocusController();
      _registerFocusController(FocusController(focusNode: _focusNode));
    }
  }
}
