import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class control extends ChangeNotifier {
  String ip = '192.168.1.2';
  TimeOfDay timestart = TimeOfDay.now();
  TimeOfDay timeend = TimeOfDay.now();
  String timestartnew = '00:00';
  String timeendnew = "00:00";

  late Box idbox = Hive.box("idd");
  late Box f_namebox = Hive.box("f_named");
  late Box s_namebox = Hive.box("s_named");
  late Box phonebox = Hive.box("phoned");
  late Box passbox = Hive.box("passd");
  late Box agebox = Hive.box("aged");
  late Box descriptionbox = Hive.box("descriptiond");
  late Box specialtybox = Hive.box("specialtyd");
  late Box salarybox = Hive.box("salaryd");
  late Box emailbox = Hive.box("emaild");
  late Box citybox = Hive.box("cityd");
  late Box areabox = Hive.box("aread");
  late Box streatbox = Hive.box("streatd");
  late Box build_numbox = Hive.box("build_numd");
  late Box ratingbox = Hive.box("ratingd");

  int gender = 0;

  String day = '';
  List<String> weak = [
    "",
    "السبت",
    "الاحد",
    "الاتنين",
    "الثلاثاء",
    "الاربعاء",
    "الخميس",
    "الجمعه",
  ];

  List<String> specialtys = [
    "",
    "اسنان",
    "اطفال وحديثي الولاده",
    "جلدية",
    "مخ واعصاب",
    "عظام",
    "نساء وتوليد",
    "باطنة",
    "عيون",
    "كبد",
    "كلى",
    "انف وازن وحنجر",
    "جراحة تجميل",
    "قلب واوعية دمويه",
    "الآشعة التداخلية",
    "امراض الدم",
    "اورام",
    "تخسيس وتغذية",
    "نفسي",
    "جراحة اطفال",
    "جراحةأورام",
    "جراحة اوعية دموية",
    "جراحة سمنة ومناظر",
    "جراحة عامة",
    "جراحة عمود فقري",
    "جراحة قلب وصدر",
    "جراحة مخ واعصاب",
    "جهاز هضمي ومناظير",
    "حساسية ومناعة",
    "حقن مجهري واطفال انابيب",
    "ذكورة وعقم",
    "روماتيزم",
    "سكر وغدد صماء",
    "سمعيات",
    "صدر وجهاز تنفسي",
    "طب الاسرة",
    "طب المسنين",
    "طب تقويمي",
    "علاج الآلام",
    "علاج طبيعي واصابات ملاعب",
    "مراكز اشعه",
    "مسالك بوليه",
    "معامل تحاليل",
    "ممارسة عامة",
    "نطق وتخاطب"
  ];
  List<String> citys = [
    "",
    "القاهرة",
    "الجيزة",
    "الأسكندرية",
    "الدقهلية",
    "الشرقية",
    "المنوفية",
    "القليوبية",
    "البحيرة",
    "الغربية",
    "بور سعيد",
    "دمياط",
    "الإسماعلية",
    "السويس",
    "كفر الشيخ",
    "الفيوم",
    "بني سويف",
    "مطروح",
    "شمال سيناء",
    "جنوب سيناء",
    "المنيا",
    "أسيوط",
    "سوهاج",
    "قنا",
    "البحر الأحمر",
    "الأقصر",
    "أسوان",
    "الواحات",
    "الوادي الجديد"
  ];
  int indcity = 0;
  int indspecialty = 0;
  //page signup////////////////////////////////////////////////////
  TextEditingController f_name = new TextEditingController();
  TextEditingController s_name = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  String specialtyt = '';
  String cityt = '';
  TextEditingController phone = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController pass1 = new TextEditingController();
  TextEditingController age = new TextEditingController();
  TextEditingController area = new TextEditingController();
  TextEditingController streat = new TextEditingController();
  TextEditingController build_num = new TextEditingController();
  String genderform = '';

  var datarigester = null;

  void registernew() async {
    datarigester = null;
    String url =
        "http://$ip/doctor/view/signupdoc.php?f_name=${f_name.text}&s_name=${s_name.text}&description=${description.text}&salary=${salary.text}&specialty=${specialtyt}&phone=${phone.text}&email=${email.text}&pass=${pass.text}&age=${age.text}&gender=${genderform}&city=${cityt}&area=${area.text}&streat=${streat.text}&build_num=${build_num.text}";

    try {
      var responseregister = await http.get(Uri.parse(url));
      if (!responseregister.body.isEmpty) {
        var responsebody = jsonDecode(responseregister.body);

        datarigester = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print(datarigester);
    print(datarigester);
    print(datarigester);
    notifyListeners();
  }

  //page signin///////////////////////////////////////////
  TextEditingController phonesignin = new TextEditingController();
  TextEditingController passsignin = new TextEditingController();

  //get account

  var data = null;
  void getdata() async {
    data = null;
    String url =
        "http://$ip/doctor/view/signindoc.php?phone=${phonesignin.text}&pass=${passsignin.text}";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        data = responsebody;
        idbox.put('id', '${data[0]['id']}');
        f_namebox.put('f_name', '${data[0]['f_name']}');
        print('${data[0]['f_name']}');
        print('${data[0]['f_name']}');
        print('${data[0]['f_name']}');
        s_namebox.put('s_name', '${data[0]['s_name']}');
        phonebox.put('phone', '${data[0]['phone']}');
        passbox.put('pass', '${data[0]['pass']}');
        agebox.put('age', '${data[0]['age']}');
        descriptionbox.put('description', '${data[0]['description']}');
        specialtybox.put('specialty', '${data[0]['specialty']}');
        salarybox.put('salary', '${data[0]['salary']}');
        emailbox.put('email', '${data[0]['email']}');
        citybox.put('city', '${data[0]['city']}');
        areabox.put('area', '${data[0]['area']}');
        streatbox.put('streat', '${data[0]['streat']}');
        build_numbox.put('build_num', '${data[0]['number_build']}');
        ratingbox.put('rating', '${data[0]['rating']}');
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  //page profile
  List data_work_time = [
    {'mes': 'not'}
  ];
  void add_work_time() async {
    data_work_time = [
      {'mes': 'not'}
    ];
    String url =
        "http://$ip/doctor/view/add_time_work.php?id_doctor=${idbox.get('id')}&start_time=${timestartnew}&end_time=${timeendnew}&day=$day";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        data_work_time = responsebody;
      }
    } catch (e) {
      print(e);
    }

    get_work_time();

    notifyListeners();
  }

  List data_work_time_get = [];
  void get_work_time() async {
    data_work_time_get = [];
    String url =
        "http://$ip/doctor/view/get_time_work.php?id_doctor=${idbox.get('id')}";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        data_work_time_get = responsebody;
      }
    } catch (e) {
      print("$e");
    }
    print('${data_work_time_get}');

    notifyListeners();
  }

  void changecity(i) {
    indcity = i;
    cityt = citys[i];
    notifyListeners();
  }

  void changespecialty(i) {
    indspecialty = i;
    specialtyt = specialtys[i];
    notifyListeners();
  }

  void chosegender(String type) {
    if (type == 'male') {
      genderform = type;
      gender = 1;
    }
    if (type == 'fmale') {
      genderform = type;
      gender = 2;
    }
    notifyListeners();
  }

  /////////////////////////////////////////////////////////////////////////////
  void chosestarttime(String x) {
    timestartnew = x;
    notifyListeners();
  }

  void choseendtime(String x) {
    timeendnew = x;
    notifyListeners();
  }

  int indday = 0;
  choseday(int x) {
    indday = x;
    day = weak[x];

    notifyListeners();
  }

  int idday = 0;
  changeidday(int x) {
    idday = x;
    notifyListeners();
  }

  List delet = [
    {'mes': 'not'}
  ];
  void delet_work_time() async {
    delet = [
      {'mes': 'not'}
    ];
    String url =
        "http://$ip/doctor/view/get_time_work.php?id_doctordelet=${idbox.get('id')}&id_day=${data_work_time_get[idday]['id']}";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        delet = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('${delet}');
    get_work_time();

    notifyListeners();
  }

  TextEditingController post = new TextEditingController();
  List postlist = [
    {'mes': 'not'}
  ];
  //////share to page home profile
  void addpost() async {
    postlist = [
      {'mes': 'not'}
    ];
    String url =
        "http://$ip/doctor/view/add_post_doc.php?id_doctor=${idbox.get('id')}&f_name=${f_namebox.get('f_name')}&s_name=${s_namebox.get('s_name')}&post=${post.text}";
    post.text = '';
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        postlist = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('${postlist}');
    getmypost();
    getallposts();

    notifyListeners();
  }

  List myposts = [];
  void getmypost() async {
    myposts = [];
    String url =
        "http://$ip/doctor/view/add_post_doc.php?id_doctor=${idbox.get('id')}&get=get";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        myposts = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('${myposts}');

    notifyListeners();
  }

  int idpost = 0;
  takeidofpost(int i) {
    idpost = myposts[i]['id'];
    notifyListeners();
  }

  List postsdelet = [
    {'mes': 'not'}
  ];
  void deletmypost() async {
    postsdelet = [
      {'mes': 'not'}
    ];
    String url =
        "http://$ip/doctor/view/add_post_doc.php?id_doctor=${idbox.get('id')}&id_post=$idpost";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        postsdelet = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('${postsdelet}');
    getmypost();
    getallposts();

    notifyListeners();
  }

  //page home doctor

  List posts = [];
  int indexendpost = 1;
  void getallposts() async {
    //posts = [];
    String url = "http://$ip/doctor/view/get_all_posts.php?id=$indexendpost";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        //posts.add(responsebody);
        for (var post in responsebody) {
          posts.add(post);
        }
      }
    } catch (e) {
      print(e);
    }
    print('${posts}');
    //changeIconlike();
    notifyListeners();
  }

  //page profile doctor visit ///////////////////////////////
  int id_doctor = 0;
  getiddoctor(int i) {
    id_doctor = int.parse(posts[i]['id_doctor']);
  }

  List datadoctor = [
    {'mes': 'not'}
  ];
  void getdatadoctorvesitprofile() async {
    datadoctor = [
      {'mes': 'not'}
    ];
    String url = "http://$ip/doctor/view/signindoc.php?id=$id_doctor";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        datadoctor = responsebody;
      }
    } catch (e) {
      print(e);
    }

    print('${datadoctor}');
    notifyListeners();
  }

  void get_work_time_profile_doctor_visit() async {
    data_work_time_get = [
      {'mes': 'not'}
    ];
    String url =
        "http://$ip/doctor/view/get_time_work.php?id_doctor=${id_doctor.toString()}";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        data_work_time_get = responsebody;
      }
    } catch (e) {
      print("$e");
    }
    print('${data_work_time_get}');

    notifyListeners();
  }

  List post_visit = [];
  void getpost_profile_doctor_visit() async {
    post_visit = [];
    String url =
        "http://$ip/doctor/view/add_post_doc.php?id_doctor=${id_doctor.toString()}&get=get";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        post_visit = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('post');
    print('${post_visit}');
    print('post');

    notifyListeners();
  }

  //add pationt page profolr visit doctor

  String date = '';
  TextEditingController namepationt = new TextEditingController();
  TextEditingController phonepationt = new TextEditingController();
  TextEditingController agepationt = new TextEditingController();
  enterdatapationt() {
    namepationt.text = '${f_namebox.get('f_name')} ${s_namebox.get('s_name')}';
    phonepationt.text = '${phonebox.get('phone')}';
    agepationt.text = '${agebox.get('age')}';
    date = '';
    notifyListeners();
  }

  changedatepationt() {
    date = date;
    notifyListeners();
  }

  List checkaddpationt = [
    {'mes': 'not'}
  ];

  //page quistion ////////////////////////////////////////////////
  List quistion = [];
  int indexendquistion = 1;
  void getallquistion() async {
    //posts = [];
    String url =
        "http://$ip/doctor/view/getallquistion.php?id=$indexendquistion";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        //posts.add(responsebody);
        for (var quis in responsebody) {
          quistion.add(quis);
        }
      }
    } catch (e) {
      print(e);
    }
    print('${quistion}');
    //changeIconlike();
    notifyListeners();
  }

  int idquistion = 0;
  String id_pationt = '';
  getidquistion(int i) {
    idquistion = quistion[i]['id'];
    id_pationt = quistion[i]['id_pationt'];

    notifyListeners();
    getcommentpost();
  }

  TextEditingController comment = new TextEditingController();
  List checkaddcomment = [
    {"mes": "not"}
  ];
  void addcomments() async {
    checkaddcomment = [
      {"mes": "not"}
    ];
    String url =
        "http://$ip/doctor/view/comment.php?id_doctor=${idbox.get('id')}&id_pationt=$id_pationt&f_name=${f_namebox.get('f_name')}&s_name=${s_namebox.get('s_name')}&id_post=$idquistion&comment=${comment.text}";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        checkaddcomment = responsebody;
      }
    } catch (e) {
      print(e);
    }
    comment.text = '';
    print('${checkaddcomment}');

    notifyListeners();
  }

  List Comments = [];
  getcommentpost() async {
    Comments = [];
    String url =
        "http://$ip/doctor/view/comment.php?id_posts=${idquistion.toString()}";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        Comments = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('object');
    print('$Comments');
    notifyListeners();
  }

  getiddoctorfromcomment(int i) {
    id_doctor = int.parse(Comments[i]['id_doctor']);
  }

  //this function in page profile doctor visit but take it her becouse it not work
  addpationt() async {
    checkaddpationt = [
      {'mes': 'not'}
    ];
    if (date != '' && namepationt != '' && phonepationt != '') {
      String url =
          "http://$ip/doctor/view/addpationt.php?id_pationt=${idbox.get('id')}&id_doctor=${datadoctor[0]['id']}&name_doctor=${datadoctor[0]['f_name']} ${datadoctor[0]['s_name']}&namepationt=${namepationt.text}&phonepationt=${phonepationt.text}&agepationt=${agepationt.text}&date=$date";

      try {
        var response = await http.get(Uri.parse(url));
        if (!response.body.isEmpty) {
          var responsebody = jsonDecode(response.body);
          checkaddpationt = responsebody;
        }
      } catch (e) {
        print(e);
      }
    }
    print('${checkaddpationt}');

    notifyListeners();
  }

  //page notifiction
  List reservation = [];

  void getpationtreservation() async {
    reservation = [];
    String url =
        "http://$ip/doctor/view/addpationt.php?id_doc=${idbox.get('id').toString()}";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        reservation = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('${reservation}');

    notifyListeners();
  }

  //make call phone
  call(String number) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '$number',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('error');
    }
  }

  List numberpationttoday = [
    {'mes': 0}
  ];
  void getnumberpationttoday() async {
    numberpationttoday = [
      {'mes': 0}
    ];
    String url =
        "http://$ip/doctor/view/addpationt.php?id_doct=${idbox.get('id').toString()}";
    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        numberpationttoday = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print('number');
    print('${numberpationttoday}');

    notifyListeners();
  }

  //page profile logout
  logout() {
    idbox.put('id', '');
    f_namebox.put('f_name', '');
    s_namebox.put('s_name', '');
    phonebox.put('phone', '');
    passbox.put('pass', '');
    agebox.put('age', '');
    descriptionbox.put('description', '');
    specialtybox.put('specialty', '');
    salarybox.put('salary', '');
    emailbox.put('email', '');
    citybox.put('city', '');
    areabox.put('area', '');
    streatbox.put('streat', '');
    build_numbox.put('build_num', '');
    ratingbox.put('rating', '');
  }

  //page update data doctor
  inputupdate() {
    f_name.text = f_namebox.get('f_name');
    s_name.text = s_namebox.get('s_name');
    description.text = descriptionbox.get('description');
    salary.text = salarybox.get('salary');
    specialtyt = specialtybox.get('specialty');
    cityt = citybox.get('city');
    email.text = emailbox.get('email');
    age.text = agebox.get('age');
    area.text = areabox.get('area');
    streat.text = streatbox.get('streat');
    build_num.text = build_numbox.get('build_num');
  }

  List update = [
    {'mes': 'not'}
  ];
  void update_data_doctor() async {
    update = [
      {'mes': 'not'}
    ];
    datarigester = null;
    String url =
        "http://$ip/doctor/view/signupdoc.php?id=${idbox.get('id')}&f_name=${f_name.text}&s_name=${s_name.text}&description=${description.text}&salary=${salary.text}&specialty=${specialtyt}&email=${email.text}&age=${age.text}&city=${cityt}&area=${area.text}&streat=${streat.text}&build_num=${build_num.text}";

    try {
      var responseregister = await http.get(Uri.parse(url));
      if (!responseregister.body.isEmpty) {
        var responsebody = jsonDecode(responseregister.body);

        update = responsebody;
      }
    } catch (e) {
      print(e);
    }
    print(update);
    updatedatahive();
    notifyListeners();
  }

  void updatedatahive() async {
    data = null;
    String url =
        "http://$ip/doctor/view/signindoc.php?phone=${phonebox.get('phone')}&pass=${passbox.get('pass')}";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        data = responsebody;
        idbox.put('id', '${data[0]['id']}');
        f_namebox.put('f_name', '${data[0]['f_name']}');
        print('${data[0]['f_name']}');
        print('${data[0]['f_name']}');
        print('${data[0]['f_name']}');
        s_namebox.put('s_name', '${data[0]['s_name']}');
        phonebox.put('phone', '${data[0]['phone']}');
        passbox.put('pass', '${data[0]['pass']}');
        agebox.put('age', '${data[0]['age']}');
        descriptionbox.put('description', '${data[0]['description']}');
        specialtybox.put('specialty', '${data[0]['specialty']}');
        salarybox.put('salary', '${data[0]['salary']}');
        emailbox.put('email', '${data[0]['email']}');
        citybox.put('city', '${data[0]['city']}');
        areabox.put('area', '${data[0]['area']}');
        streatbox.put('streat', '${data[0]['streat']}');
        build_numbox.put('build_num', '${data[0]['number_build']}');
        ratingbox.put('rating', '${data[0]['rating']}');
      }
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }

  var rating = null;
  void getrating() async {
    rating = null;
    String url =
        "http://$ip/doctor/view/signindoc.php?phone=${phonebox.get('phone')}&pass=${passbox.get('pass')}";

    try {
      var response = await http.get(Uri.parse(url));
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);

        rating = responsebody;
        ratingbox.put('rating', '${rating[0]['rating']}');
      }
    } catch (e) {
      print(e);
    }
    print('good');
    print('${rating}');
    notifyListeners();
  }
}
