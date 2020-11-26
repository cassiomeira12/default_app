import 'package:flutter/material.dart';

class CopyRigth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediaQuery.of(context).size.width < 700
              ? Container()
              : CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48,
                  child: Image.asset("assets/images/logo_app.png"),
                ),
          Row(
            children: [
              FlatButton(
                child: Text(
                  "Termos de uso",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  "Privacidade",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Text(
                  "Contato",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          MediaQuery.of(context).size.width < 700
              ? Container()
              : Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.blue,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.blue,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.blue,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
