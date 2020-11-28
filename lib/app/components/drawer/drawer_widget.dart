import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  int selectedPageIndex;
  int categoryIndex;
  int menuIndex;
  final bool hasHeader;
  final String avatarURL;
  final String avatarName;
  final List<dynamic> drawerItems;
  final ValueChanged<dynamic> onChanged;

  DrawerWidget({
    this.selectedPageIndex,
    this.categoryIndex,
    this.menuIndex,
    this.hasHeader = false,
    this.avatarURL,
    this.avatarName,
    @required this.drawerItems,
    @required this.onChanged,
  }) : assert(drawerItems != null);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        elevation: 2,
        child: ListView(
          children: [
            widget.hasHeader ? drawerHeader() : SizedBox(height: 20),
            Column(
              children: widget.drawerItems.asMap().entries.map((e) {
                return drawerItem(e.key, e.value);
              }).toList(),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 48,
            child: widget.avatarURL == null
                ? Image.asset("images/logo_app.png")
                : Image.network(widget.avatarURL, fit: BoxFit.cover),
          ),
          Text(
            widget.avatarName ?? "",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(int index, dynamic data) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          FlatButton(
            color: widget.categoryIndex == index
                ? Theme.of(context).primaryColorLight
                : Theme.of(context).hintColor.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                child: Row(
                  children: [
                    Visibility(
                      visible: data['icon'] != null,
                      child: Icon(data['icon']),
                    ),
                    SizedBox(width: 8),
                    Flexible(child: Text(data['value'])),
                  ],
                ),
              ),
            ),
            onPressed: () {
              if (data['action'] == null) {
                MediaQuery.of(context).size.width < 990
                    ? Navigator.pop(context)
                    : null;
                var selectedIndex = {
                  'page': data['index'],
                  'category': index,
                  'menu': 0,
                };
                widget.onChanged(selectedIndex);
              } else {
                MediaQuery.of(context).size.width < 990
                    ? Navigator.pop(context)
                    : null;
                data['action'].call();
              }
            },
          ),
          Visibility(
            visible: widget.categoryIndex == index,
            child: data['menus'] == null
                ? Container()
                : Column(
                    children: [
                      drawerMenu(index, 0, data),
                      Column(
                        children: List.from(data['menus'])
                            .asMap()
                            .entries
                            .map((e) => drawerMenu(index, e.key + 1, e.value))
                            .toList(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget drawerMenu(int categoryIndex, int menuIndex, dynamic data) {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      child: FlatButton(
        color: widget.categoryIndex == categoryIndex &&
                widget.menuIndex == menuIndex
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).hintColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 16),
            child: Row(
              children: [
                Flexible(child: Text(data['value'])),
              ],
            ),
          ),
        ),
        onPressed: () {
          if (data['action'] == null) {
            MediaQuery.of(context).size.width < 990
                ? Navigator.pop(context)
                : null;
            var selectedIndex = {
              'page': data['index'],
              'category': categoryIndex,
              'menu': menuIndex,
            };
            widget.onChanged(selectedIndex);
          } else {
            MediaQuery.of(context).size.width < 990
                ? Navigator.pop(context)
                : null;
            data['action'].call();
          }
        },
      ),
    );
  }
}
