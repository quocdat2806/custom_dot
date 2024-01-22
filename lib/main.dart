import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: PageViewCustom(),
  ));
}

class PageViewCustom extends StatefulWidget {
  const PageViewCustom({Key? key}) : super(key: key);

  @override
  State<PageViewCustom> createState() => _PageViewCustomState();
}

class _PageViewCustomState extends State<PageViewCustom> {
  var activePage = 0;

  @override
  Widget build(BuildContext context) {
    var list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final PageController controller = PageController();

    return Container(
      child: Column(
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
                var mapObj = caculatorSize(index, activePage, list.length);
                return dotBuilder(mapObj);
              },
              itemCount: list.length,
            ),
          ),
        ],
      ),
    );
  }
}

Map<String, dynamic> caculatorSize(index, activePage, int lengthTrue) {
  var conditionColor = index == activePage ? Colors.blue : Colors.yellow;
  var conditionSize = index == activePage ? 20.0 : 5.0;

  if (lengthTrue <= 5) {
    return {'size': 20.0, 'color': conditionColor};
  }
  if (0 <= activePage && activePage <= 2 && 0 <= index && index <= 2 ||
      7 <= activePage && activePage <= 9 && 7 <= index && index <= 9) {
    return {'size': 20.0, 'color': conditionColor};
  }
  return {'size': conditionSize, 'color': conditionColor};
}

void handleHideDot(int lengthTrue){



}

Widget dotBuilder(Map<String, dynamic> value) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: value['size'],
    height: value['size'],
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: value['color'],
    ),
  );
}
