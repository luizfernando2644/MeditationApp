import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  List listArr = [
    {
      "image": "/img/mu1.png",
      "title": "Ilha da Noite",
      "subtitle": "45 MIN . Musica para dormir"
    },
    {
      "image": "/img/mu2.png",
      "title": "Doce sono",
      "subtitle": "45 MIN . Musica para dormir"
    },
    {
      "image": "/img/mu3.png",
      "title": "Boa noite",
      "subtitle": "45 MIN . Musica para dormir"
    },
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
    {
      "image": "/img/mu1.png",
      "title": "Doce sono",
      "subtitle": "45 MIN . Musica para dormir"
    },
    {
      "image": "/img/mu4.png",
      "title": "Boa noite",
      "subtitle": "45 MIN . Musica para dormir"
    },
    {
      "image": "/img/mu3.png",
      "title": "Nuvens lunares",
      "subtitle": "45 MIN . Musica para dormir"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.sleep,
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "Music",
          style: TextStyle(
            color: TColor.sleepText,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.08),
        itemBuilder: (context, index) {
          var cObj = listArr[index];
          return Column(
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
          );
        },
        itemCount: listArr.length,
      ),
    );
  }
}
