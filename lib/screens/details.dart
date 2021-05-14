import 'package:after_layout/after_layout.dart';
import 'package:dro_app/model/drug.dart';

import 'package:dro_app/provider/appState.dart';

import 'package:dro_app/reusable/custom_button.dart';
import 'package:dro_app/reusable/productdetails.dart';

import 'package:dro_app/utils/navigation/navigator.dart';
import 'package:dro_app/utils/sizeConfig/sizeConfig.dart';
import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Details extends StatefulWidget {
  Drug drug;
  Details({this.drug});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with AfterLayoutMixin<Details> {
  int quantity = 1;
  bool showSheet = false;
  AppState appState;

  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    appState = Provider.of(context);

    return Container(
      color: Colors.white,
      child: SafeArea(


        bottom: false,
        child: Scaffold(
          body: SlidingUpPanel(
            controller: panelController,
            color: kprimaryColor,
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: 0,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            panelBuilder: (ScrollController sc) {
              return _scrollingList(sc);
            },
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => pop(context)),
                      InkWell(
                        onTap: () {
                          setState(() {
                            panelController.open();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: kprimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/shopping-bag.png",
                                  height: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  appState.cartlist.length.toString(),
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.2 * SizeConfig.heightMultiplier,
                          ),
                          Expanded(
                              child: Image.asset(
                            widget.drug.image,
                            height: 6.1 * SizeConfig.heightMultiplier,
                          )),
                          SizedBox(
                            height: 1.2 * SizeConfig.heightMultiplier,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.drug.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(widget.drug.desc,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle),
                                      height: 45,
                                      width: 45,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sold By".toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text("Emzor Pharmaceuticals",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10,
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          // width: 50,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.grey)),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // SizedBox(width: 5,),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (widget.drug.quantity >
                                                          1) {
                                                        widget.drug.quantity--;
                                                        widget.drug
                                                                .displayprice -=
                                                            widget.drug.price;
                                                      } else {
                                                        widget.drug.quantity =
                                                            1;
                                                      }
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/remove.png",
                                                    height: 12,
                                                  )),

                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                widget.drug.quantity.toString(),
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      widget.drug.quantity++;
                                                      widget.drug.displayprice =
                                                          widget.drug.price *
                                                              widget.drug
                                                                  .quantity;
                                                    });
                                                  },
                                                  child: Image.asset(
                                                    "assets/images/plus.png",
                                                    height: 12,
                                                  )),
                                              // SizedBox(width: 15,),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text("Pack(s)",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey
                                                    .withOpacity(0.8)))
                                      ],
                                    ),
                                    Text(
                                        "₦ ${widget.drug.displayprice.toString()}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(
                                  height: 4.3 * SizeConfig.heightMultiplier,
                                ),
                                Text("Product Details".toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    ProducDetails(
                                      title: "Pack Size",
                                      packSize: "3 x 10",
                                      images: "assets/images/pill.png",
                                      rotate: true,
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/qr-code.png",
                                            height: 23,
                                            color: kprimaryColor,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Product ID",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12)),
                                              Text("iyddffwywvs",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Spacer(
                                      flex: 3,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.8 * SizeConfig.heightMultiplier,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Transform.rotate(
                                          angle: 0.0,
                                          child: Image.asset(
                                            "assets/images/pill2.png",
                                            height: 23,
                                            color: kprimaryColor,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Constituent",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          Text("Extra",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ProducDetails(
                                  title: "Pack Size",
                                  packSize: "3 x 10",
                                  images: "assets/images/pill.png",
                                  rotate: true,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomButton(
                      color: kprimaryColor,
                      type: ButtonType.filled,
                      textColor: Colors.white,
                      showArrow: true,
                      text: "Add to bag",
                      onPressed: () async {
                        // yes();
                        appState.addProduct(
                            drug: widget.drug, context: context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8.6 * SizeConfig.heightMultiplier,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _scrollingList(ScrollController sc) {
    return Container(
      decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: 5,
              width: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/shopping-bag.png",
                    height: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Bag",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: appState.cartlist.map((e) {
                    print(e);
                    return ListTileTheme(
                      tileColor: Colors.transparent,
                      child: ExpansionTile(
                        trailing: Text("NGN ${e.displayprice.toString()}",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        title: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(360),
                                  image: DecorationImage(
                                      image: AssetImage(e.image))),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "${e.quantity} x",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.desc,
                                    style: TextStyle(
                                        fontSize:
                                            1.8 * SizeConfig.textMultiplier,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                                Text(e.name,
                                    style: TextStyle(
                                        fontSize:
                                            1.6 * SizeConfig.textMultiplier,
                                        color: Colors.white))
                              ],
                            )
                          ],
                        ),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () {
                                      appState.remove(e);
                                    },
                                    child: Image.asset(
                                      "assets/images/delete.png",
                                      height: 20,
                                      color: Colors.white,
                                    )),
                                Row(
                                  children: [
                                    RoundedIcon(
                                      onPress: () {
                                        setState(() {
                                          if (e.quantity > 1) {
                                            e.quantity--;
                                            e.displayprice -= e.price;
                                          } else {
                                            e.quantity = 1;
                                          }
                                        });
                                      },
                                      child: Image.asset(
                                        "assets/images/remove.png",
                                        height: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(e.quantity.toString(),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RoundedIcon(
                                      onPress: () {
                                        setState(() {
                                          e.quantity++;
                                          e.displayprice = e.price * e.quantity;
                                        });
                                      },
                                      child: Image.asset(
                                          "assets/images/plus.png",
                                          height: 15),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total",
                        style: TextStyle(
                            fontSize: 2.4 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w700,
                            color: Colors.white)),
                    Text("NGN ${appState.calculateTotal().toString()}",
                        style: TextStyle(
                            fontSize: 2.4 * SizeConfig.textMultiplier,
                            fontWeight: FontWeight.w700,
                            color: Colors.white))
                  ],
                ),
                SizedBox(
                  height: 2.4 * SizeConfig.textMultiplier,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  height: 50,
                  // width: 100,
                  child: Center(
                      child: Text(
                    "Checkout",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

//   void _showAlert(Drug drug, BuildContext context) {
//     AlertDialog dialog = new AlertDialog(
//       content: new Container(
//         width: 300.0,
//         height: 200.0,
//         decoration: new BoxDecoration(
//           shape: BoxShape.rectangle,
//           color: const Color(0xFFFFFF),
//           borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
//         ),
//         child: new Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             // dialog top
//             new Container(
//               // padding: new EdgeInsets.all(10.0),
//               decoration: new BoxDecoration(
//                 color: Colors.white,
//               ),
//               child: Column(
//                 children: [
//                    Text(
//                     'Successful',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.w800,
//                       fontFamily: 'helvetica_neue_light',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 10,),
//
//                   Text(
//                    "${ widget.drug.name} has been added to your bag" ,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.w800,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
// Spacer(),
//             // dialog centre
//             InkWell(
//               onTap: (){
//                 appState.add(drug);
//               },
//               child: new Container(
//                 padding: new EdgeInsets.all(16.0),
//                 decoration: new BoxDecoration(
//                   color: const Color(0xFF13b8b5),
//                 ),
//                 child: new Text(
//                   'View bag',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.0,
//                     fontFamily: 'helvetica_neue_light',
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
// SizedBox(height: 10,),
//             // dialog bottom
//             InkWell(
//               onTap: (){
//               pop(context);
//               },
//               child: new Container(
//                 padding: new EdgeInsets.all(16.0),
//                 decoration: new BoxDecoration(
//                   color: const Color(0xFF13b8b5),
//                 ),
//                 child: new Text(
//                   'Done',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18.0,
//                     fontFamily: 'helvetica_neue_light',
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//     showDialog(context: context, child: dialog);
//   }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      widget.drug.displayprice = widget.drug.price;
    });
  }
}

class RoundedIcon extends StatelessWidget {
  final Widget child;
  final Function onPress;
  RoundedIcon({this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(width: 40, height: 40),
      child: child,
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
