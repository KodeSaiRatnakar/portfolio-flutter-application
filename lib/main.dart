import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Color themeColor = const Color(0xff1D4ED8);
double drawer_width = 0.0;
late BuildContext pop_context;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sai Ratnakar Portfolio Web App",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> select_navigation_items = [true, false, false, false, false];
  int _index = 0;

  void fun(int index) {
    for (int i = 0; i < 5; i++) {
      i == index
          ? select_navigation_items[index] = true
          : select_navigation_items[i] = false;
    }

    setState(() {
      index = _index;
      select_navigation_items;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    Color themeColor = const Color(0xff1D4ED8);
    double skill_opacity = 0.4;
    return Scaffold(
      drawer: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mediaSize.height * 0.1,
            ),
            navigationBar(
                "Home", select_navigation_items[0], fun, 0, mediaSize, context),
            navigationBar("Skills", select_navigation_items[1], fun, 1,
                mediaSize, context),
            navigationBar("Projects", select_navigation_items[2], fun, 2,
                mediaSize, context),
            navigationBar("Education", select_navigation_items[3], fun, 3,
                mediaSize, context),
            navigationBar("Personal Details", select_navigation_items[4], fun,
                4, mediaSize, context),
          ],
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        return CustomPaint(
          foregroundPainter: Custom_painter(
              x: 0.002, y: 0.9, r: 0.3, color: Color(0xff1D4ED8)),
          child: Column(
            children: [
              SizedBox(
                height: mediaSize.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (mediaSize.width > 750)
                    Row(
                      children: [
                        navigationBar("Home", select_navigation_items[0], fun,
                            0, mediaSize, context),
                        navigationBar("Skills", select_navigation_items[1], fun,
                            1, mediaSize, context),
                        navigationBar("Projects", select_navigation_items[2],
                            fun, 2, mediaSize, context),
                        navigationBar("Education", select_navigation_items[3],
                            fun, 3, mediaSize, context),
                        navigationBar(
                            "Personal Details",
                            select_navigation_items[4],
                            fun,
                            4,
                            mediaSize,
                            context)
                      ],
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xff1D4ED8),
                            size: 32,
                          )),
                    ),
                  const Padding(
                    padding: EdgeInsets.all(19.0),
                    child: Text(
                      "Sai Ratnakar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color(0xff1D4ED8)),
                    ),
                  ),
                ],
              ),
              Visibility(
                  visible: select_navigation_items[0],
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: mediaSize.height * 0.3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Hi !\nI am Sai Ratnakar",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: themeColor,
                                fontSize: mediaSize.width > 700 ? 50 : 30,
                                fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              fun(1);
                            },
                            onHover: (is_hover) {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: themeColor.withOpacity(0.4)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, bottom: 0, left: 9, right: 9),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/skills.png?alt=media&token=83c72276-65c9-455f-9fbd-42f3288ed9fb"))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Skills",
                                        style: TextStyle(
                                            color: themeColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              fun(2);
                            },
                            onHover: (is_hover) {},
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 0, left: 8, right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: themeColor.withOpacity(0.4)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/projext.png?alt=media&token=fb548fa8-9c3d-45d9-88ae-56ede7c7c306"))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Projects",
                                      style: TextStyle(
                                          color: themeColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))),
              Visibility(
                  visible: select_navigation_items[1],
                  child: centerPage(
                      "Skills",
                      mediaSize,
                      Wrap(children: [
                        customText("Flutter"),
                        customText("Python"),
                        customText("Core Java"),
                        customText("Java Script"),
                        customText("HTML"),
                        customText("AWS")
                      ]))),
              Visibility(
                  visible: select_navigation_items[2],
                  child: Center(child: projectTabView(mediaSize))),
              Visibility(
                  visible: select_navigation_items[3],
                  child: educationTab(mediaSize)),
              Visibility(
                visible: select_navigation_items[4],
                child: personalDetails(mediaSize),
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget navigationBar(String data, bool is_selected, Function fun, index,
    Size mediaSize, BuildContext pop_conte) {
  drawer_width = mediaSize.width;
  pop_context = pop_conte;
  return GestureDetector(
    onTap: () {
      fun(index);
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: is_selected
            ? BoxDecoration(
                color: Color(0xffe6ebff),
                border: Border.all(width: 2.5, color: const Color(0xff1D4ED8)),
                borderRadius: BorderRadius.circular(5))
            : const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            data,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff1D4ED8)),
          ),
        ),
      ),
    ),
  );
}

