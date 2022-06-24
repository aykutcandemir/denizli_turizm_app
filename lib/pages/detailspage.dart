// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constants/sabitler.dart';
import '../models/location.dart';
import 'mappage.dart';

class DetailsPage extends StatelessWidget {
  final Location location;
  const DetailsPage({required this.location, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Sabitler.anaRenk.shade400,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('${location.isim}', style: Sabitler.detailsAppBarTextStyle),
        centerTitle: true,
      ),
      body:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 18,
                child: ListView(
                  children:[
                    CarouselSlider.builder(
                    itemCount: location.resimListesi.length,
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      height: 450,
                      viewportFraction: 1,
                      autoPlay: true,
                      reverse: true,
                      autoPlayInterval: Duration(seconds: 2),
                    ),
                    itemBuilder: (context, index, index2){
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('${location.resimListesi.elementAt(index)}'),
                              fit: BoxFit.fill
                            ),
                          borderRadius: BorderRadius.circular(15)
                          ),
                          margin: EdgeInsets.all(24),
                          
                        )
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: Text(location.aciklama,
                        style: Sabitler.detailsFontStyle
                    ),
                  )
                  ],
                ),
                
              ),
              Expanded(
                flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      color: Sabitler.ikinciRenk.shade900
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                          GestureDetector(
                            onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: ((context) => MapPage(location: location))));
                             },
                             child: Center(
                                  child: Text('KONUMU GÖR',style: Sabitler.detailsButtonTextStyle,),
                              ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Center(
                              child: Text('GERİ',style: Sabitler.detailsButtonTextStyle,),
                            ),
                          )
                      ] 
                    ),
                    width: MediaQuery.of(context).size.width,
                    
                  ),
                
              )
            ],
          ),
    );
  }
}
