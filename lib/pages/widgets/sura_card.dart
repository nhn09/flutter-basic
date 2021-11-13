import 'package:flutter/material.dart';
import 'package:flutter_application_api/model/eachSurah.dart';
import 'package:flutter_application_api/model/eashsura.api.dart';
import 'package:flutter_application_api/pages/widgets/each.dart';

class SuraCard extends StatelessWidget {
  final String? title;
  final String? meaning;
  final String? verses;
  final int? id;
  final String? revealed;
  final String? thumbnailUrl;
  SuraCard({
    this.title = '',
    this.id = 0,
    this.revealed = '',
    this.meaning = '',
    this.verses = "0",
    this.thumbnailUrl =
        "https://media.istockphoto.com/photos/quran-in-the-mosque-picture-id1196261399?b=1&k=20&m=1196261399&s=170667a&w=0&h=7rvk8Fe-R27W8jYPF0wTf5OZNym12Jah_9zYoD4BzFY=",
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped ${id!} Container");
        Future<InsideSurah?>? _insideSurah;
        EachSuraAPI.setter(id!);
        _insideSurah = EachSuraAPI.getInsideSurah();

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Details()));
        print(_insideSurah);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(
                "https://media.istockphoto.com/photos/quran-in-the-mosque-picture-id1196261399?k=20&m=1196261399&s=612x612&w=0&h=vsOshKcQBzocS1GRYTmS_onEC_0ufh5EPDFT6TAn6X4="),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        title!,
                        style: TextStyle(
                          fontSize: 19,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      meaning!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      id!.toString(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              alignment: Alignment.center,
            ),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.book,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(verses!),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.pin_drop,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        SizedBox(width: 7),
                        Text(revealed!),
                      ],
                    ),
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
            ),
          ],
        ),
      ),
    );
  }
}