Widget centerPage(String title, Size mediaSize, Widget widget) {
  return Container(
      height: mediaSize.height * 0.75,
      width: mediaSize.width * 0.65,
      decoration: BoxDecoration(
          color: const Color(0xffB1C4F8),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff1D4ED8)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: mediaSize.height > mediaSize.width
                  ? mediaSize.height * 0.02
                  : mediaSize.height * 0.1,
              horizontal: 20),
          child: Container(
              width: double.maxFinite,
              height: mediaSize.height > mediaSize.width
                  ? mediaSize.height * 0.55
                  : mediaSize.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(child: widget)),
        )
      ])));
}

class Custom_painter extends CustomPainter {
  final double x;
  final double y;
  final double r;
  final Color color;

  Custom_painter(
      {required this.x, required this.y, required this.r, required this.color});

  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    Path path = Path();

    canvas.drawCircle(
        Offset(size.width > 450 ? size.width * x : 15,
            size.width > 450 ? size.height * y : size.height * 1.1),
        size.width > 450 ? size.height * r : 220,
        paint);

    canvas.drawCircle(
        Offset(size.width > 450 ? size.width * 1.03 : size.width * 1.25,
            size.height * 0.45),
        size.height * r * 0.55,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

Widget customText(String text) {
  Map<String, String> dic = {
    "AWS":
        "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/aws.png?alt=media&token=7d567c9a-5a02-4484-9c27-9f8c50641b92",
    "Flutter":
        "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/flutter.png?alt=media&token=9b39b3cd-8a14-4283-ac6e-5a4350787fde",
    "Python":
        "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/python.png?alt=media&token=6e001768-3062-4a19-b448-189e2311044a",
    "Core Java":
        "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/corejava.png?alt=media&token=07989537-2e5b-4f99-bba7-276c2b36749c",
    "Java Script":
        "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/javascript.png?alt=media&token=2af5545a-f682-4946-a9ba-f5f8922b921f",
    "HTML":
        "https://firebasestorage.googleapis.com/v0/b/sairatnakarportfolio.appspot.com/o/html.png?alt=media&token=3a3936b3-9d20-47e2-860a-f4a473b90021"
  };
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("${dic[text]}"))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: const TextStyle(
                color: Color(0xff1D4ED8),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget personalDetails(Size mediaSize) {
  Color themeColor = const Color(0xff1D4ED8);
  return Padding(
    padding: EdgeInsets.only(
        top: (mediaSize.height < mediaSize.width) ? 25 : 0,
        right: 0,
        left: 0,
        bottom: 0),
    child: Center(
      child: Container(
        height: mediaSize.height * 0.75,
        width: mediaSize.width * 0.65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: themeColor.withOpacity(0.2)),
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              personalDetailsText("Name : Kode Sai Ratnakar", mediaSize),
              personalDetailsText("Date of Birth : 13-1-2000", mediaSize),
              personalDetailsText("Father Name : Kode Prasad", mediaSize),
              personalDetailsText("Mother Name  : Padma", mediaSize),
              personalDetailsText("Nationality : Indian", mediaSize),
              personalDetailsText("Blood Group : B-Positive", mediaSize),
              personalDetailsText("sairatnakar20@gmail.com", mediaSize),
              personalDetailsText("Phone No : 8247572140", mediaSize),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget personalDetailsText(String inputString, Size mediaSize) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
    child: Container(
      width: mediaSize.width > 400 ? mediaSize.width * 0.22 : 200,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            inputString,
            style: TextStyle(
                fontSize: mediaSize.width > 400 ? 19 : 12,
                fontWeight: FontWeight.bold,
                color: themeColor),
          ),
        ),
      ),
    ),
  );
}

Widget educationTab(Size mediaSize) {
  TextStyle ts =
      TextStyle(color: themeColor, fontWeight: FontWeight.bold, fontSize: 15);
  return Center(
    child: Container(
        height: mediaSize.height * 0.8,
        width: mediaSize.width * 0.6,
        child: ListView(
          children: [
            Container(
              height: mediaSize.height * 0.35,
              width: mediaSize.width * 0.3,
              decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  educationDetailsText("10th Class", mediaSize),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: mediaSize.width > mediaSize.height
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Scholl Name : Bhasyam High School",
                            style: ts),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Score : 9.7 GPA",
                          style: ts,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Accademic Year : 2015-2016",
                          style: ts,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: mediaSize.height * 0.35,
              width: mediaSize.width * 0.3,
              decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  educationDetailsText("Diploma", mediaSize),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: mediaSize.width > mediaSize.height
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "College Name : S.M.V.M Polytechnic College",
                            style: ts),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Score : 87 %",
                          style: ts,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Accademic Year : 2016-2019",
                          style: ts,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Branch : Mechanical Engineering",
                          style: ts,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: mediaSize.height * 0.35,
              width: mediaSize.width * 0.3,
              decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  educationDetailsText("B.Tech", mediaSize),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: mediaSize.width > mediaSize.height
                        ? WrapAlignment.center
                        : WrapAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "College Name : Sri Vasavi Engineering College",
                            style: ts),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Score : 7.4 GPA",
                          style: ts,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Accademic Year : 2019-2022",
                          style: ts,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Branch : Mechanical Engineering",
                          style: ts,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )),
  );
}

