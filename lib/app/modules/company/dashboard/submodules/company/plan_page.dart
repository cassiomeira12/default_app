import 'package:default_app/app/components/buttons/danger_button.dart';
import 'package:default_app/app/components/shapes/shape_round.dart';
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
                    'Assinatura',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  Row(
                    children: [
                      Text(
                        'Status:',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Text(
                        'Ativo',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ],
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
