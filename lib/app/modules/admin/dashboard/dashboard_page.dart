import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/components/drawer/drawer_widget.dart';
import 'package:default_app/app/components/responsive/responsive.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_controller.dart';
import 'submodules/companies/companies_page.dart';
import 'submodules/companies/new_company_page.dart';
import 'submodules/notifications/notifications_page.dart';
import 'submodules/report/report_page.dart';
import 'submodules/settings/payment_types_page.dart';
import 'submodules/settings/settings_page.dart';
import 'submodules/settings/version_app_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPage = 0, categoryIndex = 0, menuIndex = 0;

  List<dynamic> drawerItems;
  List<dynamic> pages = List();

  String userName, avatarURL;

  var controller = DashBoardController();

  @override
  void initState() {
    super.initState();
    drawerItems = [
      {
        'value': 'Estabelecimentos',
        'icon': Icons.dashboard,
        'page': CompaniesPage(),
        'menus': [
          {
            'value': 'Cadastrar Estabelecimento',
            'page': NewCompanyPage(),
          }
        ],
      },
      {
        'value': 'Relatórios',
        'icon': Icons.pages,
        'page': ReportPage(),
        'menus': [
          {
            'value': 'Relatório semanal',
            'page': ReportPage(),
          },
          {
            'value': 'Relatório mensal',
            'page': ReportPage(),
          },
        ],
      },
      {
        'value': 'Notificações',
        'icon': Icons.notifications,
        'page': NotificationsPage(),
        'menus': [
          {
            'value': 'Todas notificações',
            'page': NotificationsPage(),
          }
        ],
      },
      {
        'value': 'Cadastros',
        'icon': Icons.add,
        'menus': [
          {
            'value': 'Pais',
            'page': NotificationsPage(),
          },
          {
            'value': 'Estados',
            'page': NotificationsPage(),
          },
          {
            'value': 'Cidades',
            'page': NotificationsPage(),
          },
          {
            'value': 'Distritos',
            'page': NotificationsPage(),
          },
        ],
      },
      {
        'value': 'Tema',
        'icon': Icons.brightness_medium,
        'action': () {
          showConfirmationDialog(
            context: context,
            barrierDismissible: false,
            title: "Escolha um tema",
            cancelLabel: "Cancelar",
            okLabel: "OK",
            actions: [
              AlertDialogAction(
                key: ThemeMode.system,
                label: "Automático",
                isDefaultAction: true,
              ),
              AlertDialogAction(
                key: ThemeMode.light,
                label: "Claro",
              ),
              AlertDialogAction(
                key: ThemeMode.dark,
                label: "Escuro",
              ),
            ],
          ).then((value) async {
            if (value != null) {
              var pref = await SharedPreferences.getInstance();
              pref.setInt("theme", ThemeMode.values.indexOf(value));
              Get.changeThemeMode(value);
            }
          });
        }
      },
      {
        'value': 'Configurações',
        'icon': Icons.settings,
        'page': SettingsPage(),
        'menus': [
          {
            'value': 'Aplicativos',
            'page': VersionAppPage(),
          },
          {
            'value': 'Endereço do estabelecimento',
            'page': NotificationsPage(),
          },
          {
            'value': 'Telefone de contato',
            'page': PaymentTypesPage(),
          },
          {
            'value': 'Formas de delivery',
            'page': NotificationsPage(),
          },
          {
            'value': 'Formas de pagamento',
            'page': PaymentTypesPage(),
          },
        ],
      },
    ];
  }

  userData() async {
    var user = await controller.currentUser();
    if (user != null) {
      setState(() {
        userName = user['name'];
        avatarURL = user['avatarURL'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Responsive(child: Container(), other: drawer()),
          Expanded(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                leading: MediaQuery.of(context).size.width < 990
                    ? null
                    : Container(),
                title: Text(
                  drawerItems[categoryIndex]['menus'] == null || menuIndex == 0
                      ? drawerItems[categoryIndex]['page'] == null
                          ? List.from(drawerItems[categoryIndex]['menus'])[
                              menuIndex]['value']
                          : drawerItems[categoryIndex]['value']
                      : drawerItems[categoryIndex]['page'] == null
                          ? List.from(drawerItems[categoryIndex]['menus'])[
                              menuIndex]['value']
                          : List.from(drawerItems[categoryIndex]['menus'])[
                              menuIndex - 1]['value'],
                  overflow: TextOverflow.fade,
                ),
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
                    onPressed: () => controller.signOut(context),
                  ),
                ],
              ),
              drawer: Responsive(child: drawer()),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: pages[selectedPage],
              ),
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
      pages: pages,
      drawerItems: drawerItems,
      avatarName: userName,
      avatarURL: avatarURL,
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
