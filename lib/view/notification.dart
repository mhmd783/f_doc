import 'package:flutter/material.dart';

import '../prov/prov.dart';
import 'package:provider/provider.dart';

class notification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _notification();
  }
}

class _notification extends State<notification> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).initializenotification();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).sendoulnotification('دكتور',"تابع حجوزاتك ربما هناك حجز");
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getnumberpationttoday();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).refresh();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getpationtreservation();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getnumberpationttoday();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).check_active();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getphone();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _shar();
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
              backgroundColor: const Color.fromARGB(255, 243, 243, 58),
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
                      Navigator.of(context).pushNamed("profile");
                    },
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.black,
                    ))),
            Expanded(
                child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("home");
              },
              icon: Icon(Icons.home_outlined, color: Colors.black),
            )),
            Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("quistion");
                    },
                    icon: Icon(
                      Icons.question_mark_rounded,
                      color: Colors.black,
                    ))),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          " اشعارات الحجز",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 243, 58),
      ),
      body: Consumer<control>(builder: (context, val, child) {
        return val.reservation[0]['id']==-1
            ? Center(
                child: Center(
                    child: Text(
                  'لا يوجد بيانات لعرضها ',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                )),
              ):val.reservation[0]['id']==-2?Center(child: CircularProgressIndicator(),):Container(
                child: ListView.builder(
                    itemCount: val.reservation.length,
                    itemBuilder: (context, i) {
                      return Card(
                        color: val.reservation[i]['call'] == 1
                            ? Colors.white
                            : const Color.fromARGB(255, 243, 243, 58),
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        child: ListTile(
                          onTap: () {
                            val.makecall(val.reservation[i]['id']);
                          },
                          leading: IconButton(
                              onPressed: () {
                                val.call(val.reservation[i]['phone']);
                                val.makecall(val.reservation[i]['id']);
                                //val.launchCaller('+201140374362');
                              },
                              icon: Icon(
                                Icons.call,
                                color: Colors.black,
                              )),
                          title: Text(
                            '${val.reservation[i]['name_pationt']}',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text('${val.reservation[i]['phone']}',style: TextStyle(
                              color: Colors.black,
                            ),),
                          trailing: Text('${val.reservation[i]['date_enter']}',style: TextStyle(
                              color: Colors.black,
                            ),),
                        ),
                      );
                    }),
              )
            ;
      }),
    );
  }
   Future<void> _shar() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text(
            "رساله",
            textAlign: TextAlign.end,
          ),
          elevation: 10,
          content: Form(
            child: Consumer<control>(builder: (context, val, child) {
              return Column(
                children: [
                  Center(
                    child: int.parse(val.activebox.get("active")) == 0
                        ? Text(
                            textAlign: TextAlign.end,
                            "حسابك متوقف ولحين شحن رصيد لن يصلك اي حجوزات ولن يستيطع اي احد حجز كشف  لحين السداد واعاده التفعيل تواصل مع\n ${val.phoneoner[0]['data']}",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 15),
                          )
                        : Text(
                            "اهلا بك",
                            style: TextStyle(
                                color: Colors.greenAccent, fontSize: 15),
                          ),
                  ),
                  int.parse(val.activebox.get("active")) == 0
                      ? CircleAvatar(
                          backgroundColor: Colors.greenAccent.withOpacity(0.9),
                          child: IconButton(
                              onPressed: () {
                                val.call("${val.phoneoner[0]['data']}");
                              },
                              icon: Icon(
                                Icons.call,
                                color: Colors.black,
                              )),
                        )
                      : Container(),
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
                  onPressed: () async {
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
