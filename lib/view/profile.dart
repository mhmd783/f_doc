import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import '../prov/prov.dart';

class profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _profile();
  }
}

class _profile extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getrating();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).get_work_time();
    });
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getmypost();
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
                child: CircleAvatar(
              radius: 25,
              backgroundColor: const Color.fromARGB(255, 243, 243, 58),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("profile");
                  },
                  icon: Icon(
                    Icons.person_outlined,
                    color: Colors.black,
                  )),
            )),
            Expanded(
                child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("home");
              },
              icon: Icon(Icons.home_outlined, color: Colors.black),
            )),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("quistion");
                    },
                    icon: Icon(
                      Icons.question_mark_rounded,
                      color: Colors.black,
                    ))),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 243, 58),
        title: Text(
          'الملف الشخصي',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setting();
              },
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      body: Consumer<control>(builder: (context, val, child) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          height: 200,
                          width: double.infinity,
                          child: Image.asset(
                            'images/back1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          height: 1,
                          thickness: 1.0,
                        ),
                        Container(
                          //color: Colors.white,
                          height: 50,
                          width: double.infinity,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              const Color.fromARGB(255, 243, 243, 58),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 50,
                          )),
                    ),
                  ],
                ),

                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "${val.f_namebox.get('f_name')} ${val.s_namebox.get('s_name')}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 25, bottom: 10),
                  child: Text(
                    'التخصص: ${val.specialtybox.get('specialty')}',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 40, right: 25, bottom: 10),
                        child: Text(
                          'التقييمات ${val.ratingbox.get('rating')}',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.star_border,
                          size: 35,
                        ),
                        margin: EdgeInsets.only(right: 25),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 40, right: 25, bottom: 10),
                        child: Text(
                          '${val.salarybox.get('salary')} الكشف ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.money,
                          size: 35,
                        ),
                        margin: EdgeInsets.only(right: 25),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(left: 40, right: 25, bottom: 10),
                        child: Text(
                          "${val.citybox.get('city')}-${val.areabox.get('area')}-${val.streatbox.get('streat')}-${val.build_numbox.get('build_num')}",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.location_on,
                          size: 35,
                        ),
                        margin: EdgeInsets.only(right: 25),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    'مواعيد الحجز',
                    style: TextStyle(fontSize: 20),
                  )),
                ),

                Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 25, right: 25, bottom: 10),
                  width: double.infinity,
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: val.data_work_time_get != []
                          ? val.data_work_time_get.length + 1
                          : 1,
                      itemBuilder: (context, i) {
                        int x;
                        val.data_work_time_get != []
                            ? x = val.data_work_time_get.length
                            : x = 0;
                        return i < x
                            ? Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: const Color.fromARGB(255, 243, 243, 58),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    top: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    right: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                    left: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${val.data_work_time_get[i]['day']}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${val.data_work_time_get[i]['start_time']}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${val.data_work_time_get[i]['end_time']}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          val.changeidday(i);

                                          _delet();
                                        },
                                        icon: Icon(Icons.delete)),
                                  ],
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 243, 243, 58),
                                  child: IconButton(
                                      onPressed: () {
                                        _timework();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                      )),
                                ),
                              );
                      }),
                ),

                /////////////////////////////////////
                Container(
                  margin: EdgeInsets.only(left: 40, right: 25, bottom: 10),
                  child: Text(
                    'معلومات عن الدكتور ',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.end,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 30, bottom: 10),
                  child: Text(
                    '${val.descriptionbox.get('description')} ',
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                    textAlign: TextAlign.end,
                  ),
                ),
                //Divider>
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
                /////////////////////////////////////////////////////////////posts

                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 300,
                    child: ListView.builder(
                        itemCount: val.myposts.length,
                        itemBuilder: (context, i) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "${val.myposts[i]['f_name']} ${val.myposts[i]['s_name']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 10),
                                    child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: const Color.fromARGB(
                                            255, 243, 243, 58),
                                        child: Icon(
                                          Icons.person,
                                          color: Colors.black,
                                          size: 20,
                                        )),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(
                                    left: 40, right: 40, bottom: 10),
                                child: Text(
                                  ' ${val.myposts[i]['post']}',
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
                                child: IconButton(
                                    onPressed: () {
                                      val.takeidofpost(i);
                                      _deletepost();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 30,
                                    )),
                              ),
                              Container(
                                width: double.infinity,
                                height: 10,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          );
                        })),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 243, 243, 58),
          onPressed: () {
            _addpost();
          },
          child: Icon(
            Icons.post_add,
            color: Colors.black,
          )),
    );
  }

  //////////////////////////////////////////////////////////ShowDialog
  Future<void> _timework() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('اضافه معاد عمل'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Text('وقت البدئ'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${val.timestartnew}',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      IconButton(
                          onPressed: () {
                            showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            ).then((value) {
                              if (value != null) {
                                val.chosestarttime(
                                    value.format(context).toString());

                                print(val.timestartnew);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.av_timer,
                            size: 40,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Text('وقت الانتهاء'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${val.timeendnew}',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      IconButton(
                          onPressed: () {
                            showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            ).then((value) {
                              if (value != null) {
                                val.choseendtime(
                                    value.format(context).toString());
                                print(val.timeendnew);
                              }
                            });
                          },
                          icon: Icon(
                            Icons.av_timer,
                            size: 40,
                            color: Colors.black,
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'اختار اليوم',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: val.weak.length,
                        itemBuilder: (context, i) {
                          return Container(
                            decoration: BoxDecoration(
                                color: val.indday == i
                                    ? Colors.grey
                                    : const Color.fromARGB(255, 243, 243, 58),
                                borderRadius: BorderRadius.circular(50)),
                            margin: EdgeInsets.only(left: 10),
                            child: TextButton(
                                onPressed: () {
                                  
                                  val.choseday(i);
                                },
                                child: Text(
                                  '${val.weak[i]}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )),
                          );
                        }),
                  ),
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
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    val.add_work_time();
                    val.get_work_time();
                    Navigator.of(context).pop();
                    _check_add_work_time();
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Future<void> _delet() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('مسح'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      '!!هل انت متاكد من عمليه الحذف',
                      style: TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                  ),
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
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    val.delet_work_time();
                    val.get_work_time();
                    Navigator.of(context).pop();
                    _check_delete_work_time();
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Future<void> _check_add_work_time() async {
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
                    child: val.data_work_time[0]['mes'] == 'good'
                        ? Text(
                            'تم الاضافه',
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 15),
                          )
                        : Text(
                            'هناك مشكله!!',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                  ),
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

  Future<void> _check_delete_work_time() async {
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
                    child: val.delet[0]['mes'] == 'good'
                        ? Text(
                            'تم الحذف',
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 15),
                          )
                        : Text(
                            'هناك مشكله!!',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                  ),
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

  Future<void> _addpost() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('اضافه معلومه طبيه'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Center(
                child: TextFormField(
                  controller: val.post,
                  decoration: InputDecoration(
                    label: Text("المعلومه"),
                  ),
                ),
              );
            }),
          ),
          actions: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Consumer<control>(builder: (context, val, child) {
                return IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (val.post.text != '') {
                      val.addpost();
                    }
                    Navigator.of(context).pop();
                    _check_addpost();
                    val.getmypost();
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Future<void> _check_addpost() async {
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
                    child: val.postlist[0]['mes'] == 'good'
                        ? Text(
                            'تم اضافه المعلومه الطبيه',
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 15),
                          )
                        : Text(
                            'هناك مشكله!!',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                  ),
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

  Future<void> _deletepost() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('مسح'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Center(
                    child: Text(
                      '!!هل انت متاكد من عمليه الحذف',
                      style: TextStyle(color: Colors.redAccent, fontSize: 15),
                    ),
                  ),
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
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    val.deletmypost();

                    Navigator.of(context).pop();
                    val.getmypost();
                    await _check_delete_post();
                  },
                );
              }),
            ),
          ],
        );
      },
    );
  }

  Future<void> _check_delete_post() async {
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
                    child: val.postsdelet[0]['mes'] == 'good'
                        ? Text(
                            'تم الحذف',
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 15),
                          )
                        : Text(
                            'هناك مشكله!!',
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          ),
                  ),
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

  setting() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('اعدادات'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            checklogout();
                          },
                          child: Text(
                            "تسجيل الخروج من الحساب",
                            style: TextStyle(color: Colors.black),
                          )),
                      Icon(Icons.logout),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            val.inputupdate();
                            Navigator.of(context).pushNamed('update');
                          },
                          child: Text(
                            "تعديل الحساب",
                            style: TextStyle(color: Colors.black),
                          )),
                      Icon(Icons.edit),
                    ],
                  )
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

  checklogout() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('تاكيد تسجيل الخروج'),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Text(
                    "هل انت متاكد من تسجل الخروج؟؟",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  //Icon(Icons.logout),
                ],
              );
            }),
          ),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Consumer<control>(builder: (context, val, child) {
                    return IconButton(
                        onPressed: () {
                          val.logout();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'signin', (route) => false);
                        },
                        icon: Icon(
                          Icons.offline_pin_outlined,
                          color: Colors.greenAccent,
                          size: 30,
                        ));
                  }),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        //Navigator.of(context).pushNamed('routeName');
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 30,
                      )),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
