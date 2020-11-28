import 'package:default_app/app/components/drawer/drawer_widget.dart';
import 'package:default_app/app/components/responsive/responsive.dart';
import 'package:default_app/app/modules/home/home_controller.dart';
import 'package:default_app/app/modules/home/subroutes/contact/contact_page.dart';
import 'package:default_app/app/modules/home/subroutes/initial/initial_page.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0, categoryIndex = 0, menuIndex = 0;

  List<dynamic> menuItems;
  List<dynamic> pages = List();

  var controller = HomeController();

  @override
  void initState() {
    super.initState();
    //controller.teste();
    menuItems = [
      {
        'value': 'Home',
        'page': InitialPage(),
      },
      {
        'value': 'Planos',
        'page': ContactPage(),
      },
      {
        'value': 'Sobre',
        'page': ContactPage(),
      },
      {
        'value': 'Funcionalidades',
        'page': ContactPage(),
      },
      {
        'value': 'Parceiros',
        'page': ContactPage(),
      },
      {
        'value': 'Contato',
        'page': ContactPage(),
      },
      {
        'value': 'Login',
        'action': () => Get.toNamed('company'),
      }
    ];
    generatePageList(menuItems);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MediaQuery.of(context).size.width < 990 ? null : Container(),
        title: MediaQuery.of(context).size.width < 990
            ? GestureDetector(
                child: Text(APP_NAME),
                onTap: () {
                  setState(() {
                    selectedPage = 0;
                    categoryIndex = 0;
                    menuIndex = 0;
                  });
                },
              )
            : Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        child: Text(APP_NAME),
                        onTap: () {
                          MediaQuery.of(context).size.width < 990
                              ? Navigator.pop(context)
                              : null;
                          setState(() {
                            selectedPage = 0;
                            categoryIndex = 0;
                            menuIndex = 0;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: menuItems.asMap().entries.map((e) {
                        return FlatButton(
                          child: Text(
                            e.value['value'],
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            if (e.value['action'] == null) {
                              MediaQuery.of(context).size.width < 990
                                  ? Navigator.pop(context)
                                  : null;
                              setState(() {
                                selectedPage = e.value['index'];
                                categoryIndex = e.key;
                                menuIndex = 0;
                              });
                            } else {
                              MediaQuery.of(context).size.width < 990
                                  ? Navigator.pop(context)
                                  : null;
                              e.value['action'].call();
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
      ),
      drawer: Responsive(child: drawer()),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: pages[selectedPage],
      ),
    );
  }

  Widget drawer() {
    return DrawerWidget(
      selectedPageIndex: selectedPage,
      categoryIndex: categoryIndex,
      menuIndex: menuIndex,
      hasHeader: false,
      drawerItems: menuItems,
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
