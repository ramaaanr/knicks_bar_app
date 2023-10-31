import 'package:flutter/material.dart';
import 'package:knicks_bar_app/main_screen.dart';
import 'package:knicks_bar_app/catalogue_screen.dart';

class TabHomeScreen extends StatelessWidget {
  const TabHomeScreen({Key? key}) : super(key: key);
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
            padding: const EdgeInsets.only(left: 64, right: 64, bottom: 24),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Selamat Datang Di KNICKS BAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'DelaGothic',
                      fontSize: 48,
                      color: Colors.white),
                ),
                const Text(
                  'Kenyamanan dan Gaya di Pergelangan Kaki Anda',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.white),
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
                    child: const Text(
                      'View Product',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
