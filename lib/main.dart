import 'package:flutter/material.dart';
import 'package:pationt/prov/prov.dart';
import 'package:pationt/view/home.dart';
import 'package:pationt/view/notification.dart';
import 'package:pationt/view/acount.dart';
import 'package:pationt/view/profile_doctor_visit.dart';
import 'package:pationt/view/quistions.dart';
import 'package:pationt/view/signin.dart';
import 'package:pationt/view/signup.dart';
import 'package:pationt/view/update.dart';
import 'package:pationt/view/uploadcard.dart';
import 'package:provider/provider.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('idd');
  await Hive.openBox('f_named');
  await Hive.openBox('s_named');
  await Hive.openBox('phoned');
  await Hive.openBox('passd');
  await Hive.openBox('aged');
  await Hive.openBox('descriptiond');
  await Hive.openBox('specialtyd');
  await Hive.openBox('salaryd');
  await Hive.openBox('emaild');
  await Hive.openBox('cityd');
  await Hive.openBox('aread');
  await Hive.openBox('streatd');
  await Hive.openBox('build_numd');
  await Hive.openBox('ratingd');
  await Hive.openBox('actived');
  await Hive.openBox('powerd');
  await Hive.openBox('monyd');
  await Hive.openBox('checkd');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    late Box idbox = Hive.box("idd");
    late Box checkbox = Hive.box("checkd");
    // if (int.parse(idbox.get('id')) >= 0) {
    //   Navigator.of(context).pushReplacementNamed('quistion');
    // }
    return ChangeNotifierProvider(
        create: (context) {
          return control();
        },
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'signin':(context) => signin(),
        'signup':(context) => signup(),
        'profile':(context) => profile(),
        'home':(context) => home(),
        'profile_doctor_visit':(context) =>profile_doctor_visit(),
        'quistion':(context) => quistion(),
        'notification':(context) => notification(),
        'update':(context) => update(),
        'card':(context) => card(),
      },
      home: idbox.get('id') !=null&&idbox.get('id') !=''&&checkbox.get('check')=='2'?notification():signin(),
      
    ));
  }
}
