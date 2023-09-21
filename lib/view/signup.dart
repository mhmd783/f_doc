import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import '../prov/prov.dart';

class signup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _signup();
  }
}

class _signup extends State<signup> {
  String date = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<control>(builder: (context, val, child) {
          return Container(
              margin: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Form(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/logo.png",
                        height: 200,
                        width: 200,
                      ),
                      Text("Doctor Signup", style: TextStyle(fontSize: 30)),
                      ////
                      ///

                      ///
                      TextFormField(
                        controller: val.f_name,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFBC1\uFBD3-\uFD3D\uFD50-\uFD8F\uFD92-\uFDC7\uFDF0-\uFDFD\uFE70-\uFE74\uFE76-\uFEFC ]"),
                          ),
                        ],
                        maxLength:10,
                        decoration: InputDecoration(
                          label: Text("اسمك"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.s_name,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFBC1\uFBD3-\uFD3D\uFD50-\uFD8F\uFD92-\uFDC7\uFDF0-\uFDFD\uFE70-\uFE74\uFE76-\uFEFC ]"),
                          ),
                        ],
                        maxLength: 10,
                        decoration: InputDecoration(
                          label: Text("اسم الاب"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.description,
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFBC1\uFBD3-\uFD3D\uFD50-\uFD8F\uFD92-\uFDC7\uFDF0-\uFDFD\uFE70-\uFE74\uFE76-\uFEFC ]"),
                          ),
                        ],
                        maxLength: 250,
                        decoration: InputDecoration(
                          label: Text("وصف ليك"),
                        ),
                      ),
                      TextFormField(
                        controller: val.salary,
                        keyboardType: TextInputType.number,
                        
                        maxLength: 4,
                        decoration: InputDecoration(
                          label: Text("سعر الكشف"),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'اختار التخصص',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Container(
                        width: 300,
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: val.specialtys.length,
                            itemBuilder: (context, i) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: val.indspecialty == i
                                        ? Colors.grey
                                        : const Color.fromARGB(
                                            255, 243, 243, 58),
                                    borderRadius: BorderRadius.circular(50)),
                                margin: EdgeInsets.only(left: 10),
                                child: TextButton(
                                    onPressed: () {
                                      val.changespecialty(i);
                                    },
                                    child: Text(
                                      '${val.specialtys[i]}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        controller: val.phone,
                        keyboardType: TextInputType.number,
                        maxLength: 11,
                        decoration: InputDecoration(
                          label: Text("رقم تلفونك"),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.email,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 250,
                        decoration: InputDecoration(
                          label: Text("ايميلك"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.pass,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        decoration: InputDecoration(
                          label: Text("الرقم السري"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("تكرار الرقم السري"),
                        ),
                        controller: val.pass1,
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                      ),
                      SizedBox(
                        width: 12,
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.age,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: InputDecoration(
                          label: Text("عمرك"),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          'اختار المدينه',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Container(
                        width: 300,
                        height: 40,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: val.citys.length,
                            itemBuilder: (context, i) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: val.indcity == i
                                        ? Colors.grey
                                        : const Color.fromARGB(
                                            255, 243, 243, 58),
                                    borderRadius: BorderRadius.circular(50)),
                                margin: EdgeInsets.only(left: 10),
                                child: TextButton(
                                    onPressed: () {
                                      val.changecity(i);
                                    },
                                    child: Text(
                                      '${val.citys[i]}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.area,
                        keyboardType: TextInputType.streetAddress,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFBC1\uFBD3-\uFD3D\uFD50-\uFD8F\uFD92-\uFDC7\uFDF0-\uFDFD\uFE70-\uFE74\uFE76-\uFEFC ]"),
                          ),
                        ],
                        maxLength: 255,
                        decoration: InputDecoration(
                          label: Text("المنطقه"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.streat,
                        keyboardType: TextInputType.streetAddress,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFBC1\uFBD3-\uFD3D\uFD50-\uFD8F\uFD92-\uFDC7\uFDF0-\uFDFD\uFE70-\uFE74\uFE76-\uFEFC ]"),
                          ),
                        ],
                        maxLength: 255,
                        decoration: InputDecoration(
                          label: Text("الشارع"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.build_num,
                        keyboardType: TextInputType.number,
                        maxLength: 8,
                        decoration: InputDecoration(
                          label: Text("رقم العماره "),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'\d')),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CircleAvatar(
                            radius: 25,
                            backgroundColor: val.gender == 1
                                ? const Color.fromARGB(255, 243, 243, 58)
                                : Colors.grey.withOpacity(0.9),
                            child: IconButton(
                              icon: Icon(
                                Icons.male,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                val.chosegender('male');
                              },
                            ),
                          )),
                          Expanded(
                              child: CircleAvatar(
                            radius: 25,
                            backgroundColor: val.gender == 2
                                ? const Color.fromARGB(255, 243, 243, 58)
                                : Colors.grey.withOpacity(0.9),
                            child: IconButton(
                              icon: Icon(
                                Icons.female,
                                size: 30,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                val.chosegender('fmale');
                              },
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if (val.f_name.text != '' &&
                              val.s_name.text != '' &&
                              val.description.text != '' &&
                              val.salary.text != '' &&
                              val.specialtyt != '' &&
                              val.cityt != '' &&
                              val.phone.text.length > 10 &&
                              val.email.text != '' &&
                              val.age.text != '' &&
                              val.pass.text == val.pass1.text &&
                              val.area.text != '' &&
                              val.streat.text != '' &&
                              val.build_num.text != '' &&
                              val.genderform != '') {
                            val.registernew();

                            _check();
                          } else {
                            _message();
                          }
                        },
                        child: Text(
                          "تسجيل",
                          style: TextStyle(fontSize: 17),
                        ),
                        color: Colors.white30,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed("signin");
                          },
                          child: Text(
                            "تسجيل الدخول...",
                            style: TextStyle(fontSize: 17),
                          )),
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }

  Future<void> _check() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('تحقق'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Center(
                child: val.datarigester == null
                    ? Center(child: CircularProgressIndicator())
                    : val.datarigester[0]['mes'] == 'not'
                        ? Center(child: Text('هذا الرقم مسجل'))
                        : Center(child: Text('تم تسجيل الحساب بنجاح!')),
              );
            }),
          ),
          actions: <Widget>[
            Consumer<control>(builder: (context, val, child) {
              return val.datarigester != null &&
                      val.datarigester[0]['mes'] != 'not'
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        child: Text("تسجل الدخول"),
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("signin");
                        },
                      ),
                    )
                  : Container();
            }),
          ],
        );
      },
    );
  }

  Future<void> _message() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Icon(
            Icons.error,
            color: Colors.redAccent,
          ),
          elevation: 10,
          content: Form(
            child: Center(child: Text('هناك خطاء في البيانات !!!')),
          ),
        );
      },
    );
  }
}
