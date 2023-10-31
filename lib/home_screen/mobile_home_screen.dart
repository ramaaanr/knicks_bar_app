import 'package:flutter/material.dart';
import 'package:knicks_bar_app/catalogue_screen.dart';
import 'package:knicks_bar_app/main_screen.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({Key? key}) : super(key: key);
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
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/home-screen.jpg",
                ),
                fit: BoxFit.cover),
          )),
          Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 64, 64, 64),
                  Color.fromARGB(127, 64, 64, 64),
                  Color.fromARGB(255, 34, 34, 34),
                ]),
          )),
          Container(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Selamat Datang Di KNICKS BAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'DelaGothic',
                      fontSize: 32,
                      color: Colors.white),
                ),
                const Text(
                  'Kenyamanan dan Gaya di Pergelangan Kaki Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          34, 34, 34, 0), // Warna latar belakang kustom
                      foregroundColor: Colors.white, // Warna teks kustom
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(4), // Bentuk tombol kustom
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CatalogueScreen();
                      }));
                    },
                    child: const Text('View Product')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
