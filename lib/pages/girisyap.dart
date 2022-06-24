import 'package:denizli/helper/data_helper.dart';
import 'package:flutter/material.dart';

import '../constants/sabitler.dart';

class GirisYapEkran extends StatefulWidget {
  const GirisYapEkran({Key? key}) : super(key: key);

  @override
  State<GirisYapEkran> createState() => _GirisYapEkranState();
}

class _GirisYapEkranState extends State<GirisYapEkran> {
  TextEditingController kullaniciText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  String girilenKullanici = '';
  String girilenPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GİRİŞ YAP'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                controller: kullaniciText,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_add_outlined),
                    hintText: 'Kullanıcı giriniz',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                  controller: passwordText,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.password_outlined),
                      hintText: 'Şifre giriniz',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ))),
            ),
            ElevatedButton(
                onPressed: () {
                  {
                    if (kullaniciText.text == DataHelper.adminUserName &&
                        passwordText.text == DataHelper.adminPassword) {
                      DataHelper.isLogin = 1;
                      Navigator.of(context).pop();
                    }
                  }
                },
                child: Text('GİRİŞ YAP'))
          ],
        ),
      ),
    );
  }
}
