import 'package:flutter/material.dart';
import 'package:flutter_application_api/model/sura.api.dart';
import 'package:flutter_application_api/model/suraModel.dart';
import 'package:flutter_application_api/pages/widgets/sura_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Surah?>>? _surah;
  bool _isLoading = true;

  @override
  void initState() {
    _surah = SuraAPI.getSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wb_sunny),
              SizedBox(width: 10),
              Text("Quran App")
            ],
          ),
        ),
        body: FutureBuilder<List<Surah?>>(
            future: _surah,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something went wrong"),
                );
              } else {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SuraCard(
                            title: snapshot.data![index]!.namesimple,
                            revealed: snapshot.data![index]!.revelation_place!,
                            meaning: snapshot.data![index]!.translated_name!,
                            id: snapshot.data![index]!.id!,
                            verses:
                                snapshot.data![index]!.verses_count.toString());
                      });
                }
              }
            }));
  }
}
