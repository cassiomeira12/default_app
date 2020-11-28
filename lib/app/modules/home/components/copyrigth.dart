import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';

class CopyRigth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.grey[300],
      padding: EdgeInsets.only(left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MediaQuery.of(context).size.width < 700
              ? Container()
              : Text(
                  '© Copyright ${APP_NAME}. Todos os direitos reservados. ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black45,
                  ),
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
//          MediaQuery.of(context).size.width < 700
//              ? Container()
//              : Row(
//                  children: [
//                    Container(
//                      width: 50,
//                      height: 50,
//                      margin: EdgeInsets.only(right: 10),
//                      color: Colors.blue,
//                    ),
//                    Container(
//                      width: 50,
//                      height: 50,
//                      margin: EdgeInsets.only(right: 10),
//                      color: Colors.blue,
//                    ),
//                    Container(
//                      width: 50,
//                      height: 50,
//                      margin: EdgeInsets.only(right: 10),
//                      color: Colors.blue,
//                    ),
//                  ],
//                ),
//          MediaQuery.of(context).size.width < 700
//              ? Container()
//              : Container(
//                  margin: EdgeInsets.all(20),
//                  width: MediaQuery.of(context).size.width,
//                  height: 350,
//                  decoration: BoxDecoration(
//                    image: DecorationImage(
//                      fit: BoxFit.fitHeight,
//                      image: NetworkImage(
//                          'https://divihacks.com/wp-content/uploads/2018/02/Screen-Shot-2018-02-10-at-2.44.11-PM.png'),
//                    ),
//                  ),
//                ),
        ],
      ),
    );
  }
}
