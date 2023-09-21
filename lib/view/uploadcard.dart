import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../prov/prov.dart';

class card extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _card();
  }
}

class _card extends State<card> {
  late Box checkbox = Hive.box("checkd");

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "اضف كارنيه النقابه ليكتمل التسجيل",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 243, 243, 58),
      ),
      body: SingleChildScrollView(
          child: Consumer<control>(builder: (context, val, child) {
        return Column(
          children: [
            SizedBox(
              height: 50,
            ),
            checkbox.get('check') == '1'
                ? Text(
                    'انتظر 24 ساعه حتي يتم تنشيط حسابك',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 20),
                  )
                : Text(
                    "حاول ان تكون الصوره واضحه",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: val.image == null
                  ? Image.asset(
                      'images/card.png',
                      fit: BoxFit.contain,
                    )
                  : Image.file(
                      File(val.image!.path),
                      fit: BoxFit.contain,
                    ),
            ),
            Text(
              "اقصي حجم للملف 3 ميجا",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: MaterialButton(
                        onPressed: () {
                          val.getcamera();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("camera"),
                            Icon(
                              Icons.camera,
                              size: 40,
                              color: Colors.black,
                            ),
                          ],
                        ))),
                Expanded(
                    child: MaterialButton(
                        onPressed: () {
                          val.getphoto();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("photo"),
                            Icon(
                              Icons.photo,
                              size: 40,
                              color: Colors.black,
                            ),
                          ],
                        ))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 243, 58),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              child: checkbox.get('check') == '0'
                  ? TextButton(
                      onPressed: () {
                        val.uploadimage();
                        _check_upload_image();
                      },
                      child: Text(
                        'ارفع الصوره',
                        style: TextStyle(color: Colors.black),
                      ))
                  : TextButton(
                      onPressed: () {
                        val.uploadeditimage();
                        _check_upload_image();
                      },
                      child: Text(
                        'تعديل',
                        style: TextStyle(color: Colors.black),
                      )),
            )
          ],
        );
      })),
    );
  }

  Future<void> _check_upload_image() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('تحقق'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Center(
                      child: val.dataimage == "\"not\""
                          ? Text(
                              'لم يتم رفع الصوره',
                              style: TextStyle(
                                  color: Colors.redAccent, fontSize: 15),
                            )
                          : val.dataimage == "\"good\""
                              ? Text(
                                  'تم رفع الصوره',
                                  style: TextStyle(
                                      color: Colors.greenAccent, fontSize: 15),
                                )
                              : CircularProgressIndicator()),
                ],
              );
            }),
          ),
          actions: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Consumer<control>(builder: (context, val, child) {
                return IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
