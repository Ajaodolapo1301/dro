//
// library dropdown_search;
//
// import 'dart:async';
//
// import 'package:book_keepa_app/utils/sizeConfig/sizeConfig.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// //import 'src/popupMenu.dart';
// //import 'src/selectDialog.dart';
//
// typedef Future<List<T>> DropdownSearchOnFind<T>(String text);
// typedef String DropdownSearchItemAsString<T>(T item);
// typedef bool DropdownSearchFilterFn<T>(T item, String filter);
// typedef bool DropdownSearchCompareFn<T>(T item, T selectedItem);
// typedef Widget DropdownSearchBuilder<T>(
//     BuildContext context, T selectedItem, String itemAsString);
// typedef Widget DropdownSearchPopupItemBuilder<T>(
//     BuildContext context,
//     T item,
//     bool isSelected,
//     );
// typedef bool DropdownSearchPopupItemEnabled<T>(T item);
// typedef Widget ErrorBuilder<T>(
//     BuildContext context, String searchEntry, dynamic exception);
// typedef Widget EmptyBuilder<T>(BuildContext context, String searchEntry);
// typedef Widget LoadingBuilder<T>(BuildContext context, String searchEntry);
// typedef Widget IconButtonBuilder(BuildContext context);
// typedef Future<bool> BeforeChange<T>(T prevItem, T nextItem);
//
// enum Mode { DIALOG, BOTTOM_SHEET, MENU }
//
// class DropdownSearch<T> extends StatefulWidget {
//   ///DropDownSearch label
//   final String label;
//
//   ///DropDownSearch hint
//   final String hint;
//
//   ///DropDownSearch hint
//   final IconData icon;
//
//   ///show/hide the search box
//   final bool showSearchBox;
//
//   ///true if the filter on items is applied onlie (via API)
//   final bool isFilteredOnline;
//
//   ///show/hide clear selected item
//   final bool showClearButton;
//
//   ///offline items list
//   final List<T> items;
//
//   ///selected item
//   final T selectedItem;
//
//   ///function that returns item from API
//   final DropdownSearchOnFind<T> onFind;
//
//   ///called when a new item is selected
//   final ValueChanged<T> onChanged;
//
//   ///to customize list of items UI
//   final DropdownSearchBuilder<T> dropdownBuilder;
//
//   ///to customize selected item
//   final DropdownSearchPopupItemBuilder<T> popupItemBuilder;
//
//   ///decoration for search box
//   final InputDecoration searchBoxDecoration;
//
//   ///the title for dialog/menu/bottomSheet
//   final Color popupBackgroundColor;
//
//   ///custom widget for the popup title
//   final Widget popupTitle;
//
//   ///customize the fields the be shown
//   final DropdownSearchItemAsString<T> itemAsString;
//
//   ///	custom filter function
//   final DropdownSearchFilterFn<T> filterFn;
//
//   ///enable/disable dropdownSearch
//   final bool enabled;
//
//   ///MENU / DIALOG/ BOTTOM_SHEET
//   final Mode mode;
//
//   ///the max height for dialog/bottomSheet/Menu
//   final double maxHeight;
//
//   ///the max width for the dialog
//   final double dialogMaxWidth;
//
//   ///select the selected item in the menu/dialog/bottomSheet of items
//   final bool showSelectedItem;
//
//   ///function that compares two object with the same type to detected if it's the selected item or not
//   final DropdownSearchCompareFn<T> compareFn;
//
//   ///dropdownSearch input decoration
//   final InputDecoration dropdownSearchDecoration;
//
//   ///custom layout for empty results
//   final EmptyBuilder emptyBuilder;
//
//   ///custom layout for loading items
//   final LoadingBuilder loadingBuilder;
//
//   ///custom layout for error
//   final ErrorBuilder errorBuilder;
//
//   ///the search box will be focused if true
//   final bool autoFocusSearchBox;
//
//   ///custom shape for the popup
//   final ShapeBorder popupShape;
//
//   final AutovalidateMode autoValidateMode;
//
//   /// An optional method to call with the final value when the form is saved via
//   final FormFieldSetter<T> onSaved;
//
//   /// An optional method that validates an input. Returns an error string to
//   /// display if the input is invalid, or null otherwise.
//   final FormFieldValidator<T> validator;
//
//   ///custom dropdown clear button icon widget
//   final Widget clearButton;
//
//   ///custom clear button widget builder
//   final IconButtonBuilder clearButtonBuilder;
//
//   ///custom dropdown icon button widget
//   final Widget dropDownButton;
//
//   ///custom dropdown button widget builder
//   final IconButtonBuilder dropdownButtonBuilder;
//
//   ///whether to manage the clear and dropdown icons via InputDecoration suffixIcon
//   final bool showAsSuffixIcons;
//
//   ///If true, the dropdownBuilder will continue the uses of material behavior
//   ///This will be useful if you want to handle a custom UI only if the item !=null
//   final bool dropdownBuilderSupportsNullItem;
//
//   ///defines if an item of the popup is enabled or not, if the item is disabled,
//   ///it cannot be clicked
//   final DropdownSearchPopupItemEnabled<T> popupItemDisabled;
//
//   ///set a custom color for the popup barrier
//   final Color popupBarrierColor;
//
//   ///text controller to set default search word for example
//   final TextEditingController searchBoxController;
//
//   ///called when popup is dismissed
//   final VoidCallback onPopupDismissed;
//
//   /// callback executed before applying value change
//   ///delay before searching, change it to Duration(milliseconds: 0)
//   ///if you do not use online search
//   final Duration searchDelay;
//
//   /// callback executed before applying value change
//   final BeforeChange<T> onBeforeChange;
//
//   DropdownSearch({
//     Key key,
//     this.onSaved,
//     this.validator,
//     this.autoValidateMode = AutovalidateMode.disabled,
//     this.onChanged,
//     this.mode = Mode.DIALOG,
//     this.label,
//     this.hint,
//     this.isFilteredOnline = false,
//     this.popupTitle,
//     this.items,
//     this.selectedItem,
//     this.onFind,
//     this.dropdownBuilder,
//     this.popupItemBuilder,
//     this.showSearchBox = false,
//     this.showClearButton = false,
//     this.searchBoxDecoration,
//     this.popupBackgroundColor,
//     this.enabled = true,
//     this.maxHeight,
//     this.filterFn,
//     this.itemAsString,
//     this.showSelectedItem = false,
//     this.compareFn,
//     this.dropdownSearchDecoration,
//     this.emptyBuilder,
//     this.loadingBuilder,
//     this.errorBuilder,
//     this.autoFocusSearchBox = false,
//     this.dialogMaxWidth,
//     this.clearButton,
//     this.clearButtonBuilder,
//     this.dropDownButton,
//     this.dropdownButtonBuilder,
//     this.showAsSuffixIcons = false,
//     this.dropdownBuilderSupportsNullItem = false,
//     this.popupShape,
//     this.popupItemDisabled,
//     this.popupBarrierColor,
//     this.onPopupDismissed,
//     this.searchBoxController,
//     this.searchDelay,
//     this.icon =  Icons.keyboard_arrow_down_outlined,
//     this.onBeforeChange,
//   })  : assert(isFilteredOnline != null),
//         assert(dropdownBuilderSupportsNullItem != null),
//         assert(enabled != null),
//         assert(showSelectedItem != null),
//         assert(autoFocusSearchBox != null),
//         assert(showClearButton != null),
//         assert(showSearchBox != null),
//         assert(!showSelectedItem || T == String || compareFn != null),
//         super(key: key);
//
//   @override
//   DropdownSearchState<T> createState() => DropdownSearchState<T>();
// }
//
// class DropdownSearchState<T> extends State<DropdownSearch<T>> {
//   final ValueNotifier<T> _selectedItemNotifier = ValueNotifier(null);
//   final ValueNotifier<bool> _isFocused = ValueNotifier(false);
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedItemNotifier.value = widget.selectedItem;
//   }
//
//   @override
//   void didUpdateWidget(DropdownSearch<T> oldWidget) {
//     final oldSelectedItem = oldWidget.selectedItem;
//     final newSelectedItem = widget.selectedItem;
//     if (oldSelectedItem != newSelectedItem) {
//       _selectedItemNotifier.value = newSelectedItem;
//     }
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<T>(
//       valueListenable: _selectedItemNotifier,
//       builder: (context, T data, wt) {
//         return IgnorePointer(
//           ignoring: !widget.enabled,
//           child: GestureDetector(
//             onTap: () => _selectSearchMode(data),
//             child: _formField(data),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _defaultSelectItemWidget(T data) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         Expanded(
//           child: widget.dropdownBuilder != null
//               ? widget.dropdownBuilder(
//             context,
//             data,
//             _selectedItemAsString(data),
//           )
//               : Text(_selectedItemAsString(data),
//               style: Theme.of(context).textTheme.subtitle1),
//         ),
//         if (!widget.showAsSuffixIcons) _manageTrailingIcons(data),
//       ],
//     );
//   }
//
//   Widget _formField(T value) {
//     return FormField(
//       enabled: widget.enabled,
//       onSaved: widget.onSaved,
//       validator: widget.validator,
//       autovalidateMode: widget.autoValidateMode,
//       initialValue: widget.selectedItem,
//       builder: (FormFieldState<T> state) {
//         if (state.value != value) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             state.didChange(value);
//           });
//         }
//         return ValueListenableBuilder(
//             valueListenable: _isFocused,
//             builder: (context, bool isFocused, w) {
//               return InputDecorator(
//                 isEmpty: value == null &&
//                     (widget.dropdownBuilder == null ||
//                         widget.dropdownBuilderSupportsNullItem),
//                 isFocused: isFocused,
//                 decoration: _manageDropdownDecoration(state, value),
//                 child: _defaultSelectItemWidget(value),
//               );
//             });
//       },
//     );
//   }
//
//   ///manage dropdownSearch field decoration
//   InputDecoration _manageDropdownDecoration(FormFieldState state, T data) {
//     return (widget.dropdownSearchDecoration ??
//         InputDecoration(
//             // contentPadding: EdgeInsets.fromLTRB(12, 5, 0, 0),
//          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
//             border: OutlineInputBorder(
//
//               borderRadius: BorderRadius.circular(8),
//             ),
//
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(
//               color: Colors.black.withOpacity(0.5),
//             ),
//           ),
//         ))
//
//         .applyDefaults(Theme.of(state.context).inputDecorationTheme)
//         .copyWith(
//         enabled: widget.enabled,
//         labelStyle:  TextStyle(
//           fontSize: 1.7 * SizeConfig.textMultiplier ,
// //                        color:  Colors.black.withOpacity(0.5),
//           fontWeight: FontWeight.w500,
//         ),
//         labelText: widget.label,
//         hintText: widget.hint,
//         suffixIcon:
//         widget.showAsSuffixIcons ? _manageTrailingIcons(data) : null,
//         errorText: state.errorText);
//   }
//
//   ///function that return the String value of an object
//   String _selectedItemAsString(T data) {
//     if (data == null) {
//       return "";
//     } else if (widget.itemAsString != null) {
//       return widget.itemAsString(data);
//     } else {
//       return data.toString();
//     }
//   }
//
//   ///function that manage Trailing icons(close, dropDown)
//   Widget _manageTrailingIcons(T data) {
//     final clearButtonPressed = () => _handleOnChangeSelectedItem(null);
//     final dropdownButtonPressed = () => _selectSearchMode(data);
//
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         if (data != null && widget.showClearButton)
//           widget.clearButtonBuilder != null
//               ? GestureDetector(
//             onTap: clearButtonPressed,
//             child: widget.clearButtonBuilder(context),
//           )
//               : IconButton(
//             icon: widget.clearButton ?? const Icon(Icons.clear, size: 24, color: Colors.grey,),
//             onPressed: clearButtonPressed,
//           ),
//         widget.dropdownButtonBuilder != null
//             ? GestureDetector(
//           onTap: dropdownButtonPressed,
//           child: widget.dropdownButtonBuilder(context),
//         )
//             : IconButton(
//           icon: widget.dropDownButton ??
//                Icon(widget.icon, size: 20),
//           onPressed: dropdownButtonPressed,
//         ),
//       ],
//     );
//   }
//
//   ///open dialog
//   Future<T> _openSelectDialog(T data) {
//     return showGeneralDialog(
//       barrierDismissible: true,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       transitionDuration: const Duration(milliseconds: 400),
//       barrierColor: widget.popupBarrierColor ?? const Color(0x80000000),
//       context: context,
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.all(0),
//           shape: widget.popupShape,
//           backgroundColor: widget.popupBackgroundColor,
//           content: _selectDialogInstance(data),
//         );
//       },
//     );
//   }
//
//   ///open BottomSheet (Dialog mode)
//   Future<T> _openBottomSheet(T data) {
//     return showModalBottomSheet<T>(
//         barrierColor: widget.popupBarrierColor,
//         isScrollControlled: true,
//         backgroundColor: widget.popupBackgroundColor,
//         shape: widget.popupShape,
//         context: context,
//         builder: (context) {
//           return AnimatedPadding(
//             duration: Duration(milliseconds: 300),
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: _selectDialogInstance(data, defaultHeight: 350),
//           );
//         });
//   }
//
//   ///openMenu
//   Future<T> _openMenu(T data) {
//     // Here we get the render object of our physical button, later to get its size & position
//     final RenderBox popupButtonObject = context.findRenderObject();
//     // Get the render object of the overlay used in `Navigator` / `MaterialApp`, i.e. screen size reference
//     final RenderBox overlay = Overlay.of(context).context.findRenderObject();
//     // Calculate the show-up area for the dropdown using button's size & position based on the `overlay` used as the coordinate space.
//     final RelativeRect position = RelativeRect.fromSize(
//       Rect.fromPoints(
//         popupButtonObject.localToGlobal(
//             popupButtonObject.size.bottomLeft(Offset.zero),
//             ancestor: overlay),
//         popupButtonObject.localToGlobal(
//             popupButtonObject.size.bottomRight(Offset.zero),
//             ancestor: overlay),
//       ),
//       Size(overlay.size.width, overlay.size.height),
//     );
//     return customShowMenu<T>(
//         barrierColor: widget.popupBarrierColor,
//         shape: widget.popupShape,
//         color: widget.popupBackgroundColor,
//         context: context,
//         position: position,
//         elevation: 8,
//         items: [
//           CustomPopupMenuItem(
//             enabled: false,
//             child: Container(
//               width: popupButtonObject.size.width,
//               child: _selectDialogInstance(data, defaultHeight: 224),
//             ),
//           ),
//         ]);
//   }
//
//   SelectDialog<T> _selectDialogInstance(T data, {double defaultHeight}) {
//     return SelectDialog<T>(
//       popupTitle: widget.popupTitle,
//       maxHeight: widget.maxHeight ?? defaultHeight,
//       isFilteredOnline: widget.isFilteredOnline,
//       itemAsString: widget.itemAsString,
//       filterFn: widget.filterFn,
//       items: widget.items,
//       onFind: widget.onFind,
//       showSearchBox: widget.showSearchBox,
//       itemBuilder: widget.popupItemBuilder,
//       selectedValue: data,
//       searchBoxDecoration: widget.searchBoxDecoration,
//       onChanged: _handleOnChangeSelectedItem,
//       showSelectedItem: widget.showSelectedItem,
//       compareFn: widget.compareFn,
//       emptyBuilder: widget.emptyBuilder,
//       loadingBuilder: widget.loadingBuilder,
//       errorBuilder: widget.errorBuilder,
//       autoFocusSearchBox: widget.autoFocusSearchBox,
//       dialogMaxWidth: widget.dialogMaxWidth,
//       itemDisabled: widget.popupItemDisabled,
//       searchBoxController:
//       widget.searchBoxController ?? TextEditingController(),
//       searchDelay: widget.searchDelay,
//     );
//   }
//
//   ///Function that manage focus listener
//   ///set true only if the widget already not focused to prevent unnecessary build
//   ///same thing for clear focus,
//   void _handleFocus(bool isFocused) {
//     if (isFocused && !_isFocused.value) {
//       FocusScope.of(context).unfocus();
//       _isFocused.value = true;
//     } else if (!isFocused && _isFocused.value) _isFocused.value = false;
//   }
//
//   ///handle on change value , if the validation is active , we validate the new selected item
//   void _handleOnChangeSelectedItem(T selectedItem) {
//     final changeItem = () {
//       _selectedItemNotifier.value = selectedItem;
//       if (widget.onChanged != null) widget.onChanged(selectedItem);
//     };
//
//     if (widget.onBeforeChange != null) {
//       widget
//           .onBeforeChange(_selectedItemNotifier.value, selectedItem)
//           .then((value) {
//         if (value == true) {
//           changeItem();
//         }
//       });
//     } else {
//       changeItem();
//     }
//
//     _handleFocus(false);
//   }
//
//   ///Function that return then UI based on searchMode
//   ///[data] selected item to be passed to the UI
//   ///If we close the popup , or maybe we just selected
//   ///another widget we should clear the focus
//   Future<T> _selectSearchMode(T data) async {
//     _handleFocus(true);
//     T selectedItem;
//     if (widget.mode == Mode.MENU) {
//       selectedItem = await _openMenu(data);
//     } else if (widget.mode == Mode.BOTTOM_SHEET) {
//       selectedItem = await _openBottomSheet(data);
//     } else {
//       selectedItem = await _openSelectDialog(data);
//     }
//     _handleFocus(false);
//     widget.onPopupDismissed?.call();
//
//     return selectedItem;
//   }
//
//   ///Public Function that return then UI based on searchMode
//   ///[data] selected item to be passed to the UI
//   ///If we close the popup , or maybe we just selected
//   ///another widget we should clear the focus
//   ///THIS USED FOR OPEN DROPDOWN_SEARCH PROGRAMMATICALLY,
//   ///otherwise you can you [_selectSearchMode]
//   Future<T> openDropDownSearch() =>
//       _selectSearchMode(_selectedItemNotifier.value);
//
//   ///Change selected Value; this function is public USED to change the selected
//   ///value PROGRAMMATICALLY, Otherwise you can use [_handleOnChangeSelectedItem]
//   void changeSelectedItem(T selectedItem) =>
//       _handleOnChangeSelectedItem(selectedItem);
//
//   ///Change selected Value; this function is public USED to clear selected
//   ///value PROGRAMMATICALLY, Otherwise you can use [_handleOnChangeSelectedItem]
//   void clear() => _handleOnChangeSelectedItem(null);
//
//   ///get selected value programmatically
//   T get getSelectedItem => _selectedItemNotifier.value;
//
//   ///check if the dropdownSearch is focused
//   bool get isFocused => _isFocused.value;
// }
//
// //import 'dart:async';
// //
// //import 'package:flutter/foundation.dart';
// //import 'package:flutter/material.dart';
// //import 'package:flutter/rendering.dart';
// //import 'package:flutter/widgets.dart';
//
// const Duration _kMenuDuration = Duration(milliseconds: 300);
// const double _kMenuCloseIntervalEnd = 2.0 / 3.0;
// const double _kMenuHorizontalPadding = 0.0;
// const double _kMenuMinWidth = 2.0 * _kMenuWidthStep;
// const double _kMenuVerticalPadding = 0.0;
// const double _kMenuWidthStep = 1.0;
// const double _kMenuScreenPadding = 0.0;
//
// // This widget only exists to enable _PopupMenuRoute to save the sizes of
// // each menu item. The sizes are used by _PopupMenuRouteLayout to compute the
// // y coordinate of the menu's origin so that the center of selected menu
// // item lines up with the center of its PopupMenuButton.
// class _MenuItem extends SingleChildRenderObjectWidget {
//   const _MenuItem({
//     Key key,
//     @required this.onLayout,
//     Widget child,
//   })  : assert(onLayout != null),
//         super(key: key, child: child);
//
//   final ValueChanged<Size> onLayout;
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return _RenderMenuItem(onLayout);
//   }
//
//   @override
//   void updateRenderObject(
//       BuildContext context, covariant _RenderMenuItem renderObject) {
//     renderObject.onLayout = onLayout;
//   }
// }
//
// class _RenderMenuItem extends RenderShiftedBox {
//   _RenderMenuItem(this.onLayout, [RenderBox child])
//       : assert(onLayout != null),
//         super(child);
//
//   ValueChanged<Size> onLayout;
//
//   @override
//   void performLayout() {
//     if (child == null) {
//       size = Size.zero;
//     } else {
//       child.layout(constraints, parentUsesSize: true);
//       size = constraints.constrain(child.size);
//     }
//     final BoxParentData childParentData = child.parentData;
//     childParentData.offset = Offset.zero;
//     onLayout(size);
//   }
// }
//
// /// An item in a material design popup menu.
// ///
// /// To show a popup menu, use the [customShowMenu] function. To create a button that
// /// shows a popup menu, consider using [PopupMenuButton].
// ///
// /// To show a checkmark next to a popup menu item, consider using
// /// [CheckedPopupMenuItem].
// ///
// /// Typically the [child] of a [CustomPopupMenuItem] is a [Text] widget. More
// /// elaborate menus with icons can use a [ListTile]. By default, a
// /// [CustomPopupMenuItem] is kMinInteractiveDimension pixels high. If you use a widget
// /// with a different height, it must be specified in the [height] property.
// ///
// /// {@tool sample}
// ///
// /// Here, a [Text] widget is used with a popup menu item. The `WhyFarther` type
// /// is an enum, not shown here.
// ///
// /// ```dart
// /// const CustomPopupMenuItem<WhyFarther>(
// ///   value: WhyFarther.harder,
// ///   child: Text('Working a lot harder'),
// /// )
// /// ```
// /// {@end-tool}
// ///
// /// See the example at [PopupMenuButton] for how this example could be used in a
// /// complete menu, and see the example at [CheckedPopupMenuItem] for one way to
// /// keep the text of [CustomPopupMenuItem]s that use [Text] widgets in their [child]
// /// slot aligned with the text of [CheckedPopupMenuItem]s or of [CustomPopupMenuItem]
// /// that use a [ListTile] in their [child] slot.
// ///
// /// See also:
// ///
// ///  * [PopupMenuDivider], which can be used to divide items from each other.
// ///  * [CheckedPopupMenuItem], a variant of [CustomPopupMenuItem] with a checkmark.
// ///  * [customShowMenu], a method to dynamically show a popup menu at a given location.
// ///  * [PopupMenuButton], an [IconButton] that automatically shows a menu when
// ///    it is tapped.
// class CustomPopupMenuItem<T> extends PopupMenuEntry<T> {
//   /// Creates an item for a popup menu.
//   ///
//   /// By default, the item is [enabled].
//   ///
//   /// The `enabled` and `height` arguments must not be null.
//   const CustomPopupMenuItem({
//     Key key,
//     this.value,
//     this.enabled = true,
//     this.height = kMinInteractiveDimension,
//     this.textStyle,
//     @required this.child,
//   })  : assert(enabled != null),
//         assert(height != null),
//         super(key: key);
//
//   /// The value that will be returned by [customShowMenu] if this entry is selected.
//   final T value;
//
//   /// Whether the user is permitted to select this item.
//   ///
//   /// Defaults to true. If this is false, then the item will not react to
//   /// touches.
//   final bool enabled;
//
//   /// The minimum height height of the menu item.
//   ///
//   /// Defaults to [kMinInteractiveDimension] pixels.
//   @override
//   final double height;
//
//   /// The text style of the popup menu item.
//   ///
//   /// If this property is null, then [PopupMenuThemeData.textStyle] is used.
//   /// If [PopupMenuThemeData.textStyle] is also null, then [ThemeData.textTheme.subhead] is used.
//   final TextStyle textStyle;
//
//   /// The widget below this widget in the tree.
//   ///
//   /// Typically a single-line [ListTile] (for menus with icons) or a [Text]. An
//   /// appropriate [DefaultTextStyle] is put in scope for the child. In either
//   /// case, the text should be short enough that it won't wrap.
//   final Widget child;
//
//   @override
//   bool represents(T value) => value == this.value;
//
//   @override
//   PopupMenuItemState<T, CustomPopupMenuItem<T>> createState() =>
//       PopupMenuItemState<T, CustomPopupMenuItem<T>>();
// }
//
// /// The [State] for [CustomPopupMenuItem] subclasses.
// ///
// /// By default this implements the basic styling and layout of Material Design
// /// popup menu items.
// ///
// /// The [buildChild] method can be overridden to adjust exactly what gets placed
// /// in the menu. By default it returns [CustomPopupMenuItem.child].
// ///
// /// The [handleTap] method can be overridden to adjust exactly what happens when
// /// the item is tapped. By default, it uses [Navigator.pop] to return the
// /// [CustomPopupMenuItem.value] from the menu route.
// ///
// /// This class takes two type arguments. The second, `W`, is the exact type of
// /// the [Widget] that is using this [State]. It must be a subclass of
// /// [CustomPopupMenuItem]. The first, `T`, must match the type argument of that widget
// /// class, and is the type of values returned from this menu.
// class PopupMenuItemState<T, W extends CustomPopupMenuItem<T>> extends State<W> {
//   /// The menu item contents.
//   ///
//   /// Used by the [build] method.
//   ///
//   /// By default, this returns [CustomPopupMenuItem.child]. Override this to put
//   /// something else in the menu entry.
//   @protected
//   Widget buildChild() => widget.child;
//
//   /// The handler for when the user selects the menu item.
//   ///
//   /// Used by the [InkWell] inserted by the [build] method.
//   ///
//   /// By default, uses [Navigator.pop] to return the [CustomPopupMenuItem.value] from
//   /// the menu route.
//   @protected
//   void handleTap() {
//     Navigator.pop<T>(context, widget.value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
//     TextStyle style = widget.textStyle ??
//         popupMenuTheme.textStyle ??
//         theme.textTheme.subtitle1;
//
//     if (!widget.enabled) style = style.copyWith(color: theme.disabledColor);
//
//     Widget item = AnimatedDefaultTextStyle(
//       style: style,
//       duration: kThemeChangeDuration,
//       child: Container(
//         alignment: AlignmentDirectional.centerStart,
//         constraints: BoxConstraints(minHeight: widget.height),
//         padding:
//         const EdgeInsets.symmetric(horizontal: _kMenuHorizontalPadding),
//         child: buildChild(),
//       ),
//     );
//
//     if (!widget.enabled) {
//       final bool isDark = theme.brightness == Brightness.dark;
//       item = IconTheme.merge(
//         data: IconThemeData(opacity: isDark ? 0.5 : 0.38),
//         child: item,
//       );
//     }
//
//     return InkWell(
//       onTap: widget.enabled ? handleTap : null,
//       canRequestFocus: widget.enabled,
//       child: item,
//     );
//   }
// }
//
// class _PopupMenu<T> extends StatelessWidget {
//   const _PopupMenu({
//     Key key,
//     this.route,
//     this.semanticLabel,
//   }) : super(key: key);
//
//   final _PopupMenuRoute<T> route;
//   final String semanticLabel;
//
//   @override
//   Widget build(BuildContext context) {
//     final double unit = 1.0 /
//         (route.items.length +
//             1.5); // 1.0 for the width and 0.5 for the last item's fade.
//     final List<Widget> children = <Widget>[];
//     final PopupMenuThemeData popupMenuTheme = PopupMenuTheme.of(context);
//
//     for (int i = 0; i < route.items.length; i += 1) {
//       final double start = (i + 1) * unit;
//       final double end = (start + 1.5 * unit).clamp(0.0, 1.0);
//       final CurvedAnimation opacity = CurvedAnimation(
//         parent: route.animation,
//         curve: Interval(start, end),
//       );
//       Widget item = route.items[i];
//       if (route.initialValue != null &&
//           route.items[i].represents(route.initialValue)) {
//         item = Container(
//           color: Theme.of(context).highlightColor,
//           child: item,
//         );
//       }
//       children.add(
//         _MenuItem(
//           onLayout: (Size size) {
//             route.itemSizes[i] = size;
//           },
//           child: FadeTransition(
//             opacity: opacity,
//             child: item,
//           ),
//         ),
//       );
//     }
//
//     final CurveTween opacity =
//     CurveTween(curve: const Interval(0.0, 1.0 / 3.0));
//     final CurveTween width = CurveTween(curve: Interval(0.0, unit));
//     final CurveTween height =
//     CurveTween(curve: Interval(0.0, unit * route.items.length));
//
//     final Widget child = ConstrainedBox(
//       constraints: const BoxConstraints(minWidth: _kMenuMinWidth),
//       child: IntrinsicWidth(
//         stepWidth: _kMenuWidthStep,
//         child: Semantics(
//           scopesRoute: true,
//           namesRoute: true,
//           explicitChildNodes: true,
//           label: semanticLabel,
//           child: SingleChildScrollView(
//             padding:
//             const EdgeInsets.symmetric(vertical: _kMenuVerticalPadding),
//             child: ListBody(children: children),
//           ),
//         ),
//       ),
//     );
//
//     return AnimatedBuilder(
//       animation: route.animation,
//       builder: (BuildContext context, Widget child) {
//         return Opacity(
//           opacity: opacity.evaluate(route.animation),
//           child: Material(
//             shape: route.shape ?? popupMenuTheme.shape,
//             color: route.color ?? popupMenuTheme.color,
//             type: MaterialType.card,
//             elevation: route.elevation ?? popupMenuTheme.elevation ?? 8.0,
//             child: Align(
//               alignment: AlignmentDirectional.topEnd,
//               widthFactor: width.evaluate(route.animation),
//               heightFactor: height.evaluate(route.animation),
//               child: child,
//             ),
//           ),
//         );
//       },
//       child: child,
//     );
//   }
// }
//
// // Positioning of the menu on the screen.
// class _PopupMenuRouteLayout extends SingleChildLayoutDelegate {
//   _PopupMenuRouteLayout(this.position, this.itemSizes, this.selectedItemIndex,
//       this.textDirection);
//
//   // Rectangle of underlying button, relative to the overlay's dimensions.
//   final RelativeRect position;
//
//   // The sizes of each item are computed when the menu is laid out, and before
//   // the route is laid out.
//   List<Size> itemSizes;
//
//   // The index of the selected item, or null if PopupMenuButton.initialValue
//   // was not specified.
//   final int selectedItemIndex;
//
//   // Whether to prefer going to the left or to the right.
//   final TextDirection textDirection;
//
//   // We put the child wherever position specifies, so long as it will fit within
//   // the specified parent size padded (inset) by 8. If necessary, we adjust the
//   // child's position so that it fits.
//
//   @override
//   BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
//     // The menu can be at most the size of the overlay minus 8.0 pixels in each
//     // direction.
//     return BoxConstraints.loose(constraints.biggest -
//         const Offset(_kMenuScreenPadding * 2.0, _kMenuScreenPadding * 2.0));
//   }
//
//   @override
//   Offset getPositionForChild(Size size, Size childSize) {
//     // size: The size of the overlay.
//     // childSize: The size of the menu, when fully open, as determined by
//     // getConstraintsForChild.
//
//     // Find the ideal vertical position.
//     double y = position.top;
//     if (selectedItemIndex != null && itemSizes != null) {
//       double selectedItemOffset = _kMenuVerticalPadding;
//       for (int index = 0; index < selectedItemIndex; index += 1)
//         selectedItemOffset += itemSizes[index].height;
//       selectedItemOffset += itemSizes[selectedItemIndex].height / 2;
//       y = position.top +
//           (size.height - position.top - position.bottom) / 2.0 -
//           selectedItemOffset;
//     }
//
//     // Find the ideal horizontal position.
//     double x;
//     if (position.left > position.right) {
//       // Menu button is closer to the right edge, so grow to the left, aligned to the right edge.
//       x = size.width - position.right - childSize.width;
//     } else if (position.left < position.right) {
//       // Menu button is closer to the left edge, so grow to the right, aligned to the left edge.
//       x = position.left;
//     } else {
//       // Menu button is equidistant from both edges, so grow in reading direction.
//       assert(textDirection != null);
//       switch (textDirection) {
//         case TextDirection.rtl:
//           x = size.width - position.right - childSize.width;
//           break;
//         case TextDirection.ltr:
//           x = position.left;
//           break;
//       }
//     }
//
//     // Avoid going outside an area defined as the rectangle 8.0 pixels from the
//     // edge of the screen in every direction.
//     if (x < _kMenuScreenPadding)
//       x = _kMenuScreenPadding;
//     else if (x + childSize.width > size.width - _kMenuScreenPadding)
//       x = size.width - childSize.width - _kMenuScreenPadding;
//     if (y < _kMenuScreenPadding)
//       y = _kMenuScreenPadding;
//     else if (y + childSize.height > size.height - _kMenuScreenPadding)
//       y = size.height - childSize.height - _kMenuScreenPadding;
//     return Offset(x, y);
//   }
//
//   @override
//   bool shouldRelayout(_PopupMenuRouteLayout oldDelegate) {
//     // If called when the old and new itemSizes have been initialized then
//     // we expect them to have the same length because there's no practical
//     // way to change length of the items list once the menu has been shown.
//     assert(itemSizes.length == oldDelegate.itemSizes.length);
//
//     return position != oldDelegate.position ||
//         selectedItemIndex != oldDelegate.selectedItemIndex ||
//         textDirection != oldDelegate.textDirection ||
//         !listEquals(itemSizes, oldDelegate.itemSizes);
//   }
// }
//
// class _PopupMenuRoute<T> extends PopupRoute<T> {
//   _PopupMenuRoute({
//     this.position,
//     this.items,
//     this.initialValue,
//     this.elevation,
//     this.theme,
//     this.popupMenuTheme,
//     this.barrierLabel,
//     this.semanticLabel,
//     this.shape,
//     this.color,
//     this.showMenuContext,
//     this.captureInheritedThemes,
//     this.barrierColor,
//   }) : itemSizes = List<Size>(items.length);
//
//   final RelativeRect position;
//   final List<PopupMenuEntry<T>> items;
//   final List<Size> itemSizes;
//   final dynamic initialValue;
//   final double elevation;
//   final ThemeData theme;
//   final String semanticLabel;
//   final ShapeBorder shape;
//   final Color color;
//   final PopupMenuThemeData popupMenuTheme;
//   final BuildContext showMenuContext;
//   final bool captureInheritedThemes;
//   final Color barrierColor;
//
//   @override
//   Animation<double> createAnimation() {
//     return CurvedAnimation(
//       parent: super.createAnimation(),
//       curve: Curves.linear,
//       reverseCurve: const Interval(0.0, _kMenuCloseIntervalEnd),
//     );
//   }
//
//   @override
//   Duration get transitionDuration => _kMenuDuration;
//
//   @override
//   bool get barrierDismissible => true;
//
//   @override
//   final String barrierLabel;
//
//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     int selectedItemIndex;
//     if (initialValue != null) {
//       for (int index = 0;
//       selectedItemIndex == null && index < items.length;
//       index += 1) {
//         if (items[index].represents(initialValue)) selectedItemIndex = index;
//       }
//     }
//
//     Widget menu = _PopupMenu<T>(route: this, semanticLabel: semanticLabel);
//     if (captureInheritedThemes) {
//       menu = InheritedTheme.captureAll(showMenuContext, menu);
//     } else {
//       // For the sake of backwards compatibility. An (unlikely) app that relied
//       // on having menus only inherit from the material Theme could set
//       // captureInheritedThemes to false and get the original behavior.
//       if (theme != null) menu = Theme(data: theme, child: menu);
//     }
//
//     return MediaQuery.removePadding(
//       context: context,
//       removeTop: true,
//       removeBottom: true,
//       removeLeft: true,
//       removeRight: true,
//       child: Builder(
//         builder: (BuildContext context) {
//           return CustomSingleChildLayout(
//             delegate: _PopupMenuRouteLayout(
//               position,
//               itemSizes,
//               selectedItemIndex,
//               Directionality.of(context),
//             ),
//             child: menu,
//           );
//         },
//       ),
//     );
//   }
// }
//
// /// Show a popup menu that contains the `items` at `position`.
// ///
// /// `items` should be non-null and not empty.
// ///
// /// If `initialValue` is specified then the first item with a matching value
// /// will be highlighted and the value of `position` gives the rectangle whose
// /// vertical center will be aligned with the vertical center of the highlighted
// /// item (when possible).
// ///
// /// If `initialValue` is not specified then the top of the menu will be aligned
// /// with the top of the `position` rectangle.
// ///
// /// In both cases, the menu position will be adjusted if necessary to fit on the
// /// screen.
// ///
// /// Horizontally, the menu is positioned so that it grows in the direction that
// /// has the most room. For example, if the `position` describes a rectangle on
// /// the left edge of the screen, then the left edge of the menu is aligned with
// /// the left edge of the `position`, and the menu grows to the right. If both
// /// edges of the `position` are equidistant from the opposite edge of the
// /// screen, then the ambient [Directionality] is used as a tie-breaker,
// /// preferring to grow in the reading direction.
// ///
// /// The positioning of the `initialValue` at the `position` is implemented by
// /// iterating over the `items` to find the first whose
// /// [CustomPopupMenuEntry.represents] method returns true for `initialValue`, and then
// /// summing the values of [CustomPopupMenuEntry.height] for all the preceding widgets
// /// in the list.
// ///
// /// The `elevation` argument specifies the z-coordinate at which to place the
// /// menu. The elevation defaults to 8, the appropriate elevation for popup
// /// menus.
// ///
// /// The `context` argument is used to look up the [Navigator] and [Theme] for
// /// the menu. It is only used when the method is called. Its corresponding
// /// widget can be safely removed from the tree before the popup menu is closed.
// ///
// /// The `useRootNavigator` argument is used to determine whether to push the
// /// menu to the [Navigator] furthest from or nearest to the given `context`. It
// /// is `false` by default.
// ///
// /// The `semanticLabel` argument is used by accessibility frameworks to
// /// announce screen transitions when the menu is opened and closed. If this
// /// label is not provided, it will default to
// /// [MaterialLocalizations.popupMenuLabel].
// ///
// /// See also:
// ///
// ///  * [CustomPopupMenuItem], a popup menu entry for a single value.
// ///  * [PopupMenuDivider], a popup menu entry that is just a horizontal line.
// ///  * [CheckedPopupMenuItem], a popup menu item with a checkmark.
// ///  * [PopupMenuButton], which provides an [IconButton] that shows a menu by
// ///    calling this method automatically.
// ///  * [SemanticsConfiguration.namesRoute], for a description of edge triggered
// ///    semantics.
// Future<T> customShowMenu<T>({
//   @required BuildContext context,
//   @required RelativeRect position,
//   @required List<PopupMenuEntry<T>> items,
//   T initialValue,
//   double elevation,
//   String semanticLabel,
//   Color barrierColor,
//   ShapeBorder shape,
//   Color color,
//   bool captureInheritedThemes = true,
//   bool useRootNavigator = false,
// }) {
//   assert(context != null);
//   assert(position != null);
//   assert(useRootNavigator != null);
//   assert(items != null && items.isNotEmpty);
//   assert(captureInheritedThemes != null);
//   assert(debugCheckHasMaterialLocalizations(context));
//
//   String label = semanticLabel;
//   switch (Theme.of(context).platform) {
//     case TargetPlatform.iOS:
//     case TargetPlatform.macOS:
//       label = semanticLabel;
//       break;
//     case TargetPlatform.android:
//     case TargetPlatform.fuchsia:
//     case TargetPlatform.linux:
//     case TargetPlatform.windows:
//       label =
//           semanticLabel ?? MaterialLocalizations.of(context)?.popupMenuLabel;
//   }
//
//   return Navigator.of(context, rootNavigator: useRootNavigator).push(
//     _PopupMenuRoute<T>(
//       position: position,
//       items: items,
//       initialValue: initialValue,
//       elevation: elevation,
//       semanticLabel: label,
//       theme: Theme.of(context),
//       popupMenuTheme: PopupMenuTheme.of(context),
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       barrierColor: barrierColor,
//       shape: shape,
//       color: color,
//       showMenuContext: context,
//       captureInheritedThemes: captureInheritedThemes,
//     ),
//   );
// }
// //import 'dart:async';
// //
// //import 'package:flutter/material.dart';
// //
// //import '../dropdown_search.dart';
//
// class SelectDialog<T> extends StatefulWidget {
//   final T selectedValue;
//   final List<T> items;
//   final bool showSearchBox;
//   final bool isFilteredOnline;
//   final ValueChanged<T> onChanged;
//   final DropdownSearchOnFind<T> onFind;
//   final DropdownSearchPopupItemBuilder<T> itemBuilder;
//   final InputDecoration searchBoxDecoration;
//   final DropdownSearchItemAsString<T> itemAsString;
//   final DropdownSearchFilterFn<T> filterFn;
//   final String hintText;
//   final double maxHeight;
//   final double dialogMaxWidth;
//   final Widget popupTitle;
//   final bool showSelectedItem;
//   final DropdownSearchCompareFn<T> compareFn;
//   final DropdownSearchPopupItemEnabled<T> itemDisabled;
//
//   ///custom layout for empty results
//   final EmptyBuilder emptyBuilder;
//
//   ///custom layout for loading items
//   final LoadingBuilder loadingBuilder;
//
//   ///custom layout for error
//   final ErrorBuilder errorBuilder;
//
//   ///the search box will be focused if true
//   final bool autoFocusSearchBox;
//
//   ///text controller to set default search word for example
//   final TextEditingController searchBoxController;
//
//   ///delay before searching
//   final Duration searchDelay;
//
//   const SelectDialog({
//     Key key,
//     this.popupTitle,
//     this.items,
//     this.maxHeight,
//     this.showSearchBox = false,
//     this.isFilteredOnline = false,
//     this.onChanged,
//     this.selectedValue,
//     this.onFind,
//     this.itemBuilder,
//     this.searchBoxDecoration,
//     this.hintText,
//     this.itemAsString,
//     this.filterFn,
//     this.showSelectedItem = false,
//     this.compareFn,
//     this.emptyBuilder,
//     this.loadingBuilder,
//     this.errorBuilder,
//     this.autoFocusSearchBox = false,
//     this.dialogMaxWidth,
//     this.itemDisabled,
//     this.searchBoxController,
//     this.searchDelay,
//   }) : super(key: key);
//
//   @override
//   _SelectDialogState<T> createState() => _SelectDialogState<T>();
// }
//
// class _SelectDialogState<T> extends State<SelectDialog<T>> {
//   final FocusNode focusNode = new FocusNode();
//   final StreamController<List<T>> _itemsStream = StreamController();
//   final ValueNotifier<bool> _loadingNotifier = ValueNotifier(false);
//   final List<T> _items = List<T>();
//   Debouncer _debouncer;
//
//   @override
//   void initState() {
//     super.initState();
//     _debouncer = Debouncer(delay: widget.searchDelay);
//
//     Future.delayed(
//       Duration.zero,
//           () => manageItemsByFilter(widget.searchBoxController?.text ?? '',
//           isFistLoad: true),
//     );
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (widget.autoFocusSearchBox)
//       FocusScope.of(context).requestFocus(focusNode);
//   }
//
//   @override
//   void dispose() {
//     _itemsStream.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     bool isTablet = deviceSize.width > deviceSize.height;
//     double maxHeight = deviceSize.height * (isTablet ? .8 : .6);
//     double maxWidth = deviceSize.width * (isTablet ? .7 : .9);
//
//     return Container(
//       width: widget.dialogMaxWidth ?? maxWidth,
//       constraints: BoxConstraints(maxHeight: widget.maxHeight ?? maxHeight),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           _searchField(),
//           Expanded(
//             child: Stack(
//               children: <Widget>[
//                 StreamBuilder<List<T>>(
//                   stream: _itemsStream.stream,
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return _errorWidget(snapshot?.error);
//                     } else if (!snapshot.hasData) {
//                       return _loadingWidget();
//                     } else if (snapshot.data.isEmpty) {
//                       if (widget.emptyBuilder != null)
//                         return widget.emptyBuilder(
//                             context, widget.searchBoxController?.text);
//                       else
//                         return const Center(
//                           child: const Text("No data found"),
//                         );
//                     }
//                     return ListView.builder(
//                       shrinkWrap: true,
//                       padding: EdgeInsets.symmetric(vertical: 0),
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (context, index) {
//                         var item = snapshot.data[index];
//                         return _itemWidget(item);
//                       },
//                     );
//                   },
//                 ),
//                 _loadingWidget()
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showErrorDialog(dynamic error) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Error while getting online items"),
//           content: _errorWidget(error),
//           actions: <Widget>[
//             FlatButton(
//               child: new Text("OK"),
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _errorWidget(dynamic error) {
//     if (widget.errorBuilder != null)
//       return widget.errorBuilder(
//           context, widget.searchBoxController?.text, error);
//     else
//       return Padding(
//         padding: EdgeInsets.all(8),
//         child: Text(
//           error?.toString() ?? 'Error',
//         ),
//       );
//   }
//
//   Widget _loadingWidget() {
//     return ValueListenableBuilder(
//         valueListenable: _loadingNotifier,
//         builder: (context, bool isLoading, wid) {
//           if (isLoading) {
//             if (widget.loadingBuilder != null)
//               return widget.loadingBuilder(
//                   context, widget.searchBoxController?.text);
//             else
//               return Padding(
//                 padding: const EdgeInsets.all(24.0),
//                 child: const Center(
//                   child: const CircularProgressIndicator(),
//                 ),
//               );
//           }
//           return Container();
//         });
//   }
//
//   void _onTextChanged(String filter) async {
//     manageItemsByFilter(filter);
//   }
//
//   ///Function that filter item (online and offline) base on user filter
//   ///[filter] is the filter keyword
//   ///[isFirstLoad] true if it's the first time we load data from online, false other wises
//   void manageItemsByFilter(String filter, {bool isFistLoad = false}) async {
//     _loadingNotifier.value = true;
//
//     List<T> applyFilter(String filter) {
//       return _items.where((i) {
//         if (widget.filterFn != null)
//           return (widget.filterFn(i, filter));
//         else if (i.toString().toLowerCase().contains(filter.toLowerCase()))
//           return true;
//         else if (widget.itemAsString != null) {
//           return (widget.itemAsString(i))
//               ?.toLowerCase()
//               ?.contains(filter.toLowerCase()) ??
//               false;
//         }
//         return false;
//       }).toList();
//     }
//
//     //load offline data for the first time
//     if (isFistLoad && widget.items != null) _items.addAll(widget.items);
//
//     //manage offline items
//     if (widget.onFind != null && (widget.isFilteredOnline || isFistLoad)) {
//       try {
//         final List<T> onlineItems = List();
//         onlineItems.addAll(await widget.onFind(filter) ?? List());
//
//         //Remove all old data
//         _items.clear();
//         //add offline items
//         if (widget.items != null) {
//           _items.addAll(widget.items);
//           //if filter online we filter only local list based on entred keyword (filter)
//           if (widget.isFilteredOnline == true) {
//             var filteredLocalList = applyFilter(filter);
//             _items.clear();
//             _items.addAll(filteredLocalList);
//           }
//         }
//         //add new online items to list
//         _items.addAll(onlineItems);
//
//         _addDataToStream(applyFilter(filter));
//       } catch (e) {
//         _addErrorToStream(e);
//         //if offline items count > 0 , the error will be not visible for the user
//         //As solution we show it in dialog
//         if (widget.items != null && widget.items.isNotEmpty) {
//           _showErrorDialog(e);
//           _addDataToStream(applyFilter(filter));
//         }
//       }
//     } else {
//       _addDataToStream(applyFilter(filter));
//     }
//
//     _loadingNotifier.value = false;
//   }
//
//   void _addDataToStream(List<T> data) {
//     if (_itemsStream.isClosed) return;
//     _itemsStream.add(data);
//   }
//
//   void _addErrorToStream(Object error, [StackTrace stackTrace]) {
//     if (_itemsStream.isClosed) return;
//     _itemsStream.addError(error, stackTrace);
//   }
//
//   Widget _itemWidget(T item) {
//     if (widget.itemBuilder != null)
//       return InkWell(
//         child: widget.itemBuilder(
//           context,
//           item,
//           _manageSelectedItemVisibility(item),
//         ),
//         onTap: widget.itemDisabled != null &&
//             (widget.itemDisabled(item) ?? false) == true
//             ? null
//             : () {
//           Navigator.pop(context, item);
//           if (widget.onChanged != null) widget.onChanged(item);
//         },
//       );
//     else
//       return ListTile(
//         title: Text(
//           widget.itemAsString != null
//               ? (widget.itemAsString(item) ?? "")
//               : item.toString(),
//         ),
//         selected: _manageSelectedItemVisibility(item),
//         onTap: widget.itemDisabled != null &&
//             (widget.itemDisabled(item) ?? false) == true
//             ? null
//             : () {
//           Navigator.pop(context, item);
//           if (widget.onChanged != null) widget.onChanged(item);
//         },
//       );
//   }
//
//   /// selected item will be highlighted only when [widget.showSelectedItem] is true,
//   /// if our object is String [widget.compareFn] is not required , other wises it's required
//   bool _manageSelectedItemVisibility(T item) {
//     if (!widget.showSelectedItem) return false;
//
//     if (T == String) {
//       return item == widget.selectedValue;
//     } else {
//       return widget.compareFn(item, widget.selectedValue);
//     }
//   }
//
//   Widget _searchField() {
//     return Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           widget.popupTitle ?? const SizedBox.shrink(),
//           if (widget.showSearchBox)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: widget.searchBoxController,
//                 focusNode: focusNode,
//                 onChanged: (f) => _debouncer(() {
//                   _onTextChanged(f);
//                 }),
//                 decoration: widget.searchBoxDecoration ??
//                     InputDecoration(
//                       hintText: widget.hintText,
//                       border: const OutlineInputBorder(),
//                       contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 16),
//                     ),
//               ),
//             )
//         ]);
//   }
// }
//
// class Debouncer {
//   final Duration delay;
//   Timer _timer;
//
//   Debouncer({this.delay});
//
//   call(Function action) {
//     _timer?.cancel();
//     _timer = Timer(delay ?? const Duration(milliseconds: 500), action);
//   }
// }
