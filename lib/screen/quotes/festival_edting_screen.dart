import 'dart:ui';
import 'package:festival_app/screen/model/festival_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class FestivalScreen extends StatefulWidget {
  const FestivalScreen({super.key});

  @override
  State<FestivalScreen> createState() => _FestivalScreenState();
}

class _FestivalScreenState extends State<FestivalScreen> {
  Color selected = Colors.black;
  bool textsOn = false;
  bool colorOn = false;
  bool imageOn = false;
  bool boldOn = false;
  bool italicOn = false;
  bool underline = false;

  List textList = ['Kanit', 'OpenSans', 'OpenSans2', 'Poppins', 'Sevillana'];
  String textstyle = 'Sevillana';
  String imagePart = "assets/image/img1.jpg";
  List imageList = [
    "assets/image/img1.jpg",
    "assets/image/img2.jpg",
    "assets/image/img3.jpg",
    "assets/image/img4.jpg",
    "assets/image/img5.jpg",
    "assets/image/img6.avif",
    "assets/image/img7.avif",
    "assets/image/img8.jpg",
    "assets/image/img9.png",
    "assets/image/img10.png",
  ];
  FontStyle style = FontStyle.normal;
  FontWeight bold = FontWeight.normal;
  TextDecoration line = TextDecoration.underline;
  TextAlign center1 = TextAlign.center;
  GlobalKey repaint=GlobalKey();

  @override
  Widget build(BuildContext context) {
    festivalModel model =
        ModalRoute.of(context)!.settings.arguments as festivalModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        title: Text("edting"),
      ),
      body: Column(
        children: [
          RepaintBoundary(
            key: repaint,
            child: Container(
              margin: EdgeInsets.all(10),
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.red.shade200,
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage(imagePart),
                    fit: BoxFit.cover,
                    height: 310,
                    width: 400,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${model.quotes}",
                          style: TextStyle(
                              fontFamily: textstyle,
                              fontSize: 25,
                              color: selected,
                              fontStyle: style,
                              fontWeight: bold),
                          textAlign: center1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                    onPressed: () {}, icon: Icon(Icons.text_fields)),
                IconButton.filled(
                    onPressed: () {
                      setState(() {
                        textsOn = !textsOn;
                        colorOn = false;
                        imageOn = false;
                      });
                    },
                    icon: Icon(Icons.text_format)),
                IconButton.filled(
                    onPressed: () {
                      setState(() {
                        colorOn = !colorOn;
                        textsOn = false;
                        imageOn = false;
                      });
                    },
                    icon: Icon(Icons.color_lens)),
                IconButton.filled(
                    onPressed: () {
                      setState(() {
                        imageOn = !imageOn;
                        textsOn = false;
                        colorOn = false;
                      });
                    },
                    icon: Icon(Icons.image)),
                IconButton.filled(
                    onPressed: () {
                      setState(() async {
                   RanderRepaintBoundary boundary=repaint.currentContext!.findRenderObject() as RanderRepaintBoundary;


                      });
                    },
                    icon: Icon(Icons.save_alt)),
                IconButton.filled(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
          ),
          Visibility(
            visible: textsOn,
            child: Expanded(
              child: ListView.builder(
                itemCount: textList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        textstyle = textList[index];
                      });
                    },
                    child: const Center(
                        child: Text(
                      "enter the font style",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    )),
                  );
                },
              ),
            ),
          ),
          Visibility(
              visible: colorOn,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemCount: Colors.primaries.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selected = selected = Colors.primaries[index];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.primaries[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
          Visibility(
              visible: imageOn,
              child: Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            imagePart = imageList[index];
                          });
                        },
                        child: Container(
                          child: Image(
                            image: AssetImage("${imageList[index]}"),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.filled(
                      onPressed: () {
                        setState(() {
                          bold = FontWeight.bold;
                        });
                      },
                      icon: Icon(Icons.format_bold)),
                  IconButton.filled(
                      onPressed: () {
                        setState(() {
                          line = TextDecoration.underline;
                        });
                      },
                      icon: Icon(Icons.format_underline)),
                  IconButton.filled(
                      onPressed: () {
                        setState(() {
                          style = FontStyle.italic;
                        });
                      },
                      icon: Icon(Icons.format_italic)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                  onPressed: () {
                    setState(() {
                      center1 = TextAlign.center;
                    });
                  },
                  icon: Icon(Icons.format_align_center)),
              IconButton.filled(
                  onPressed: () {
                    setState(() {
                      center1 = TextAlign.left;
                    });
                  },
                  icon: Icon(Icons.format_align_left)),
              IconButton.filled(
                  onPressed: () {
                    setState(() {
                      center1 = TextAlign.right;
                    });
                  },
                  icon: Icon(Icons.format_align_right)),
            ],
          )
        ],
      ),
    );
  }
}

class RanderRepaintBoundary {
}
