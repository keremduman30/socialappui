import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sosyal_medya_ui/GonderiKarti.dart';
import 'package:sosyal_medya_ui/ProfilKarti.dart';
import 'package:sosyal_medya_ui/ProfilSayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sosyal Medya',
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatelessWidget {
  List<ProfilKarti> liste() {
    List<ProfilKarti> profil = new List<ProfilKarti>();
    ProfilKarti p1 = new ProfilKarti(
        "berwari",
        "https://avatars0.githubusercontent.com/u/65291634?s=460&u=64820c69f25d0eb352c070031a855cdd904dc9ea&v=4",
        "@berwari",
        "https://cdn.pixabay.com/photo/2013/07/18/10/56/railroad-163518__340.jpg");
    ProfilKarti p2 = new ProfilKarti(
        "gloria",
        "https://cdn.pixabay.com/photo/2018/08/23/22/29/girl-3626901_1280.jpg",
        "@gloria65",
        "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823__340.jpg");
    ProfilKarti p3 = new ProfilKarti(
      "texeria",
      "https://cdn.pixabay.com/photo/2015/09/02/12/42/woman-918623_1280.jpg",
      "@texeri_usea",
      "https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989__340.jpg",
    );
    ProfilKarti p4 = new ProfilKarti(
      "godin",
      "https://cdn.pixabay.com/photo/2014/04/12/14/59/portrait-322470_960_720.jpg",
      "@diego",
      "https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989__340.jpg",
    );
    ProfilKarti p5 = new ProfilKarti(
        "nurullah",
        "https://cdn.pixabay.com/photo/2016/03/27/17/42/man-1283235_960_720.jpg",
        "@xelet",
        "https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989__340.jpg");
    profil.add(p1);
    profil.add(p2);
    profil.add(p3);
    profil.add(p4);
    profil.add(p5);

    return profil;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 32,
          ),
        ),
        title: Text(
          "Sosyal Medya",
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  //altta cıkacak modaller
                  return Column(
                    children: [
                      duyuru("berwari seni takip etti", "5 dk once"),
                      duyuru("izet seni takip etti", "1 saat once"),
                      duyuru("adem takibi bıraktı", "5 dk once"),
                      duyuru("remziye seni takip etti", "25 dk once"),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.notifications,
              size: 32,
              color: Colors.purple[300],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                //eger dekorasyon yaoacaksan color dekorasyonun içinde olmalı hem dısarda hem dekorasyonda olamaz
                color: Colors.grey[100],
                boxShadow: [
                  //birden fazla golge bırakmak için liste halınde
                  BoxShadow(
                    //golge verir
                    color: Colors.grey,
                    offset: Offset(0, 3),
                    //golge biz sadece alt tarafıa-na golge vermek içn x=0 y=3 diyebilir x yatay y dikey eksenlerditr
                    blurRadius: 5, //golge blurlugu verir ne kadar bulanık
                  ),
                ]),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: liste().length,
                itemBuilder: (context, index) {
                  ProfilKarti profil_karti = liste()[index];
                  return Material(
                    child: InkWell(
                      onTap: () async {
                        bool donen_veri = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProfilSayfasi(profil_karti)));
                        if (donen_veri) {}
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: [
                            Stack(
                              //childeren aldıgı için ..bu stack ust uste binilecek yıgınlardır yani profil resmininn uzerine resim koymka için
                              alignment: Alignment.topRight,
                              children: [
                                Hero(
                                  //profil ucuyormus gibi diger sayfaya gideer ama her profilin bir herosu olur
                                  //burda 7 tane prfil var oyuzden hata verir bunun için dinamikli bir değişiklik olmalı
                                  //oyuzden her kullanıcı daının bir herro tagı olsun
                                  tag: liste()[index],
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(35),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                liste()[index].image),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                //bu eklenen elemanlar ust uste biner
                                Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        width: 2, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              liste()[index].ad,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 10,
          ),
          gonderiKarti(
            "Kerem Duman",
            "https://avatars0.githubusercontent.com/u/65291634?s=460&u=64820c69f25d0eb352c070031a855cdd904dc9ea&v=4",
            "1 ay önce",
            "kopeğim dus aldı",
            "https://cdn.pixabay.com/photo/2016/02/19/11/53/pug-1210025__340.jpg",
          ),
          gonderiKarti(
            "jonisis",
            "https://cdn.pixabay.com/photo/2016/11/21/14/53/adult-1845814_1280.jpg",
            "2 ay önce",
            "manzara harika",
            "https://cdn.pixabay.com/photo/2017/08/01/20/06/storm-2567670__340.jpg",
          ),
          gonderiKarti(
            "gloria",
            "https://cdn.pixabay.com/photo/2015/03/26/09/42/woman-690118_1280.jpg",
            "2 ay önce",
            "arkadaslarla geziyoruz",
            "https://media.istockphoto.com/photos/three-girls-in-protective-masks-walking-on-a-summer-street-picture-id1256460906",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        onPressed: (){

        },
        child: Icon(Icons.add_a_photo,color: Colors.white,),
      ),
    );
  }

  Padding duyuru(String mesaj, String gecen_sure) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(fontSize: 15),
          ),
          Text(gecen_sure),
        ],
      ),
    );
  }
}

/*
----profil kartı listview buildersiz
 Container(
              height: 100,
              color: Colors.grey[100],
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  profilKarti("berwari","https://cdn.pixabay.com/photo/2016/03/09/15/10/man-1246508_1280.jpg"),
                  profilKarti("gloria","https://cdn.pixabay.com/photo/2018/08/23/22/29/girl-3626901_1280.jpg"),
                  profilKarti("texeria","https://cdn.pixabay.com/photo/2015/09/02/12/42/woman-918623_1280.jpg"),
                  profilKarti("godin","https://cdn.pixabay.com/photo/2014/04/12/14/59/portrait-322470_960_720.jpg"),
                  profilKarti("nurullah","https://cdn.pixabay.com/photo/2016/03/27/17/42/man-1283235_960_720.jpg"),

                ],
              ),
            ),

//metod
 Widget profilKarti(String name,String image_adress) {
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:Border.all(width: 2,color: Colors.grey),
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                            image: NetworkImage(image_adress),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(name,style: TextStyle(fontSize: 15,color: Colors.black),)
                    ],
                  ),
    );
  }


 */
