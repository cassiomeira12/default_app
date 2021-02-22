import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/components/drawer/drawer_widget.dart';
import 'package:default_app/app/components/responsive/responsive.dart';
import 'package:default_app/app/shared/repositories/auth_service.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard_controller.dart';
import 'submodules/company/company_page.dart';
import 'submodules/company/plan_page.dart';
import 'submodules/menus/menus_page.dart';
import 'submodules/notifications/notifications_page.dart';
import 'submodules/orders/orders_page.dart';
import 'submodules/report/report_page.dart';
import 'submodules/settings/settings_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedPage = 0, categoryIndex = 0, menuIndex = 0;

  List<dynamic> drawerItems;
  List<dynamic> pages = [];

  var auth = Get.find<AuthService>();
  var controller = Get.find<DashBoardController>();

  @override
  void initState() {
    super.initState();
    drawerItems = [
      {
        'value': 'Dashboard',
        'icon': Icons.dashboard,
        'page': CompanyPage(),
      },
      {
        'value': 'Meu estabelecimento',
        'icon': Icons.dashboard,
        //'page': CompanyPage(),
        'menus': [
          // {
          //   'value': 'Financeiro',
          //   'page': FinancialPage(),
          // },
          {
            'value': 'Meu plano',
            'page': PlanPage(),
          },
        ],
      },
      {
        'value': 'Pedidos',
        'icon': Icons.dashboard,
        'page': OrdersPage(),
      },
      {
        'value': 'Relatórios',
        'icon': Icons.insert_chart_outlined_sharp,
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
        // 'menus': [
        //   {
        //     'value': 'Todas notificações',
        //     'page': NotificationsPage(),
        //   }
        // ],
      },
      {
        'value': 'Cardápio',
        'icon': Icons.shopping_cart,
        'page': MenusPage(),
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
          // {
          //   'value': 'Horários de funcionamento',
          //   'page': OpeningHourPage(),
          // },
          // {
          //   'value': 'Endereço do estabelecimento',
          //   'page': NotificationsPage(),
          // },
          // {
          //   'value': 'Telefone de contato',
          //   'page': PaymentTypesPage(),
          // },
          // {
          //   'value': 'Formas de delivery',
          //   'page': NotificationsPage(),
          // },
          // {
          //   'value': 'Formas de pagamento',
          //   'page': PaymentTypesPage(),
          // },
        ],
      },
    ];
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
                      ? drawerItems[categoryIndex]['value']
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
      drawerItems: drawerItems,
      pages: pages,
      avatarName: auth.getUser().name,
      avatarURL: auth.getUser().avatarURL,
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
