import "package:flutter/material.dart";

class PhoneInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PhoneInput();
  }
}

class _PhoneInput extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone Number',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.contact_phone),
        )
      ],
    );
  }
}
