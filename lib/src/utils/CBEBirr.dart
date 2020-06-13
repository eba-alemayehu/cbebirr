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
  static const String FOR_ME = "1";
  static const String FOR_OTHERS = "2";
  static const String PHONE = "1";
  static const String OK = "1";

  String pin;

  CBEBirr(this.pin);

  void balance() => sendUssdRequest([CBEBirr.BALANCE], confirmation: false);

  void buyAirtime(String amount) =>
      sendUssdRequest([CBEBirr.BUY_AIRTIME, CBEBirr.FOR_ME, amount]);

  void buyAirtimeOthers(String amount, String phone) => sendUssdRequest(
      [CBEBirr.BUY_AIRTIME, CBEBirr.FOR_OTHERS, CBEBirr.PHONE, phone, amount]);

  void sendMoney(String amount, String phone) =>
      sendUssdRequest([CBEBirr.SEND_MONEY, phone, amount]);

  void sendUssdRequest(List<String> code, {bool confirmation = true}) {
    String ussd_code = "";
    if (code.length == 0)
      ussd_code = "*847#";
    else {
      ussd_code = "*847";
      for (final String i in code) {
        ussd_code += "*" + i;
      }

      ussd_code += "*" + ((!confirmation) ? this.pin : (this.pin + "*1")) + "#";
    }
    print(ussd_code);
    // return;
    Ussd.runUssd(ussd_code).then((value) {
      print(value);
    }).catchError((onError) {
      print(onError);
    });
  }
}
