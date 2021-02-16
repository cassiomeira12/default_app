import 'package:flutter/material.dart';

class StarsWidget extends StatefulWidget {
  final int initialStar;
  final int maxStarts;
  final double size;
  final ValueChanged<int> onChanged;

  StarsWidget({
    this.initialStar = 0,
    this.maxStarts = 5,
    this.size = 20,
    this.onChanged,
  }) : assert(initialStar <= maxStarts);

  @override
  _StarsWidgetState createState() => _StarsWidgetState();
}

class _StarsWidgetState extends State<StarsWidget> {
  int star;
  int starBorder;
  List<Widget> listaEstrelas = List();

  @override
  void initState() {
    super.initState();
    star = widget.initialStar;
    buildStarList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: listaEstrelas,
    );
  }

  void buildStarList() {
    starBorder = widget.maxStarts - widget.initialStar;
    listaEstrelas.clear();
    setState(() {
      for (int i = 1; i <= widget.maxStarts; i++) {
        listaEstrelas.add(startItem(i));
      }
    });
  }

  Widget startItem(int index) {
    return GestureDetector(
      child: Icon(
        index <= star ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: widget.size,
      ),
      onTap: () {
        if (widget.onChanged != null) {
          setState(() {
            star = index;
            buildStarList();
            widget.onChanged(star);
          });
        }
      },
    );
  }

}
