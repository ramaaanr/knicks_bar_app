import 'package:flutter/material.dart';
import 'package:knicks_bar_app/catalogue_screen.dart';
import 'package:knicks_bar_app/main_screen.dart';
import 'package:knicks_bar_app/detail_screen.dart';
import 'package:knicks_bar_app/model/shoes_catalogue.dart';

class MobileScreen extends StatelessWidget {
  MobileScreen({Key? key}) : super(key: key);

  String truncateAndAddEllipsis(String input) {
    int maxChar = 30;
    if (input.length <= maxChar) {
      return input;
    } else {
      return input.substring(0, maxChar) + '...';
    }
  }

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Text(
                  'Our Catalogue',
                  style: TextStyle(fontSize: 24, fontFamily: 'DelaGothic'),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: shoesCatalogue.map((shoe) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(shoe: shoe);
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              shoe.imageUrl[0],
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )),
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              shoe.brandName,
                              style: TextStyle(
                                  color: Color.fromARGB(144, 66, 66, 66)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              truncateAndAddEllipsis(shoe.name),
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 4),
                            child: Text(
                              shoe.price,
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
