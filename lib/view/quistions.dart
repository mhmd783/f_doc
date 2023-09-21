import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pationt/prov/prov.dart';
import 'package:provider/provider.dart';

class quistion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _quistion();
  }
}

class _quistion extends State<quistion> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getallquistion();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
                child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Consumer<control>(builder: (context, val, child) {
                return Stack(
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 10,
                        child: Text(
                          '${val.numberpationttoday[0]['mes']}',
                          style: TextStyle(color: Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed("notification");
                        },
                        icon: Icon(
                          Icons.notification_add_outlined,
                          color: Colors.black,
                        )),
                  ],
                );
              }),
            )),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("profile");
                    },
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.black,
                    ))),
            Expanded(
                child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("home");
              },
              icon: Icon(Icons.home_outlined, color: Colors.black),
            )),
            Expanded(
                child: CircleAvatar(
              radius: 25,
              backgroundColor: const Color.fromARGB(255, 243, 243, 58),
              child: Consumer<control>(builder: (context, val, child) {
                return IconButton(
                    onPressed: () {
                      val.indexendquistion = 1;
                      val.quistion = [];
                      val.getallquistion();
                      //Navigator.of(context).pushReplacementNamed("quistion");
                    },
                    icon: Icon(
                      Icons.question_mark_rounded,
                      color: Colors.black,
                    ));
              }),
            )),
          ],
        ),
      ),
      appBar: AppBar(
        title: Consumer<control>(builder: (context, val, child) {
          return Text(
            //${val.f_namebox.get('f_name')} ${val.s_namebox.get('s_name')}
            'اسئله المرضى',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          );
        }),
        backgroundColor: const Color.fromARGB(255, 243, 243, 58),
      ),
      body: Consumer<control>(builder: (context, val, child) {
        return
            /////////////////////////////////////////////////////////////posts

            !val.quistion.isEmpty
                ? Container(
                    width: double.infinity,
                    //height: MediaQuery.of(context).size.height - 200,
                    child: ListView.builder(
                        itemCount: val.quistion.length + 1,
                        itemBuilder: (context, i) {
                          if (i < val.quistion.length) {
                            val.indexendquistion = val.quistion[i]['id'];
                          }
                          return i < val.quistion.length
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 30),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 10,
                                            ),
                                            child: Text(
                                              "شخص ما",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: 20, bottom: 10),
                                            child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 243, 243, 58),
                                                child: Icon(
                                                  Icons.person,
                                                  color: Colors.black,
                                                  size: 20,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.only(
                                          left: 40,
                                          right: 40,
                                          top: 10,
                                          bottom: 10),
                                      child: Text(
                                        '${val.quistion[i]['post']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.end,
                                        maxLines: 10,
                                      ),
                                    ),
                                    Divider(
                                      endIndent: 10,
                                      indent: 10,
                                      thickness: 0.5,
                                      color: Colors.black,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('علق'),
                                          IconButton(
                                              onPressed: () {
                                                val.getidquistion(i);
                                                val.refreshcomment();
                                                _add_comment();
                                              },
                                              icon: Icon(
                                                Icons.comment,
                                                size: 30,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 10,
                                      color: Colors.grey.shade400,
                                    ),
                                  ],
                                )
                              : Center(
                                  child: IconButton(
                                      onPressed: () {
                                        val.getallquistion();
                                      },
                                      icon: Icon(
                                        Icons.refresh,
                                        size: 40,
                                        color: Colors.blue,
                                      )),
                                );
                        }))
                : Center(
                    child: CircularProgressIndicator(),
                  );
        //:
        // Center(
        //   child: CircularProgressIndicator(),
        // );
      }),
    );
  }

  //add comment
  _add_comment() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('اضافه تعليق'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Center(
                child: Column(
                  children: [
                    val.Comments[0]['id'] == -1
                        ? Center(
                            child: Text("لا يوجد تعليقات"),
                          )
                        : val.Comments[0]['id'] == -2
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                height: 200,
                                width: 300,
                                child: ListView.builder(
                                    itemCount: val.Comments.length,
                                    itemBuilder: (context, i) {
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 30),
                                            width: 299,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      //val.getiddoctor(i);
                                                      // Navigator.of(context)
                                                      //     .pushNamed('profile_doctor_visit');
                                                    },
                                                    child: TextButton(
                                                      onPressed: () {
                                                        val.getiddoctorfromcomment(
                                                            i);
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                'profile_doctor_visit');
                                                      },
                                                      child: Text(
                                                        "د: ${val.Comments[i]['f_name']} ${val.Comments[i]['s_name']}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 20, bottom: 10),
                                                  child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor:
                                                          Color.fromRGBO(
                                                              243, 243, 58, 1),
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.black,
                                                        size: 20,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topRight,
                                            margin: EdgeInsets.only(
                                                left: 40, right: 40),
                                            child: Text(
                                              '${val.Comments[i]['comment']} ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                              maxLines: 10,
                                              textAlign: TextAlign.end,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                    TextFormField(
                      controller: val.comment,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(
                              "[a-zA-Z0-9\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFBC1\uFBD3-\uFD3D\uFD50-\uFD8F\uFD92-\uFDC7\uFDF0-\uFDFD\uFE70-\uFE74\uFE76-\uFEFC ]"),
                        ),
                      ],
                      maxLength: 150,
                      decoration: InputDecoration(
                        label: Text("التعليق"),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(
                                                        255, 243, 243, 58),
                  borderRadius: BorderRadius.circular(10)),
              child: Consumer<control>(builder: (context, val, child) {
                return MaterialButton(
                  child: Text(
                    'ارسال التعليق',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    if (val.comment.text != '') {
                      val.addcomments();
                      val.getcommentpost();
                      Navigator.of(context).pop();
                      _check_add_comment();
                    } else {
                      val.checkaddcomment = [
                        {"mes": "not"}
                      ];

                      _check_add_comment();
                    }
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }

  //check comment

  Future<void> _check_add_comment() async {
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
                      child: val.checkaddcomment[0]['mes'] == 'not'
                          ? CircularProgressIndicator()
                          : Text(
                              'تم التعليق',
                              style: TextStyle(
                                  color: Colors.greenAccent, fontSize: 15),
                            )),
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
                    _add_comment();
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
