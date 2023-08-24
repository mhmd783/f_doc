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
      Provider.of<control>(context, listen: false).getpationtreservation();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<control>(context, listen: false).getnumberpationttoday();
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
        title: Text(
          " اشعارات الحجز",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 243, 58),
      ),
      body: Consumer<control>(builder: (context, val, child) {
        return !val.reservation.isEmpty
            ? Container(
                child: ListView.builder(
                    itemCount: val.reservation.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 10,
                        child: ListTile(
                          leading: IconButton(
                              onPressed: () {
                                val.call(val.reservation[i]['phone']);
                                //val.launchCaller('+201140374362');
                              },
                              icon: Icon(Icons.call)),
                          title: Text('${val.reservation[i]['name_pationt']}'),
                          subtitle: Text('${val.reservation[i]['phone']}'),
                          trailing: Text('${val.reservation[i]['date_enter']}'),
                        ),
                      );
                    }),
              )
            : Center(
                child: 
                Center(child: Text('لا يوجد بيانات لعرضها ',style: TextStyle(fontSize: 25,color: Colors.grey),)),
              );
      }),
    );
  }
}
