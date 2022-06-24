// ignore_for_file: prefer_const_constructors

import 'package:denizli/helper/data_helper.dart';
import 'package:denizli/pages/girisyap.dart';
import 'package:denizli/pages/settings.dart';
import 'package:flutter/material.dart';

class YanMenu extends StatefulWidget {
  const YanMenu({Key? key}) : super(key: key);

  @override
  State<YanMenu> createState() => _YanMenuState();
}

class _YanMenuState extends State<YanMenu> {
  @override
  Widget build(BuildContext context) {
    // KULLANICI GİRİŞ YAPMAMIŞSA
    if (DataHelper.isLogin == 0) {
      return Drawer(
        
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GirisYapEkran()));
                    },
                    child: Text('GİRİŞ YAP'))),
          ],
        ),
      );
    }
    // KULLANICI GİRİŞ YAPMIŞSA
    else if (DataHelper.isLogin == 1) {
      return Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(DataHelper.adminUserName,style: TextStyle(
                
              ),), 
              accountEmail: null,
              ),
            SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                ElevatedButton(
                  onPressed: () {
                  setState(() {
                    DataHelper.isLogin = 0;
                    });
                  },
                child: Text('ÇIKIŞ YAP')
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => AyarlarSayfasi())));
                  },
                child: Text('AYARLAR')
                )
              ],
            ),
            
            
          ],
        ),
      );
    }
    // DİĞER
    else {
      return Drawer();
    }
  }
}
