import 'package:default_app/app/style/font_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CardTeam extends StatelessWidget {
  final String title, message, url;
  final double width, height;
  final String facebook, instagram, linkedin;
  List _sociealMedias;

  CardTeam({
    Key key,
    this.title,
    this.message,
    this.url,
    this.width = 300,
    this.height = 150,
    this.facebook,
    this.instagram,
    this.linkedin,
  }) {
    _sociealMedias = [
      {
        'icon': FontAwesomeIcons.facebook,
        'url': facebook,
      },
      {
        'icon': FontAwesomeIcons.instagram,
        'url': instagram,
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': linkedin,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width, minHeight: height),
      child: Container(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _sociealMedias.map((e) {
                if (e['url'] == null) {
                  return Container();
                }
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    child: FaIcon(
                      e['icon'],
                    ),
                    onTap: () => callLink(e['url']),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  callLink(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
