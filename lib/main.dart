import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PageViewCustom(),
  ));
}

class PageViewCustom extends StatefulWidget {
  PageViewCustom({Key? key}) : super(key: key);

  @override
  State<PageViewCustom> createState() => _PageViewCustomState();
}

class _PageViewCustomState extends State<PageViewCustom> {
  var activePage = 0;
  @override
  Widget build(BuildContext context) {
    var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final PageController controller = PageController();
    return Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                activePage = index;
              });
            },
            controller: controller,
            children: const <Widget>[
              Center(
                child: Text('First Page'),
              ),
              Center(
                child: Text('Second Page'),
              ),
              Center(
                child: Text('Third Page'),
              ),
              Center(
                child: Text('Four Page'),
              ),
              Center(
                child: Text('Five Page'),
              ),
              Center(
                child: Text('Six Page'),
              ),
              Center(
                child: Text('Seven Page'),
              ),
              Center(
                child: Text('Eight Page'),
              ),
              Center(
                child: Text('Night Page'),
              ),
              Center(
                child: Text('Ten Page'),
              ),
            ],
          ),
        ),
        Container(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return dotBuilder(
                  index, activePage == index, activePage, list.length);
            },
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}

Widget dotBuilder(index, isActive, activePage, lengthList) {
  double heightCus = 5;
  double widthCus = 5;
  var color = Colors.yellow;
  if(lengthList==5){
    widthCus = 20;
    heightCus = 20;
  }else{
    if(0 >= activePage && activePage <=2 ){
      if(index>2){
        widthCus = 5;
        heightCus = 5;
      }else{
        widthCus = 20;
        heightCus = 20;
      }

    }
    if(3>=activePage && activePage<= 6){
     widthCus = 5;
     heightCus = 5;
    }
    if(7 >= activePage && activePage <=9 ){
      if(index<7){
        widthCus = 5;
        heightCus = 5;
      }else{
        widthCus = 20;
        heightCus = 20;
      }

    }

  }
  if(isActive ){
    widthCus = 20;
    heightCus = 20;
    color = Colors.blue;
  }
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: heightCus,
    height: widthCus,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
  );
}
