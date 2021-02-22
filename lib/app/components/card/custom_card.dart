import 'package:flutter/material.dart';

import '../../styles/font_style.dart';
import '../buttons/primary_button.dart';

class CustomCard extends StatelessWidget {
  final String title, message, url, button;
  final double width, height;
  final VoidCallback action;
  final String actionText;

  CustomCard({
    Key key,
    this.title,
    this.message,
    this.url,
    this.button,
    this.width = 300,
    this.height = 150,
    this.action,
    this.actionText = "Ver mais",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width, minHeight: height),
      child: InkWell(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: url != null
                        ? NetworkImage(url)
                        : AssetImage("assets/images/logo_app.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      '${title}',
                      overflow: TextOverflow.ellipsis,
                      style: fontSubtitle(context, size: 20, bold: true),
                    ),
                    message != null
                        ? Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${message}',
                              textAlign: TextAlign.center,
                              //overflow: TextOverflow.ellipsis,
                              style: fontMessage(context, color: Colors.grey),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: PrimaryButton(
                  text: actionText,
                  onPressed: () => action?.call(),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        onTap: () => action?.call(),
      ),
    );
  }
}