Widget educationDetailsText(String inputString, Size mediaSize) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 8, left: 8, right: 8),
    child: Container(
      width: mediaSize.width > 400 ? mediaSize.width * 0.22 : 150,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            inputString,
            style: TextStyle(
                fontSize: mediaSize.width > 400 ? 19 : 12,
                fontWeight: FontWeight.bold,
                color: themeColor),
          ),
        ),
      ),
    ),
  );
}

Widget projectTabView(Size mediaSize) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 0, left: 0, right: 0),
    child: Container(
      height: mediaSize.height < mediaSize.width
          ? mediaSize.height * 0.7
          : mediaSize.height * 0.8,
      width: mediaSize.height < mediaSize.width
          ? mediaSize.width * 0.54
          : mediaSize.width * 0.8,
      child: CarouselSlider(
        items: [
          projectSkillTabs(mediaSize, "Flutter"),
          projectSkillTabs(mediaSize, "Python")
        ],
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            aspectRatio: 1.2,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height),
      ),
    ),
  );
}

Widget projectSkillTabs(Size mediaSize, String text) {
  Map<String, Widget> dic = {
    "Flutter": flutterProjectTab(mediaSize),
    "Python": pythonProjectTab(mediaSize),
  };
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: mediaSize.height < mediaSize.width
            ? mediaSize.height * 0.7
            : mediaSize.height * 0.8,
        width: mediaSize.height < mediaSize.width
            ? mediaSize.width * 0.54
            : mediaSize.width * 0.8,
        decoration: BoxDecoration(
            color: themeColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              educationDetailsText(text, mediaSize),
              Padding(
                padding: EdgeInsets.only(
                  left: mediaSize.width > mediaSize.height
                      ? mediaSize.height * 0.1
                      : 5,
                  right: 0,
                  top: 10,
                  bottom: 0,
                ),
                child: dic[text] as Widget,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget flutterProjectTab(Size mediaSize) {
  TextStyle ts =
      TextStyle(color: themeColor, fontWeight: FontWeight.bold, fontSize: 15);
  return Container(
    child: Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 13, left: 8, right: 8),
          child: Row(
            children: [
              Text(
                "1. Portfolio Web App",
                style: ts,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                mediaSize.width > mediaSize.height
                    ? "2. Village Interest Calculator"
                    : "2. Village Interest \nCalculator",
                style: ts,
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () {
                    launchUrl(
                        Uri.parse(
                            "https://github.com/KodeSaiRatnakar/Village-Interest-Calculator-and-Manger"),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: Icon(
                    Icons.open_in_new,
                    color: Colors.white.withOpacity(0.8),
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                mediaSize.width > mediaSize.height
                    ? "3. Get Money From Brave Rewards"
                    : "3. Get Money From \nBrave Rewards",
                style: ts,
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () {
                    launchUrl(
                        Uri.parse(
                            "https://get-money-from-brave-reward.web.app/#/"),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: Icon(
                    Icons.open_in_new,
                    color: Colors.white.withOpacity(0.8),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

Widget pythonProjectTab(Size mediaSize) {
  TextStyle ts =
      TextStyle(color: themeColor, fontWeight: FontWeight.bold, fontSize: 15);
  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                mediaSize.width > mediaSize.height
                    ? "1. Python Bot to Automate Repeating Tasks"
                    : "1. Python Bot \nto Automate \n  Repeating Tasks",
                textAlign: TextAlign.center,
                style: ts,
              ),
              IconButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://toolstoearnbat.web.app/#/"),
                        mode: LaunchMode.platformDefault);
                  },
                  icon: Icon(
                    Icons.open_in_new,
                    color: Colors.white.withOpacity(0.8),
                  ))
            ],
          ),
        ),
      ],
    ),
  );
}
