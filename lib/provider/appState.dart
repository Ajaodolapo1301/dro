

import 'package:dro_app/model/drug.dart';
import 'package:dro_app/utils/navigation/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class AppState with ChangeNotifier{

  int total = 0;
var displayPrice = 0;

  List<Drug> _cartList = [];
  List<Drug> get cartlist {
    return [..._cartList];


  }





  void clear(){
    _cartList.clear();
  }
  gettingTotalPrice(){

    return  total  = _cartList.map<int>((m) => displayPrice).reduce((a,b )=>a+b);

  }


  // gettingPrice(){
  //
  //   return    = _cartList.map<int>((m) => int.parse(m.price.toString())).reduce((a,b )=>a+b);
  //
  // }


  int calculateTotal() {
    total = 0;
    _cartList.forEach((f) {
      total += f.price * f.quantity;
    });
 return total;
  }

  void showAlert(Drug drug, BuildContext context,) {
    AlertDialog dialog = new AlertDialog(
      content: new Container(
        width: 300.0,
        height: 200.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: const Color(0xFFFFFF),
          borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Container(
              // padding: new EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Successful',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'helvetica_neue_light',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10,),

                  Text(
                    "${drug.name} has been added to your bag" ,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Spacer(),
            // dialog centre
            InkWell(
              onTap: (){

              },
              child: new Container(
                padding: new EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                  color: const Color(0xFF13b8b5),
                ),
                child: new Text(
                  'View bag',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10,),
            // dialog bottom
            InkWell(
              onTap: (){
                pop(context);
              },
              child: new Container(
                padding: new EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                  color: const Color(0xFF13b8b5),
                ),
                child: new Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, child: dialog);
  }

  void addProduct({BuildContext context, Drug drug}) {
    int index = _cartList.indexWhere((i) => i.id == drug.id);
    print(index);
    if (index != -1){
      toast("Already added");
    }

    else {
      _cartList.add(drug);
        showAlert(drug, context);
      toast(" added");
      calculateTotal();
      notifyListeners();
    }
  }

  void add(Drug item) {
      if(_cartList.contains(item.id)){
        toast("Already added");
      }
    _cartList.add(item);
      toast(" Added");
    notifyListeners();
  }


  void remove( drug) {
    _cartList.remove(drug);

    // _cartList.removeAt(z)
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }


 List<Drug>  listofDrugs = [
   Drug(
     id: 1,
       name: "Paracetamol",
       desc: "Paracetamol - Extra",
       image: "assets/images/Paracetamol.png",
       price: 23
   ),
   Drug(
       id: 2,
       name: "Emzor",
       desc: "Panadol - Extra",
       image: "assets/images/folic.png",
       price: 23
   ),
   Drug(
       id: 3,
       name: "Filmor",
       desc: "Panadol - Extra",
       image: "assets/images/pana.png",
       price: 23
   )

 ];


}