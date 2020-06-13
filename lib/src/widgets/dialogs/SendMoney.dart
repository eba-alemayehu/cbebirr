import "package:flutter/material.dart";
import "../PhoneInput.dart";
import "../../utils/CBEBirr.dart";

class SendMoneyDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SendMoneyDialog();
  }
}

class _SendMoneyDialog extends State<SendMoneyDialog> {
  String _amount;
  String _phone;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          height: 360,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text("Buy Airtime", style: TextStyle(fontSize: 24)),
              SizedBox(
                height: 24,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Amount',
                ),
                onChanged: (value) {
                  setState(() {
                    this._amount = value;
                  });
                },
              ),
              SizedBox(
                height: 16,
              ),
              PhoneInput(
                onChange: (value) {
                  print(value);
                  setState(() {
                    this._phone = value;
                  });
                },
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: RaisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: RaisedButton(
                      child: Text("Send"),
                      onPressed: (_amount != null && _phone != null)
                          ? (() {
                              CBEBirr cbeBirr = CBEBirr("6776");
                              cbeBirr.sendMoney(_amount, _phone);

                              Navigator.of(context).pop();
                            })
                          : null,
                    ),
                  ),
                ),
              ]),
            ],
          )),
    );
  }
}
