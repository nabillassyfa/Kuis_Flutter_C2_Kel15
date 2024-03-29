// import package
import 'package:flutter/material.dart';
import 'beranda.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key});
  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Membuat gambar bagian atas
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/gambar.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,

                // Menambahkan search Box
                child: Padding(
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Cari Barang di Toko",
                              hintStyle: TextStyle(color: Colors.grey.shade600),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade600,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              contentPadding: EdgeInsets.all(8),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Menambahkan Icon
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 20),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.message_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),   // spasi untuk kebagian berikutnya

              // Membuat Nama 
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hallo, Budi!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Membuat icon dalam box
                    Container(
                      padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.brown,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.wallet, size: 30, color: Colors.brown),
                            SizedBox(width: 5),
                            Text(
                              "Store\ncredit\nRp 0.",
                              style: TextStyle(color: Colors.brown, fontSize: 11),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.brown,
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.loyalty, size: 30, color: Colors.brown),
                            SizedBox(width: 5),
                            Text(
                              "Reward\nPoint\n100 Point.",
                              style: TextStyle(color: Colors.brown, fontSize: 11),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.brown,
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.confirmation_number_outlined, size: 30, color: Colors.brown),
                            SizedBox(width: 5),
                            Text(
                              "Kupon\nSaya\n11 kupon.",
                              style: TextStyle(color: Colors.brown, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.only(top: 16, left: 20, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.storefront_outlined, size: 40),
                              Text("Official Store", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.local_fire_department_sharp, color: Colors.red, size: 40),
                              Text("Hot Deal", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.checkroom, size: 40),
                              Text("Shopping", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.face_retouching_natural_outlined, size: 40),
                              Text("Kosmetik", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Load gambar menggunakan carouse
                    SizedBox(height: 50),
                    Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [
                          Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("assets/image/itali.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("assets/image/pemandangan.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
