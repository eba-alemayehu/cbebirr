import 'package:cbebirr/src/utils/CBEBirr.dart';
import 'package:cbebirr/src/widgets/dialogs/BuyAirtime.dart';
import "package:flutter/material.dart";
import "../widgets/Service.dart";
import 'package:ussd/ussd.dart';
import 'package:sms_receiver/sms_receiver.dart';
import "../widgets/dialogs/BuyAirtime.dart"; 
import "../widgets/dialogs/SendMoney.dart"; 

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("CBE Birr"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
            child: Material(
              elevation: 10,
              color: Colors.white,
              shadowColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "10 Birr",
                            style: TextStyle(
                              fontSize: 36,
                            ),
                          ),
                          Text(
                            "Last update 2/3/2020",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: FlatButton(
                          child: Text("Update"),
                          onPressed: () {
                            CBEBirr cbeBirr = new CBEBirr("6776"); 
                            cbeBirr.balance(); 
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 64),
            child: Text("Services"),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Service(
                icon: "lib/src/assets/icons/airtime.svg",
                text: "Buy Airtime",
                callback: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return BuyAirtimeDialog(); 
                    },
                  )
                },
              ),
              Service(
                icon: "lib/src/assets/icons/buy.svg",
                text: "Buy Goods",
              ),
              Service(
                icon: "lib/src/assets/icons/pay.svg",
                text: "Pay Bill",
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Service(
                icon: "lib/src/assets/icons/send.svg",
                text: "Send Money",
                callback: () {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context) => SendMoneyDialog()                  
                  ); 
                },
              ),
              Service(
                icon: "lib/src/assets/icons/cash.svg ",
                text: "Cash Out",
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 64),
            child: Text("Settings"),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Service(
                  icon: "lib/src/assets/icons/send.svg",
                  text: "Min satement",
                  row: true),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Service(
                  icon: "lib/src/assets/icons/send.svg",
                  text: "Change PIN",
                  row: true),
            ]),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Service(
                  icon: "lib/src/assets/icons/send.svg",
                  text: "Change secret word",
                  row: true)
            ]),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Row(children: <Widget>[
              Service(
                  icon: "lib/src/assets/icons/send.svg",
                  text: "Change language",
                  row: true)
            ]),
          ),
        ],
      ),
    );
  }
}
