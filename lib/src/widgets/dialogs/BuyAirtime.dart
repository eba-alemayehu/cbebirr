import "package:flutter/material.dart";
import "../PhoneInput.dart";
import "../../utils/CBEBirr.dart";

class BuyAirtimeDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuyAirtimeDialog();
  }
}

class _BuyAirtimeDialog extends State<BuyAirtimeDialog> {
  bool _isForOther = false;
  String _amount;
  String _phone;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
          height: (_isForOther) ? 360 : 300,
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
              (_isForOther)
                  ? PhoneInput(
                      onChange: (value) {
                        print(value);
                        setState(() {
                          this._phone = value;
                        });
                      },
                    )
                  : FlatButton(
                      child: Text("For other"),
                      onPressed: () {
                        setState(() {
                          _isForOther = true;
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
                      onPressed: (_amount != null && (_phone != null || !_isForOther))
                          ? (() {
                              CBEBirr cbeBirr = CBEBirr("6776");
                              if (_isForOther) {
                                cbeBirr.buyAirtimeOthers(_amount, _phone);
                              } else {
                                cbeBirr.buyAirtime(_amount);
                              }
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
