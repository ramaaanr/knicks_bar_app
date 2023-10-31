import 'package:flutter/material.dart';
import 'package:knicks_bar_app/catalogue_screen.dart';
import 'package:knicks_bar_app/main_screen.dart';
import 'package:knicks_bar_app/model/shoes_catalogue.dart';

class MobileScreen extends StatefulWidget {
  final Shoe shoe;
  const MobileScreen({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  _MobileScreen createState() => _MobileScreen(shoe: shoe);
}

class _MobileScreen extends State<MobileScreen> {
  final Shoe shoe;
  int shoeImageIndex = 0;
  _MobileScreen({
    required this.shoe,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 217, 217, 217)),
        title: const Text(
          'KNICKS BAR',
          style: TextStyle(
              fontFamily: 'DelaGothic',
              color: Color.fromARGB(255, 217, 217, 217)),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainScreen();
                }));
              },
            ),
            ListTile(
              title: const Text('Catalogue'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CatalogueScreen();
                }));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            double containerSize = constraints.maxWidth;
            return Container(
              width: containerSize,
              height: containerSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(shoe.imageUrl[shoeImageIndex])),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 40),
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              shoeImageIndex = 0;
                            });
                          },
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                                color: shoeImageIndex == 0
                                    ? Color.fromARGB(255, 66, 66, 66)
                                    : Color.fromARGB(144, 66, 66, 66),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        )),
                        const SizedBox(width: 4),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              shoeImageIndex = 1;
                            });
                          },
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                                color: shoeImageIndex == 1
                                    ? Color.fromARGB(255, 66, 66, 66)
                                    : Color.fromARGB(144, 66, 66, 66),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        )),
                        const SizedBox(width: 4),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              shoeImageIndex = 2;
                            });
                          },
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                                color: shoeImageIndex == 2
                                    ? Color.fromARGB(255, 66, 66, 66)
                                    : Color.fromARGB(144, 66, 66, 66),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        )),
                        const SizedBox(width: 4),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              shoeImageIndex = 3;
                            });
                          },
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                                color: shoeImageIndex == 3
                                    ? Color.fromARGB(255, 66, 66, 66)
                                    : Color.fromARGB(144, 66, 66, 66),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                        )),
                        const SizedBox(width: 4),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.brandName,
                  style: TextStyle(color: Color.fromARGB(255, 66, 66, 66)),
                ),
                Text(
                  shoe.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      shoe.price,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                    Expanded(child: Text(shoe.storePlace)),
                  ],
                ),
                const Text(
                  "Size available",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: shoe.sizeList
                      .map((size) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            margin: EdgeInsets.only(right: 4),
                            child: Text(
                              size.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 66, 66, 66),
                                borderRadius: BorderRadius.circular(6)),
                          ))
                      .toList(),
                ),
                SizedBox(
                  height: 8,
                ),
                const Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  shoe.description,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
