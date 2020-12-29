import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:default_app/app/components/buttons/light_button.dart';
import 'package:default_app/app/components/generate_form/generate_form.dart';
import 'package:default_app/app/modules/admin/dashboard/components/card_page/card_page.dart';
import 'package:default_app/app/shared/repositories/parse/parse_state_service.dart';
import 'package:default_app/app/style/font_style.dart';
import 'package:default_app/app/utils/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'Id',
      field: 'objectId',
      type: PlutoColumnType.text(readOnly: true),
    ),
    PlutoColumn(
      title: 'Nome',
      field: 'name',
      type: PlutoColumnType.text(readOnly: true),
    ),
    PlutoColumn(
      title: 'Código',
      field: 'code',
      type: PlutoColumnType.text(readOnly: true),
    ),
    PlutoColumn(
      title: 'País',
      field: 'country',
      type: PlutoColumnType.text(readOnly: true),
    ),
    // PlutoColumn(
    //   title: 'Criado',
    //   field: 'createdAt',
    //   type: PlutoColumnType.date(readOnly: true, format: 'dd/MM/yyyy'),
    // ),
    // PlutoColumn(
    //   title: 'Atualizado',
    //   field: 'updatedAt',
    //   type: PlutoColumnType.date(readOnly: true, format: 'dd/MM/yyyy'),
    // ),
  ];

  PlutoStateManager stateManager;
  List<PlutoRow> rows = [];
  bool loading = true, createOrUpdate = false, creatingNew = false;

  var service = Get.put(ParseStateService());
  List result;
  dynamic itemSelected;

  @override
  void initState() {
    super.initState();
    list();
  }

  list() async {
    setState(() => loading = true);
    rows.clear();
    result = await service.list();
    print(result);
    List<PlutoRow> temp = result.map((item) {
      Map<String, PlutoCell> cells = {};
      columns.forEach((column) {
        cells[column.field] = PlutoCell(value: item[column.field]);
      });
      return PlutoRow(cells: cells);
    }).toList();
    setState(() {
      rows.addAll(temp);
      loading = false;
    });
  }

  void _addRow() {
    stateManager.clearCurrentRowIdx();
    stateManager.clearCurrentCell();
    setState(() => createOrUpdate = true);
  }

  void _editRow() {
    var index;
    try {
      index = stateManager.currentCellPosition.rowIdx;
    } catch (error) {
      return;
    }
    setState(() {
      itemSelected = result[index];
    });
    setState(() => createOrUpdate = true);
  }

  void _removeRow() {
    var index;
    try {
      index = stateManager.currentCellPosition.rowIdx;
    } catch (error) {
      return;
    }
    showOkCancelAlertDialog(
      context: context,
      title: REMOVE,
      okLabel: OK,
      cancelLabel: CANCEL,
      message: "Deseja remover o item selecionado ?",
    ).then((value) {
      if (OkCancelResult.ok == value) {
        service.delete(result[index]).then((value) {
          stateManager?.removeCurrentRow();
          Get.showSnackbar(GetBar(
            message: "Excluído com sucesso!",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ));
        }).catchError((error) {
          Get.showSnackbar(GetBar(
            message: "${error.toString()}",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ));
        });
      } else {
        stateManager.clearCurrentRowIdx();
        stateManager.clearCurrentCell();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          createOrUpdate ? formItem() : dataGrid(),
        ],
      ),
    );
  }

  Widget formItem() {
    var formData = {'fields': []};
    columns.forEach((element) {
      if (element.field != 'objectId' &&
          element.field != 'createdAt' &&
          element.field != 'updatedAt') {
        formData['fields'].add(
          {
            "title": "${element.title}",
            "field": "${element.field}",
            "initial":
                itemSelected == null ? null : "${itemSelected[element.field]}",
            "type": "textField",
          },
        );
      }
    });
    formData['fields'].add({
      "type": "button",
      "title": SAVE,
      "validateRequired": true,
      "action": (Map<String, dynamic> result) async {
        setState(() => creatingNew = true);
        if (itemSelected == null) {
          service.create(result).then((value) {
            setState(() {
              createOrUpdate = false;
            });
            list();
            Get.showSnackbar(GetBar(
              message: "Salvo com sucesso!",
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ));
          }).catchError((error) {
            Get.showSnackbar(GetBar(
              message: "${error.toString()}",
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ));
          }).whenComplete(() => setState(() => creatingNew = false));
        } else {
          result['objectId'] = itemSelected['objectId'];
          service.update(result).then((value) {
            setState(() {
              createOrUpdate = false;
              itemSelected = null;
            });
            list();
            Get.showSnackbar(GetBar(
              message: "Atualizado com sucesso!",
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ));
          }).catchError((error) {
            Get.showSnackbar(GetBar(
              message: "${error.toString()}",
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ));
          }).whenComplete(() => setState(() => creatingNew = false));
        }
      },
    });
    return CardPage(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CANCEL,
                  style: fontTitle(context),
                ),
                LightButton(
                  text: CANCEL,
                  onPressed: () {
                    setState(() {
                      createOrUpdate = false;
                      itemSelected = null;
                    });
                  },
                ),
              ],
            ),
          ),
          creatingNew
              ? CircularProgressIndicator()
              : GenerateForm(data: formData),
        ],
      ),
    );
  }

  Widget dataGrid() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LightButton(
                text: ADD,
                onPressed: () => _addRow(),
              ),
              SizedBox(width: 10),
              LightButton(
                text: EDIT,
                onPressed: () => _editRow(),
              ),
              SizedBox(width: 10),
              LightButton(
                text: REMOVE,
                onPressed: () => _removeRow(),
              ),
            ],
          ),
        ),
        loading
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height / 4.5,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: PlutoGrid(
                  columns: columns,
                  rows: rows,
                  onChanged: (PlutoOnChangedEvent event) {},
                  onLoaded: (PlutoOnLoadedEvent event) {
                    stateManager = event.stateManager;
                  },
                ),
              ),
      ],
    );
  }
}
