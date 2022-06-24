// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:denizli/constants/sabitler.dart';
import 'package:denizli/helper/data_helper.dart';
import 'package:denizli/models/location.dart';
import 'package:denizli/pages/detailspage.dart';
import 'package:denizli/pages/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? location = null;
  late List<Location> konumlar;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    konumlar = DataHelper.lokasyonListesi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //debugPrint(DataHelper.lokasyonListesi().elementAt(0).toString());
    //debugPrint(DataHelper.lokasyonListesi().length.toString());
    
    return Scaffold(
        
        drawer: YanMenu(),
        backgroundColor: Colors.blue.shade900,
        body: Column(children: [
          Expanded(
            flex: 11,
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                appBarCiz(),
                
                gridViewCiz(),
              ],
            ),
          ),
          Expanded(flex: 1, child: ilceSecimiCiz())
        ]));
  }

  appBarCiz() {
    return SliverAppBar(
      floating: true,
      expandedHeight: 170,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        children: [
          Container(
            
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: Image.asset(
              'images/denizliTitleBar.jpg',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,

            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'DENİZLİ REHBERİ',
                style: Sabitler.baslikStyle,
              ),
            ),
          ),
        ],
      )),
    );
  }

  gridViewCiz() {
    return SliverToBoxAdapter(
      child: GridView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: konumlar.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            var gosterilecekKonum =
                konumlar.elementAt(index).resimListesi.elementAt(0);
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DetailsPage(location: konumlar[index]);
                }));
              },
              child: Card(
                margin: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                shadowColor: Colors.white,
                color: Sabitler.anaRenk.shade400,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top:10, left: 10, right: 10, bottom: 50),
                        child: Image.asset(gosterilecekKonum,
                            width: (MediaQuery.of(context).size.width / 2),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(
                          
                            backgroundColor: Colors.blue.shade900,
                            label: Text(
                              konumlar[index].isim.toString(),
                              style: Sabitler.listeStyle,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  ilceSecimiCiz() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Sabitler.ikinciRenk.shade900,
      ),
      child: Align(
        alignment: Alignment.center,
        child: DropdownButton<String>(
          dropdownColor: Sabitler.ikinciRenk.shade900,
          iconEnabledColor: Colors.white,
          underline: SizedBox(),
          icon: Icon(Icons.arrow_downward) ,
          hint: Text('BÖLGE SEÇİNİZ',style: GoogleFonts.quicksand(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w800
            ),),
          style: GoogleFonts.quicksand(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w800
            ),
          
          elevation: 15,
          value: location,
          onChanged: (deger) {
            setState(() {
              debugPrint(deger);
              location = deger.toString();
              konumlar.clear();
              for (Location l in DataHelper.lokasyonListesi()) {
                if (l.kategori == deger) {
                  konumlar.add(l);
                }
              }
              debugPrint(konumlar.length.toString());
            });
          },
          items: [
            DropdownMenuItem(
              child: Text('ACIPAYAM'),
              value: 'acipayam',
            ),
            DropdownMenuItem(
              child: Text('BEYAĞAÇ'),
              value: 'beyagac',
            ),
            DropdownMenuItem(
              child: Text('ÇARDAK'),
              value: 'cardak',
            ),
            DropdownMenuItem(
              child: Text('GÜNEY'),
              value: 'guney',
            ),
            DropdownMenuItem(
              child: Text('HONAZ'),
              value: 'honaz',
            ),
            DropdownMenuItem(
              child: Text('KALE'),
              value: 'kale',
            ),
            DropdownMenuItem(
              child: Text('PAMUKKALE'),
              value: 'pamukkale',
            ),
            DropdownMenuItem(
              child: Text('TAVAS'),
              value: 'tavas',
            ),
          ],
        ),
      ),
    );
  }
}
