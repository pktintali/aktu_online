import 'package:flutter/material.dart';
import 'Web.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AKTU Online',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      upperBound: 30,
      lowerBound: 15,
    );
    animation = ColorTween(begin: Colors.transparent, end: Colors.pink)
        .animate(controller);
    controller.forward();

   controller.addStatusListener((status){
    if(controller.isCompleted)
    {
      controller.reverse();
    }
    else if(controller.isDismissed){
      controller.forward();
    }
   });
    controller.addListener(() {
      //print(controller.value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: #FFEBEE,
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0xFF992C29),
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 55, bottom: 5),
                      child: Text(
                        'AKTU Online',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Text(
                      'Making Life Simple',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28, bottom: 5),
                  child: Center(
                    child: Image.asset('images/uptu_logo.png',height: controller.value*5,),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Material(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                childAspectRatio: 1,
                children: <Widget>[
                  mainCard(
                      img: 'images/Attendance.jpg',
                      text: 'Attendance',
                      url: 'https://erp.aktu.ac.in/Login.aspx'),
                  mainCard(
                      img: 'images/Certificate.jpg',
                      text: 'Result',
                      url:
                          'https://erp.aktu.ac.in/webpages/oneview/oneview.aspx'),
                  mainCard(
                      img: 'images/AdmitCard.png',
                      text: 'Admit Card',
                      url:
                          'https://erp.aktu.ac.in/webpages/public/examination/PrintAdmitCard.aspx'),
                  mainCard(
                      img: 'images/ExamForm.png',
                      text: 'Syllabus',
                      url: 'https://aktu.ac.in/syllabus%202019-2020.html'),
                  mainCard(
                      img: 'images/Challeng.png',
                      text: 'Recheck',
                      url:
                          'https://erp.aktu.ac.in/webpages/public/students/reevaluationsummary.aspx'),
                  mainCard(
                      img: 'images/Questions.png',
                      text: 'Q. Paper',
                      url: 'https://abesit.in/library/question-paper-bank/'),
                  mainCard(
                      img: 'images/circulars.png',
                      text: 'Circulars',
                      url: 'https://aktu.ac.in/circulars.html'),
                  // mainCard(
                  //     img: 'images/GLBajaj.jpg',
                  //     text: 'Sim Login',
                  //     url: 'http://sim.glbitm.org/ISIMGLB/LOGIN'),
                      mainCard(
                      img: 'images/uptu_logo.png',
                      text: 'Visit Site',
                      url: 'https://aktu.ac.in/'),
                  mainCard(
                      img: 'images/News.png',
                      text: 'Edu. News',
                      url:
                          'https://m.thehindubusinessline.com/news/education/#'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainCard({String text, String url, String img}) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(controller.value),
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WebViewExample(url)));
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Image.asset(img),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
