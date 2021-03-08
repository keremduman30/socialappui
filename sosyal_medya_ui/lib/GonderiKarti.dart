import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gonderiKarti extends StatelessWidget {
  final String adSoyad;
  final String profil_link;
  final String gonderi_link;
  final String gecen_sure;
  final String aciklama;


  gonderiKarti(this.adSoyad, this.profil_link, this.gecen_sure, this.aciklama,this.gonderi_link);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: NetworkImage(profil_link),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            adSoyad,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 15),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            gecen_sure,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                aciklama,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Image.network(
                gonderi_link,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.favorite,color:  Colors.grey,),
                      label: Text(
                        "Beğen",
                        style: TextStyle(fontSize: 10,
                          color: Colors.grey,),
                      )),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.comment,color: Colors.grey,),
                      label: Text(
                        "yorum yap",
                        style: TextStyle(fontSize: 10,
                          color: Colors.grey,),
                      )),
                  FlatButton.icon(
                      onPressed: () {},
                      icon:Icon( Icons.share,color: Colors.grey,),
                      label: Text(
                        "paylas",
                        style: TextStyle(fontSize: 10,
                          color: Colors.grey,),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
