import 'package:default_app/app/style/font_style.dart';
import 'package:default_app/app/utils/date_util.dart';
import 'package:flutter/material.dart';

class VersionAppWidget extends StatefulWidget {
  final data;

  VersionAppWidget({this.data});

  @override
  _VersionAppWidgetState createState() => _VersionAppWidgetState();
}

class _VersionAppWidgetState extends State<VersionAppWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
      elevation: 5,
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleTextWidget(
                  '${widget.data['name']} - ${widget.data['platform']}',
                ),
                dateTextWidget(
                  DateUtil.formatDateCalendar(
                    DateTime.parse(widget.data["updatedAt"]).toLocal(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Text(
                    '${widget.data['package']}', //"order.status.current.name",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.body2,
                  ),
                ),
                dateTextWidget(
                  'Atual: ${widget.data['currentCode']} Min: ${widget.data['minimumCode']}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget titleTextWidget(String text) {
    return Flexible(
      child: Text(
        text,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: fontSubtitle(context, size: 20),
      ),
    );
  }

  Widget dateTextWidget(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: fontSubtitle(context, size: 14),
      ),
    );
  }

  Widget costTextWidget(String text) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontSize: 18, color: Colors.black45, fontWeight: FontWeight.bold),
      ),
    );
  }
}
