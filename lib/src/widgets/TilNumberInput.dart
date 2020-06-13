import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:native_contact_picker/native_contact_picker.dart';
import 'package:barcode_scan/barcode_scan.dart';
// import 'package:easy_contact_picker/easy_contact_picker.dart';
// import 'package:contact_picker/contact_picker.dart';

class TilNumber extends StatefulWidget {
  Function onChange;
  TilNumber({this.onChange}) {}
  @override
  State<StatefulWidget> createState() {
    return _TilNumber(onChange: this.onChange);
  }
}

class _TilNumber extends State<TilNumber> {
  Function onChange;
  String value;

  final NativeContactPicker _contactPicker = new NativeContactPicker();
  Contact _contact;
  var textController = new TextEditingController();

  _TilNumber({this.onChange}) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone Number',
            ),
            onChanged: this.onChange,
            controller: textController,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.contact_phone),
                  onPressed: () async {
                    Contact contact = await _contactPicker.selectContact();
                    print(contact.phoneNumber);
                    setState(() {
                      _contact = contact;
                      textController.text = contact.phoneNumber;
                      value = contact.phoneNumber; 
                      this.onChange(value); 
                    });
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () async {
                    var result = await BarcodeScanner.scan();

                    print(result.rawContent); // The barcode content
                    textController.text = result.rawContent;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
