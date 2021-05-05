import 'package:flutter/material.dart';
import 'components/body.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
