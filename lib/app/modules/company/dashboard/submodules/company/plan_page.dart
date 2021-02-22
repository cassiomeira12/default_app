import 'package:default_app/app/components/buttons/primary_button.dart';
import 'package:default_app/app/styles/font_style.dart';
import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Container(
              width: 300,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Assinatura - Gratuito',
                    style: fontSubtitle(context),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text('Status:', style: fontTitle(context, size: 20)),
                      SizedBox(width: 10),
                      Text('Ativo', style: fontMessage(context)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('Data inicio:', style: fontTitle(context, size: 20)),
                      SizedBox(width: 10),
                      Text('07/06/2020', style: fontMessage(context)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('Data vencimento:',
                          style: fontTitle(context, size: 20)),
                      SizedBox(width: 10),
                      Text('07/06/2020', style: fontMessage(context)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('Disconto:', style: fontTitle(context, size: 20)),
                      SizedBox(width: 10),
                      Text('10%', style: fontMessage(context)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('Preço R\$:', style: fontTitle(context, size: 20)),
                      SizedBox(width: 10),
                      Text('0,00', style: fontMessage(context)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Descrição do plano',
                    style: fontMessage(context, size: 20),
                  ),
                  SizedBox(height: 15),
                  PrimaryButton(
                    text: "Cancelar",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
