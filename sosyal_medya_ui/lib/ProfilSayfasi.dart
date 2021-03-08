import 'package:flutter/material.dart';
import 'package:sosyal_medya_ui/GonderiKarti.dart';
import 'package:sosyal_medya_ui/ProfilKarti.dart';

class ProfilSayfasi extends StatelessWidget {
 final ProfilKarti profilKarti;




 ProfilSayfasi(this.profilKarti);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 230,
                // color: Colors.yellow,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(profilKarti.kapak_resmi),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 100,
                left: 20,
                bottom: 0,
                child: Hero(
                  tag:profilKarti.kullanci_adi,


                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(width: 2.0, color: Colors.white),
                        image: DecorationImage(
                            image: NetworkImage(profilKarti.image),
                            fit: BoxFit.cover)),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                left: 145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profilKarti.ad,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      profilKarti.kullanci_adi,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 130,
                right: 15,
                child: Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade200,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.add_circle,
                        size: 18,
                      ),
                      Text("Takip Et",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context,true);
                },
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 75,
            color: Colors.grey.withOpacity(0.1),
            //opacity 0 ile 1 arasında double degerler alır
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sayacTakipci("Takipçi","20K"),
                sayacTakipci("Takip","500"),
                sayacTakipci("Paylaşım","75"),

              ],
            ),
          ),
          gonderiKarti(
            profilKarti.ad,
            profilKarti.image,
            profilKarti.kullanci_adi,
            "manzara harika",
            profilKarti.kapak_resmi,

          ),

        ],
      ),
    );
  }

  Column sayacTakipci(String baslik,String sayi) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sayi,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    baslik,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              );
  }
}
