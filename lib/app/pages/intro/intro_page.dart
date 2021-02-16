//import 'package:default_app/app/utils/strings/strings.dart';
//import 'package:flutter/material.dart';
//import 'package:intro_slider/intro_slider.dart';
//import 'package:intro_slider/slide_object.dart';
//
//class IntroPage extends StatefulWidget {
//  IntroPage({this.introDoneCallback});
//
//  final VoidCallback introDoneCallback;
//
//  @override
//  _IntroPageState createState() => _IntroPageState();
//}
//
//class _IntroPageState extends State<IntroPage> {
//  List<Slide> slides = List();
//
//  Color colorBegin;
//  Color colorEnd;
//
//  void slidesPage() {
//    colorBegin = Color(0xffFFDAB9);
//    colorEnd = Color(0xff40E0D0);
//    slides.add(slideStart());
//    //slides.add(slide1());
//    slides.add(slide2());
//    slides.add(slide3());
//    slides.add(slideFinish());
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    slidesPage();
//    return IntroSlider(
//      slides: slides,
//      colorSkipBtn: Color(0x33000000),
//      highlightColorSkipBtn: Color(0xff000000),
//      nameSkipBtn: "Pular",
//      renderNextBtn: Icon(
//        Icons.navigate_next,
//        color: Colors.white,
//        size: 35.0,
//      ),
//      colorDoneBtn: Color(0x33000000),
//      highlightColorDoneBtn: Color(0xff000000),
//      renderDoneBtn: Icon(
//        Icons.done,
//        color: Colors.white,
//        size: 35.0,
//      ),
//      colorDot: Color(0x33D02090),
//      colorActiveDot: Theme.of(context).errorColor,
//      onDonePress: widget.introDoneCallback,
//    );
//  }
//
//  Slide slideStart() {
//    return Slide(
//      title: APP_NAME,
//      styleTitle: styleTitle(),
//      description: "Chegou o ${APP_NAME}, sua mais nova forma de pedir comida",
//      styleDescription: styleDescription(),
//      pathImage: "assets/images/logo_app.png",
//      colorBegin: colorBegin,
//      colorEnd: colorEnd,
//      directionColorBegin: Alignment.topLeft,
//      directionColorEnd: Alignment.bottomRight,
//    );
//  }
//
//  Slide slideFinish() {
//    return Slide(
//      //title: "Login",
//      //styleTitle: styleTitle(),
//      description: "Crie sua conta e aproveite todos os recurso do ${APP_NAME}",
//      styleDescription: styleDescription(),
//      pathImage: "assets/images/logo_app.png",
//      colorBegin: colorEnd,
//      colorEnd: colorBegin,
//      directionColorBegin: Alignment.topLeft,
//      directionColorEnd: Alignment.bottomRight,
//    );
//  }
//
//  TextStyle styleTitle() {
//    return TextStyle(
//      fontSize: 30,
//      color: Colors.black45,
//      fontWeight: FontWeight.bold,
//      fontFamily: 'RobotoMono',
//    );
//  }
//
//  TextStyle styleDescription() {
//    return TextStyle(
//      fontSize: 25,
//      color: Colors.black45,
//      fontWeight: FontWeight.bold,
//      fontFamily: 'Raleway',
//    );
//  }
//
//  Slide slide1() {
//    return Slide(
//      title: "Gerenciar",
//      styleTitle: styleTitle(),
//      description: "Chegou o ${APP_NAME}, sua mais nova forma de pedir comida",
//      styleDescription: styleDescription(),
//      pathImage: "assets/images/produto.png",
//      colorBegin: colorBegin,
//      colorEnd: colorEnd,
//      directionColorBegin: Alignment.topRight,
//      directionColorEnd: Alignment.bottomLeft,
//    );
//  }
//
//  Slide slide2() {
//    return Slide(
//      title: "",
//      styleTitle: styleTitle(),
//      description: "Escolha sua cidade e veja os estabelecimentos disponíveis",
//      styleDescription: styleDescription(),
//      pathImage: "assets/images/user_location.png",
//      colorBegin: colorBegin,
//      colorEnd: colorEnd,
//      directionColorBegin: Alignment.topLeft,
//      directionColorEnd: Alignment.bottomRight,
//    );
//  }
//
//  Slide slide3() {
//    return Slide(
//      title: "",
//      styleTitle: styleTitle(),
//      description: "Depois é só fazer seu pedido e aguardar a entrega",
//      styleDescription: styleDescription(),
//      pathImage: "assets/images/delivery.png",
//      colorBegin: colorBegin,
//      colorEnd: colorEnd,
//      directionColorBegin: Alignment.topRight,
//      directionColorEnd: Alignment.bottomLeft,
//    );
//  }
//}
