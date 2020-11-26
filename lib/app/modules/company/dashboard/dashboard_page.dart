import 'package:default_app/app/components/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/strings/strings.dart';
import 'submodules/history/history_page.dart';
import 'submodules/notifications/notifications_page.dart';
import 'submodules/orders/orders_page.dart';
import 'submodules/settings/settings_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPage = 0, categoryIndex = 0, menuIndex = 0;

  List<dynamic> drawerItems;
  List<dynamic> pages = List();

  String userName;

  @override
  void initState() {
    super.initState();
    drawerItems = [
      {
        'value': 'Pedidos',
        'icon': Icons.dashboard,
        'page': OrdersPage(),
        'menus': [
          {
            'value': 'Pedidos 2',
            'page': SettingsPage(),
          },
        ],
      },
      {
        'value': 'Relatórios',
        'icon': Icons.pages,
        'page': HistoryPage(),
        'menus': [
          {
            'value': 'Relatório 2',
            'page': NotificationsPage(),
          },
          {
            'value': 'Relatório semanal asdfas dfasd fasdfasdf asdfa',
            'page': NotificationsPage(),
          },
          {
            'value': 'Relatório mensal',
            'page': NotificationsPage(),
          },
        ],
      },
      {
        'value': 'Notificações',
        'icon': Icons.notifications,
        'page': NotificationsPage(),
      },
      {
        'value': 'Cardápio',
        'icon': Icons.shopping_cart,
        'page': NotificationsPage(),
      },
      {
        'value': 'Configurações',
        'icon': Icons.settings,
        'page': SettingsPage(),
      },
    ];
    generatePageList(drawerItems);
    teste();
  }

  generatePageList(List<dynamic> drawerItems) async {
    int index = 0;
    for (var item in drawerItems) {
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

  teste() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() => userName = 'cassio');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MediaQuery.of(context).size.width > 990 ? drawer() : Container(),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                title: Text(
                  "${drawerItems[categoryIndex]['menus'] == null || menuIndex == 0 ? drawerItems[categoryIndex]['value'] : List.from(drawerItems[categoryIndex]['menus'])[menuIndex - 1]['value']}",
                ),
                leading: MediaQuery.of(context).size.width > 990
                    ? Container()
                    : null,
                actions: [
                  MaterialButton(
                    child: Text(
                      CLOSE,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              drawer: MediaQuery.of(context).size.width < 990 ? drawer() : null,
              body: pages[selectedPage],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawer() {
    return DrawerWidget(
      selectedPageIndex: selectedPage,
      categoryIndex: categoryIndex,
      menuIndex: menuIndex,
      hasHeader: true,
      drawerItems: drawerItems,
      avatarName: userName,
      onChanged: (data) {
        setState(() {
          selectedPage = data['page'];
          categoryIndex = data['category'];
          menuIndex = data['menu'];
        });
      },
    );
  }
}
