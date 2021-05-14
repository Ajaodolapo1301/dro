import 'dart:async';


import 'package:dro_app/utils/sizeConfig/sizeConfig.dart';
import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomDropDownItem<T> {
  final T value;
  final String text;


  CustomDropDownItem({this.value, this.text});

  @override
  String toString() {
    return "CustomDropDownItem(value: $value, text: $text)";
  }
}

class CustomDropDown<T> extends StatefulWidget {
  final String header;
  final List<CustomDropDownItem<T>> items;
  final Function(T value) onSelected;
  final Widget suffix;
  final CustomDropDownItem intialValue;

  const CustomDropDown({
    @required this.items,
    @required this.onSelected,
    @required this.header,
    @required this.intialValue,
    this.suffix,
  });

  @override
  _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  bool expanded = false;
  List<CustomDropDownItem<T>> items = [];
  CustomDropDownItem<T> selectedItem;

  @override
  void initState() {
    initItems();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.toString() != items.toString()) {
      initItems();
    }
    validateList();
    return IgnorePointer(
      ignoring: emptyList,
      child: GestureDetector(
        onTap: () {
          setState(() {
            expanded = !expanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            AnimatedContainer(
              height: expanded ? 4.9 * SizeConfig.heightMultiplier + (3.6 * SizeConfig.textMultiplier *  (items.length)) : 4.9 * SizeConfig.heightMultiplier,
              width: 40.2 * SizeConfig.widthMultiplier,
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.symmetric(horizontal: 1.2 * SizeConfig.textMultiplier, vertical: 1.2 * SizeConfig.textMultiplier, ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: bookBorder.withOpacity(0.4),
                ),
                borderRadius: BorderRadius.circular(2.4 * SizeConfig.textMultiplier),
              ),
              child: ListView(

                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                       SvgPicture.asset("assets/images/drawer/business.svg", height: 1.7 * SizeConfig.textMultiplier,),
                        SizedBox(width: 1.2 * SizeConfig.textMultiplier,),

                        Expanded(
                          child: Text(

                            selectedItem.text,

                            overflow: TextOverflow.ellipsis,

                            // textAlign: TextAlign.center,
                            style: TextStyle(

                                fontSize: 1.5 * SizeConfig.textMultiplier,

                              color: bookBlack,
                            ),
                          ),
                        ),
                        widget.suffix ??
                            RotatedBox(
                              quarterTurns: expanded ? 2 : 0,
                              child: Icon(

                                Icons.keyboard_arrow_down,

                                size: 1.8 * SizeConfig.textMultiplier,
                                color: emptyList ? bookBorder: bookBorder,
                              ),
                            )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(),
                  SizedBox(height: 2),
                  ...items
                      .where((element) => selectedItem.value != element.value)
                      .map((e) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = e;
                          expanded = false;
                          widget.onSelected(selectedItem.value);
                        });
                      },
                      child: Container(
                        // height: 20,
                        // width: 100,
                        child: Center(
                          child: Text(
                            e.text,
                            style: TextStyle(
                              fontSize: 1.4 * SizeConfig.textMultiplier,

                              color: bookBlack,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }

  bool emptyList = false;

  void initItems() {

    items = widget.items;
    if (items.isEmpty) {
      setState(() {
        emptyList = true;
      });
      items.add(
        CustomDropDownItem(
          value: widget.intialValue.value,
          text: widget.intialValue.text ?? "Select",
        ),
      );
    }else{
       setState(() {
        emptyList = false;
      });
    }
    selectedItem = items.first;
    Timer(
      Duration(milliseconds: 1),
          () {
        widget.onSelected(selectedItem.value);
      },
    );
    validateList();
  }

  void validateList() {
    for (int i = 0; i < items.length; i++) {
      for (int j = i + 1; j < items.length; j++) {
        if (items[i].value == items[j].value) {
          throw Exception(
              "Duplicate values \'${items[i].value}\' at indices $i and $j");
        }
      }
    }
  }
}
