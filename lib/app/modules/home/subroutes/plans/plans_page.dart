import 'package:default_app/app/components/card/custom_card.dart';
import 'package:default_app/app/modules/home/components/copyrigth.dart';
import 'package:flutter/material.dart';

class PlansPage extends StatefulWidget {
  @override
  _PlansPageState createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            //runAlignment: WrapAlignment.spaceAround,
            children: [
              CustomCard(
                title: "Plano Gratuito",
                message: "Plano gratuito, 30 dias de teste",
              ),
              CustomCard(
                title: "Plano Mensal",
                message: "Plano com mensal por apenas R\$: 30,00",
              ),
              CustomCard(
                title: "Plano Semestral",
                message: "Plano com semestral por apenas R\$: 150,00",
              ),
              CustomCard(
                title: "Plano Anual",
                message: "Plano com anual por apenas R\$: 240,00",
              ),
            ],
          ),
          CopyRigth(),
        ],
      ),
    );
  }
}
