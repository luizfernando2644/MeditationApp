import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/round_button.dart';

class SleepStoriesDetailScreen extends StatefulWidget {
  const SleepStoriesDetailScreen({super.key});

  @override
  State<SleepStoriesDetailScreen> createState() =>
      _SleepStoriesDetailScreenState();
}

class _SleepStoriesDetailScreenState extends State<SleepStoriesDetailScreen> {
  List listArr = [
    {
      "image": "/img/mu4.png",
      "title": "Nuvens lunares",
      "subtitle": "45 MIN . Musica para dormir"
    },
    {
      "image": "/img/mu2.png",
      "title": "Ilha da Noite",
      "subtitle": "45 MIN . Musica para dormir"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.sleep,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              backgroundColor: TColor.sleep,
              leading: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Image.asset(
                    "/img/back_white.png",
                    width: 55,
                    height: 55,
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "/img/fav_button.png",
                    width: 45,
                    height: 45,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "/img/download_button.png",
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child: Image.asset(
                  "/img/sleep_detail_top.png",
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              )),
              expandedHeight: context.width * 0.6,
            )
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Ilha da Noite",
                      style: TextStyle(
                          color: TColor.sleepText,
                          fontSize: 34,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "45 MIN . Musica para dormir",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Facilite a mente para uma noite de sono tranquila com estas musicas profundas e suaves.",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "/img/fav.png",
                          width: 20,
                          height: 20,
                          color: TColor.sleepText,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "24.234 Favoritos",
                            style: TextStyle(
                                color: TColor.sleepText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Image.asset(
                          "/img/headphone.png",
                          width: 20,
                          height: 20,
                          color: TColor.sleepText,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "34.234 Audição",
                            style: TextStyle(
                                color: TColor.sleepText,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Divider(
                      height: 2,
                      color: TColor.sleepText.withOpacity(0.3),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Relacionada",
                      style: TextStyle(
                          color: TColor.sleepText,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.08,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  var cObj = listArr[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            cObj["image"],
                            width: double.maxFinite,
                            height: context.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          cObj["title"],
                          maxLines: 1,
                          style: TextStyle(
                              color: TColor.sleepText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          cObj["subtitle"],
                          maxLines: 1,
                          style: TextStyle(
                            color: TColor.sleepText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: listArr.length,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundButton(title: "Play", onPressed: () {}),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
