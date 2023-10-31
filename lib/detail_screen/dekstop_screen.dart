import 'package:flutter/material.dart';
import 'package:knicks_bar_app/catalogue_screen.dart';
import 'package:knicks_bar_app/main_screen.dart';
import 'package:knicks_bar_app/model/shoes_catalogue.dart';

class DekstopScreen extends StatefulWidget {
  final Shoe shoe;
  const DekstopScreen({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  @override
  _DekstopScreen createState() => _DekstopScreen(shoe: shoe);
}

class _DekstopScreen extends State<DekstopScreen> {
  final Shoe shoe;
  int shoeImageIndex = 0;
  _DekstopScreen({
    required this.shoe,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 244, 244),
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 217, 217, 217)),
          title: const Text(
            'KNICKS BAR',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'DelaGothic',
                color: Color.fromARGB(255, 217, 217, 217)),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const MainScreen();
                  }));
                },
                child: const Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DelaGothic',
                      color: Colors.white),
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CatalogueScreen();
                  }));
                },
                child: const Text(
                  "Catalogue",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'DelaGothic',
                      color: Color.fromARGB(255, 249, 241, 241)),
                )),
            const SizedBox(
              width: 24,
            )
          ],
          backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        ),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: Image(
                          width: 360,
                          image: AssetImage(shoe.imageUrl[shoeImageIndex]))),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image(
                              width: 87, image: AssetImage(shoe.imageUrl[0])),
                        ),
                        onTap: () {
                          setState(() {
                            shoeImageIndex = 0;
                          });
                        },
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image(
                              width: 87, image: AssetImage(shoe.imageUrl[1])),
                        ),
                        onTap: () {
                          setState(() {
                            shoeImageIndex = 1;
                          });
                        },
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image(
                              width: 87, image: AssetImage(shoe.imageUrl[2])),
                        ),
                        onTap: () {
                          setState(() {
                            shoeImageIndex = 2;
                          });
                        },
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          child: Image(
                              width: 87, image: AssetImage(shoe.imageUrl[3])),
                        ),
                        onTap: () {
                          setState(() {
                            shoeImageIndex = 3;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: 600,
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          shoe.price,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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
          ),
        ));
  }
}
