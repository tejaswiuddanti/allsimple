import 'package:flutter/material.dart';
class HomeText extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   
    return HomeState();
  }
}

class HomeState extends State<HomeText>{
    GlobalKey<FormState> _formKey = GlobalKey();
  bool showTooltip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 100,
          vertical: 100
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                overflow: Overflow.visible,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      // suffixIcon: IconButton(
                      //   icon: Icon(Icons.error, color: Colors.red,),
                      //   onPressed: () {
                      //     setState(() {
                      //       showTooltip = !showTooltip;
                      //     });
                      //   },
                      // ),
                      hintText: "Password"
                    ),
                    validator: (value) {
                      if(value.isEmpty) {
                        setState(() {
                          showTooltip = true;
                        });
                        return "";
                      }
                    },
                  ),
                  Positioned(
                    top: 50,
                    right: 10,
                    //You can use your own custom tooltip widget over here in place of below Container
                    child: showTooltip
                    ? Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all( color: Colors.red, width: 2.0 ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          "Your passwords must match and be 6 characters long.",
                        ),
                      ),
                    ) : Container(),
                  )
                ],
              ),
              RaisedButton(
                child: Text("Validate"),
                onPressed: () {
                  _formKey.currentState.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
