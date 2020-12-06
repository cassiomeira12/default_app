import 'package:default_app/app/components/buttons/danger_button.dart';
import 'package:default_app/app/components/shapes/shape_round.dart';
import 'package:default_app/app/style/font_style.dart';
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
          ShapeRound(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Assinatura - Gratuito',
                    style: fontSubtitle(context),
                  ),
                  Row(
                    children: [
                      Text(
                        'Status:',
                        style: fontMessage(context),
                      ),
                      Text(
                        'Ativo',
                        style: fontMessage(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Data inicio:',
                        style: fontMessage(context),
                      ),
                      Text(
                        '07/06/2020',
                        style: fontMessage(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Data vencimento:',
                        style: fontMessage(context),
                      ),
                      Text(
                        '07/06/2020',
                        style: fontMessage(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Disconto:',
                        style: fontMessage(context),
                      ),
                      Text(
                        '10%',
                        style: fontMessage(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Preço R\$:',
                        style: fontMessage(context),
                      ),
                      Text(
                        '0,00',
                        style: fontMessage(context),
                      ),
                    ],
                  ),
                  Text(
                    'Descrição do plano',
                    style: fontMessage(context, size: 17),
                  ),
                  DangerButton(
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
