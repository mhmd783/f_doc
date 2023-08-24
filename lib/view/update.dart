import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import '../prov/prov.dart';

class update extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _update();
  }
}

class _update extends State<update> {
  String date = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تعديل',style: TextStyle(color: Colors.black),)),
      body: Center(
        child: Consumer<control>(builder: (context, val, child) {
          return Container(
              margin: EdgeInsets.only(top: 60, left: 20, right: 20),
              child: Form(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      
                      
                      
                      TextFormField(
                        controller: val.f_name,
                        keyboardType: TextInputType.name,
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
                        decoration: InputDecoration(
                          label: Text("وصف ليك"),
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: val.salary,
                        keyboardType: TextInputType.number,
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
                                        : const Color.fromARGB(255, 243, 243, 58),
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
                      
                      
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller:val.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text("ايميلك"),
                        ),
                      ),
                      
                      SizedBox(
                        width: 12,
                        height: 20,
                      ),
                      TextFormField(
                        controller: val.age,
                        keyboardType: TextInputType.number,
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
                                        : const Color.fromARGB(255, 243, 243, 58),
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
                      MaterialButton(
                        onPressed: () async {
                          if (val.f_name.text != '' &&
                              val.s_name.text != ''&&
                              val.description.text != ''&&
                              val.salary.text != ''&&
                              val.specialtyt != ''&&
                              val.cityt != ''&&
                              val.email.text != ''&&
                              val.age.text != '' &&
                              val.area.text != ''&&
                              val.streat.text != ''&&
                              val.build_num.text != '') {
                            val.update_data_doctor();

                            _check();
                          } else {
                            _message();
                          }
                        },
                        child: Text(
                          "تعديل",
                          style: TextStyle(fontSize: 17),
                        ),
                        color: Colors.white30,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      ),
                      
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
                child: val.update[0]['mes'] == 'not'&&val.data!=null
                        ? Center(child: Text('هناك مشكله',style: TextStyle(color: Colors.redAccent),))
                        : Center(child: Text('تم تسجيل التعديل!',style: TextStyle(color: Colors.greenAccent),)),
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
                        child:Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
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
