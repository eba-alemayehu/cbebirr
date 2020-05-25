import 'package:flutter/material.dart';
import 'package:ussd/ussd.dart';

class CBEBirr {
  static const String USSD = "847";
  static const String SEND_MONEY = "1";
  static const String CASH_OUT = "2";
  static const String BUY_AIRTIME = "3";
  static const String BUY_GOODS = "4";
  static const String PAY_BILL = "5";
  static const String BALANCE = "6";
  static const String OTHERS = "7";
  static const String MINI_STATEMENT = "1";
  static const String CAHNGE_PIN = "2";
  static const String CAHNGE_LANGUAGE = "3";
  static const String CAHNGE_SECRET_WORD = "4";

  String pin;

  CBEBirr(this.pin);

  void send_money({@required String receiver, @required double amount}) {
    send_ussd_request([CBEBirr.SEND_MONEY, receiver, amount.toString()]);
  }

  void balance() {
    send_ussd_request([CBEBirr.BALANCE]);
  }

  void send_ussd_request(List<String> code) {
    String ussd_code = "";
    if (code.length == 0)
      ussd_code = "*847#";
    else {
      ussd_code = "*847"; 
      for (final String i in code) {
        ussd_code += "*" + i;
      }
      ussd_code += "*" + this.pin + "#";
    }
    print(ussd_code); 
    Ussd.runUssd(ussd_code).then((value) {
      print(value);
    }).catchError((onError) {
      print(onError);
    });
  }
}
