import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../styles/themes/dark_theme.dart';
import '../image_network/image_network_widget.dart';

class DrawerWidget extends StatefulWidget {
  int selectedPageIndex;
  int categoryIndex;
  int menuIndex;
  final bool hasHeader;
  final String avatarURL;
  final String avatarName;
  final List<dynamic> drawerItems;
  final ValueChanged<dynamic> onChanged;
  final List<dynamic> pages;

  DrawerWidget({
    this.selectedPageIndex,
    this.categoryIndex,
    this.menuIndex,
    this.hasHeader = false,
    this.avatarURL,
    this.avatarName,
    @required this.drawerItems,
    @required this.pages,
    @required this.onChanged,
  }) : assert(drawerItems != null) {
    int index = 0;
    for (var item in drawerItems) {
      if (item['page'] == null) {
        pages.add(null);
        item['index'] = index++;
        if (item['menus'] != null) {
          for (var menu in List.from(item['menus'])) {
            pages.add(menu['page']);
            menu['index'] = index++;
          }
        }
      } else {
        pages.add(item['page']);
        item['index'] = index++;
        if (item['menus'] != null) {
          for (var menu in List.from(item['menus'])) {
            pages.add(menu['page']);
            menu['index'] = index++;
          }
        }
      }
    }
  }

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: darkTheme().copyWith(canvasColor: Color(0xFF273443)),
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
      //decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImageNetworkWidget(url: widget.avatarURL, size: 90),
          Text(
            widget.avatarName ?? "Seu nome",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
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
                    Visibility(
                      visible: data['menus'] != null,
                      child: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () {
              if (data['action'] == null) {
                MediaQuery.of(context).size.width < 990 && data['menus'] == null
                    ? Navigator.pop(context)
                    : null;
                var selectedIndex = {
                  'page':
                      data['page'] == null ? data['index'] + 1 : data['index'],
                  'category': index,
                  'menu': 0,
                };
                widget.onChanged(selectedIndex);
              } else {
                MediaQuery.of(context).size.width < 990 && data['menus'] == null
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
                      data['page'] != null
                          ? drawerMenu(index, 0, data)
                          : Container(),
                      Column(
                        children: List.from(data['menus'])
                            .asMap()
                            .entries
                            .map((e) => drawerMenu(
                                index,
                                data['page'] != null ? e.key + 1 : e.key,
                                e.value))
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
      padding: EdgeInsets.only(top: 5, left: 20),
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
                Flexible(
                  child: Text(
                    data['value'],
                    style:
                        darkTheme().textTheme.headline4.copyWith(fontSize: 13),
                  ),
                ),
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
