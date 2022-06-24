// ignore_for_file: non_constant_identifier_names, prefer_const_declarations

import 'package:flutter/cupertino.dart';

import '../models/location.dart';

class DataHelper {
  static String adminUserName = 'admin';
  static String adminPassword = '123456';

  // PREFERENCES
  static int isLogin = 0;

  static void lokasyonSil(Location lokasyon) {
    for (int i = 0; i < lokasyonListesi().length; i++) {
      if (lokasyonListesi().elementAt(i).id == lokasyon.id) {
        debugPrint('${lokasyonListesi().elementAt(i).id}');
        lokasyonListesi().removeAt(i);
        debugPrint('${lokasyonListesi().length}');
      }
    }
  }

  //static List<Location> lokasyonlar = [];
  static final String _aciklama =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lectus in nibh faucibus sodales. Vestibulum eget euismod mauris, ac luctus diam. In cursus vestibulum odio, vel scelerisque lectus egestas vitae. Aliquam faucibus tempor mauris et sollicitudin. Integer pretium hendrerit accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lectus in nibh faucibus sodales. Vestibulum eget euismod mauris, ac luctus diam. In cursus vestibulum odio, vel scelerisque lectus egestas vitae. Aliquam faucibus tempor mauris et sollicitudin. Integer pretium hendrerit accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lectus in nibh faucibus sodales. Vestibulum eget euismod mauris, ac luctus diam. In cursus vestibulum odio, vel scelerisque lectus egestas vitae. Aliquam faucibus tempor mauris et sollicitudin. Integer pretium hendrerit accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lectus in nibh faucibus sodales. Vestibulum eget euismod mauris, ac luctus diam. In cursus vestibulum odio, vel scelerisque lectus egestas vitae. Aliquam faucibus tempor mauris et sollicitudin. Integer pretium hendrerit accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lectus in nibh faucibus sodales. Vestibulum eget euismod mauris, ac luctus diam. In cursus vestibulum odio, vel scelerisque lectus egestas vitae. Aliquam faucibus tempor mauris et sollicitudin. Integer pretium hendrerit accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tempor lectus in nibh faucibus sodales. Vestibulum eget euismod mauris, ac luctus diam. In cursus vestibulum odio, vel scelerisque lectus egestas vitae. Aliquam faucibus tempor mauris et sollicitudin. Integer pretium hendrerit accumsan. Vestibulum ante ipsum primis in faucibus orci luctus et.';
  static List<Location> lokasyonListesi() {
    List<Location> _list = [];
    _list.add(Location(
        1,
        'Pamukkale',
        'pamukkale',
        _aciklama,
        37.77152,
        29.08631,
        ['images/pamukkaleTraverten1.jpg', 'images/pamukkaleTraverten2.jpg']));

    _list.add(Location(
        2,
        'Heraklia Salbace Antik Kenti',
        'tavas',
        _aciklama,
        37.77152,
        29.08631,
        ['images/herakliaSalbace1.jpg', 'images/herakliaSalbace2.jpg', 'images/herakliaSalbace3.jpg']));
    _list.add(Location(
        3,
        'Topuklu Yaylası',
        'beyagac',
        _aciklama,
        37.77152,
        29.08631,
        ['images/topukluYayla1.jpg', 'images/topukluYayla2.jpg', 'images/topukluYayla3.jpg']));
    _list.add(Location(
        4,
        'İnceğiz Kanyonu',
        'kale',
        _aciklama,
        37.77152,
        29.08631,
        ['images/incegizKanyonu1.jpg','images/incegizKanyonu2.jpg','images/incegizKanyonu3.jpg']));
    _list.add(Location(
        5,
        'Güney Şelalesi',
        'guney',
        _aciklama,
        37.77152,
        29.08631,
        ['images/kulturSelalesi1.jpg','images/kulturSelalesi2.jpg']));
    _list.add(Location(
        6,
        'Çardak Kervansaray',
        'cardak',
        _aciklama,
        37.77152,
        29.08631,
        ['images/cardakKervansaray1.jpg','images/cardakKervansaray2.jpg']));
    _list.add(Location(
        7,
        'Hierapolis Antik Kenti',
        'pamukkale',
        _aciklama,
        37.77152,
        29.08631,
        ['images/hierapolisKent1.jpg','images/hierapolisKent2.jpg']));
    _list.add(Location(
        8,
        'Hierapolis Arkeoloji Müzesi',
        'pamukkale',
        _aciklama,
        37.77152,
        29.08631,
        ['images/hierapolisMuze1.jpg','images/hierapolisMuze2.jpg','images/hierapolisMuze3.jpg']));
    _list.add(Location(
        9,
        'Kaklık Mağarası',
        'honaz',
        _aciklama,
        37.77152,
        29.08631,
        ['images/kaklik1.png', 'images/kaklik2.jpg', 'images/kaklik3.jpg']));
    _list.add(Location(
        10,
        'Colossae Antik Kent',
        'honaz',
        _aciklama,
        37.77152,
        29.08631,
        ['images/colossaeKent1.jpg','images/colossaeKent2.jpg','images/colossaeKent3.jpg']));
    _list.add(Location(
        11,
        'Keloğlan Mağarası',
        'acipayam',
        _aciklama,
        37.77152,
        29.08631,
        ['images/keloglanMagara1.jpg','images/keloglanMagara2.jpg']));
    _list.add(Location(
        12,
        'Olukbaşı Kanyonu',
        'acipayam',
        _aciklama,
        37.77152,
        29.08631,
        ['images/olukbasiKanyon1.jpg','images/olukbasiKanyon2.jpg','images/olukbasiKanyon3.jpg']));
    _list.add(Location(
        13,
        'Pamukkale',
        'pamukkale',
        _aciklama,
        37.77152,
        29.08631,
        ['images/denizliTitleBar.jpg']));
    _list.add(Location(
      14, 
      'Tavas', 
      'tavas', 
      _aciklama, 
      37.77152,
        29.08631,
        ['images/denizliTitleBar.jpg']));
    _list.add(Location(
      15, 
      'Acıpayam', 
      'acipayam', 
      _aciklama,
        37.77152,
        29.08631,
        ['images/denizliTitleBar.jpg']));
    return _list;
  }
}
