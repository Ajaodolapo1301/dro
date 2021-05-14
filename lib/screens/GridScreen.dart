import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:dro_app/model/drug.dart';
import 'package:dro_app/provider/appState.dart';
import 'package:dro_app/reusable/box.dart';
import 'package:dro_app/reusable/threeCircles.dart';
import 'package:dro_app/screens/details.dart';
import 'package:dro_app/utils/navigation/navigator.dart';
import 'package:dro_app/utils/styles/color_utils.dart';
import 'package:dro_app/utils/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> with AfterLayoutMixin<GridScreen> {
bool  open = false;
AppState appState;

List<Drug> filteredList = [];

  TextEditingController searchController = TextEditingController();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);

    if (filteredList.isEmpty) {

      setState(() {
        filteredList = appState.listofDrugs;
      });
      print(filteredList);

      print(appState.cartlist);
    }
    return Container(
      color: Colors.white,
      child: SafeArea(
              bottom: false,
        child: Scaffold(
          body: SlidingUpPanel(
            onPanelClosed: (){
              setState(() {
                open = false;
              });
            },
            onPanelOpened: (){
              setState(() {
                open = true;
              });

            },
            color: kprimaryColor,
            maxHeight: MediaQuery.of(context).size.height,

          minHeight: 60,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            panelBuilder: (ScrollController sc){

              return _scrollingList(sc);
            },
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Header(
                    preferredActionOnBackPressed: () {},
                    text: "1234",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        ThreeCircles(child:
                        Transform.scale(
                            scale: 0.5,
                            child: Image.asset("assets/images/ar.png",height: 10,)),
                        ),

                        ThreeCircles(
                            child: Transform.scale(
                                scale: 0.5,
                                child: Image.asset("assets/images/filter.png",height: 10,))
                        ),

                        InkWell(
                            onTap: (){
                              setState(() {
                                show = !show;
                              });
                            },
                            child: ThreeCircles(child:
                            Transform.scale(
                                scale: 0.5,
                                child: Image.asset("assets/images/search.png",height: 10,))
                            )
                        )
                      ]
                      ,
                    ),
                  ),

                  show ?      SizedBox(height: 20,) : SizedBox(),
                  show ?          Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 21),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        // color: borderBlue,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Icon(Icons.search, color: Colors.grey, size: 20),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onChanged: (v) {
                              if (v.isNotEmpty) {
                                setState(() {
                                  filteredList = appState.listofDrugs
                                      .where((country) => country.name
                                      .toString()
                                      .toLowerCase()
                                      .contains(v))
                                      .toList();
                                });
                              } else {
                                setState(() {
                                  filteredList = appState.listofDrugs;
                                });
                              }
                            },
                            cursorColor: Colors.grey,
                            controller: searchController,
                            decoration: InputDecoration.collapsed(
                                hintText: "Search for country",
                                hintStyle:
                                TextStyle(fontSize: 13, color: Colors.black)),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),

                 searchController.text.isNotEmpty  ?        Icon(Icons.search, color: Colors.grey, size: 20) : SizedBox(),
                        SizedBox(width: 10),
                      ],
                    ),
                  ) : SizedBox(),
                  SizedBox(height: 20,),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(filteredList.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Box(drug: filteredList[index],),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }



  Widget _scrollingList(ScrollController sc){
    return Container(

      decoration: BoxDecoration(
          color: kprimaryColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),

      child: Column(
        children: [
          SizedBox(height: 5,),
          Center(
            child: Container(
              // margin: EdgeInsets.only(top: 5),
              height: 4,
              width: 40,
              color: Colors.white,
            ),
          ),
          // SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0 ),
            child: Row(
              mainAxisAlignment: open ? MainAxisAlignment.center :  MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/shopping-bag.png", height: 30, color: Colors.white,),
                    SizedBox(width: 7,),
                    Text("Bag", style: TextStyle(fontSize: 20, color: Colors.white),)
                  ],
                ),
                open ? SizedBox():      Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(15),

                  child: Text(appState.cartlist.length.toString()),
                )
              ],
            ),
          ),
          Container(

            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            height: 25,
            // width: 100,
            child: Center(child: Text("Tap on an item to add, remove or delete option", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white
            ),
          ),
     appState.cartlist.length == 0  ? Expanded(child: Text("No items")):
     Expanded(
            child: Container(

              child: SingleChildScrollView(
                child: Column(
                  children: appState.cartlist.map((e){
                    print(e);
                    return  Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ListTileTheme(
                        tileColor: Colors.transparent,
                        child: ExpansionTile(
                          trailing: Text(e.displayprice.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                          title: Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(360) ,
                                    image: DecorationImage(
                                        image:  AssetImage(e.image)
                                    )
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text("${e.quantity} x", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),),
                              SizedBox(width: 25,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(e.desc, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                                  Text(e.name, style: TextStyle(fontSize: 13,  color: Colors.white))


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
                                      onTap:(){
                                        appState.remove(e);
                                      },
                                      child: Image.asset("assets/images/delete.png", height: 20, color: Colors.white,)),
                                  Row(
                                    children: [
                                      RoundedIcon(
                                        onPress: (){
                                          setState(() {
                                            if(e.quantity > 1){
                                              e.quantity--;
                                              e.displayprice  -= e.price;
                                            }else{
                                             e.quantity = 1;
                                            }

                                          });
                                        },
                                        child: Image.asset("assets/images/remove.png", height: 15,),
                                      ),

                                      SizedBox(width: 10,),
                                      Text(e.quantity.toString(), style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white)),
                                      SizedBox(width: 10,),
                                      RoundedIcon(
                                        onPress: (){
                                          setState(() {
                                           e.quantity++;
                                           e.displayprice = e.price * e.quantity;
                                          });
                                        },
                                        child: Image.asset("assets/images/plus.png", height: 15),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
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
                    Text("Total", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white)),

                    Text( "NGN ${appState.calculateTotal().toString()}", style: TextStyle(fontSize:25, fontWeight: FontWeight.w700, color: Colors.white))
                  ],
                ),
                SizedBox(height: 20,),
                InkWell(

                  onTap: appState.cartlist.length == 0 ? null : (){


                  },
                  child: Container(

                    margin: EdgeInsets.symmetric(horizontal: 40),
                    height: 50,
                    // width: 100,
                    child: Center(child: Text("Checkout", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),

        ],
      ),
    );

  }

  @override
  void afterFirstLayout(BuildContext context) {

  }




}




