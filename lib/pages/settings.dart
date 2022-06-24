// ignore_for_file: prefer_const_constructors

import 'package:denizli/constants/sabitler.dart';
import 'package:denizli/helper/data_helper.dart';
import 'package:flutter/material.dart';

import '../models/location.dart';

class AyarlarSayfasi extends StatefulWidget {
  const AyarlarSayfasi({Key? key}) : super(key: key);
  @override
  State<AyarlarSayfasi> createState() => _AyarlarSayfasiState();
}

class _AyarlarSayfasiState extends State<AyarlarSayfasi> {
  late List<Location> konumlar;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    konumlar = DataHelper.lokasyonListesi();
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    konumlar = DataHelper.lokasyonListesi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'AYARLAR',
            style: Sabitler.detailsAppBarTextStyle,
          ),
        ),
        body: ListView.builder(
          itemCount: konumlar.length,
          itemBuilder: ((context, index) {
            var gosterilecekKonum = konumlar[index];

            return GestureDetector(
              onTap: () {
                debugPrint(
                    gosterilecekKonum.isim + '  ' + gosterilecekKonum.kategori);
              },
              child: ListTile(
                leading: Icon(
                  Icons.location_city_outlined,
                  color: Colors.blue.shade900,
                ),
                title: Text(gosterilecekKonum.isim),
                subtitle: Text(gosterilecekKonum.kategori),
                
                /*
                trailing: 
                    GestureDetector(
                      onTap: () {
                        DataHelper.lokasyonSil(gosterilecekKonum);
                        setState(() {
                        
                      });
                      },
                      child: Icon(
                        Icons.delete_outlined,
                        color: Colors.red,
                      ),
                    ),
                */

              ),
            );
          }),
        ));
  }
}
