import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes_life/global.dart';
import 'package:screenshot/screenshot.dart';

class Detail_Page extends StatefulWidget {
  const Detail_Page({super.key});

  @override
  State<Detail_Page> createState() => _Detail_PageState();
}

int val = 0;
Uint8List? _imageFile;
ScreenshotController screenshotController = ScreenshotController();

class _Detail_PageState extends State<Detail_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    val = 0;
  }

  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text("$res"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          int i = 0;
          if (global.count1 == 0) {
            i = index;
          } else if (global.count1 == 1) {
            i = index;
          } else if (global.count1 == 2) {
            i = (index + 10);
          } else if (global.count1 == 3) {
            i = (index + 20);
          } else if (global.count1 == 4) {
            i = (index + 30);
          } else if (global.count1 == 5) {
            i = (index + 40);
          }
          print(i);
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            elevation: 15,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    global.count = [index, i];
                    Navigator.of(context).pushNamed('image_detail_page');
                  },
                  child: Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          child: Image.network(
                            '${global.images![i + val].Image}',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Text("${global.quotes[i]}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              overflow: TextOverflow.visible,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            val++;
                          },
                          child: isRow(image: 'assets/stcak.png'),
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: "${global.quotes[i]}"));
                          },
                          child: isRow(image: 'assets/copy.png'),
                        ),
                        InkWell(
                          onTap: () async {},
                          child: isRow(image: 'assets/929539.png'),
                        ),
                        InkWell(
                          onTap: () async {},
                          child: isRow(image: 'assets/downlod.png'),
                        ),
                        InkWell(
                          onTap: () {},
                          child: isRow(image: "assets/star.png"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget isRow({required String image}) {
    return Image.asset(
      "$image",
      width: 40,
    );
  }
}
