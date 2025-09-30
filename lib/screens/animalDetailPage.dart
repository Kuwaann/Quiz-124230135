import 'package:flutter/material.dart';
import 'package:kuis_praktikum_mobile/models/animals_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimalDetailPage extends StatefulWidget {
  final int index;

  const AnimalDetailPage({super.key, required this.index});

  @override
  State<AnimalDetailPage> createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  bool likeButtonStatus = false;
  String? statusColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 0, 36),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 2, 0, 36),
                  Color.fromARGB(255, 2, 0, 36),
                ],
              ),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 250,
                    child: Image.network(
                      dummyAnimals[widget.index].image,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      ),
                    ),
                  ]
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                          Colors.black,
                          Color.fromARGB(255, 2, 0, 36),
                        ]
                        )
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${dummyAnimals[widget.index].name}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                IconButton(
                                  onPressed: (){
                                    _likeButton();
                                  }, 
                                  icon: Icon(likeButtonStatus == true ? Icons.favorite : Icons.favorite_border , color: likeButtonStatus == true ? Colors.red : Colors.white.withOpacity(0.5),))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "${dummyAnimals[widget.index].type}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 10, // sesuaikan tinggi dengan kebutuhan
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Row(
                                children: [
                                  Text(
                                  "Weight",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "${dummyAnimals[widget.index].weight}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 10, // sesuaikan tinggi dengan kebutuhan
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Row(
                                children: [
                                  Text(
                                  "Height",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "${dummyAnimals[widget.index].height}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: 1,
                                height: 10, // sesuaikan tinggi dengan kebutuhan
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Container(
                                height: 20,
                                child: ElevatedButton(
                                  onPressed: (){
                                    _launchWikipedia(dummyAnimals[widget.index].wikipedia);
                                  }, 
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white.withOpacity(0.1),
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    "Wikipedia",
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  )),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          // Text(
                          //   "${movieList[index].synopsis}",
                          //   style: GoogleFonts.openSans(
                          //     color: Colors.white,
                          //     fontSize: 16,
                          //     fontWeight: FontWeight.w100,
                          //   ),
                          //   textAlign: TextAlign.justify,
                          // ),
                          // SizedBox(height: 30),
                          SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Habitats",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal, 
                                    itemCount: dummyAnimals[widget.index].habitat.length,
                                    itemBuilder: (context, castIndex) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 12),
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                          child: Text(
                                            dummyAnimals[widget.index].habitat[castIndex],
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                  
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30, // sesuaikan dengan kebutuhan
            left: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchWikipedia(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Tidak bisa membuka $uri');
    }
  }

  void _likeButton() {
    setState(() {
        likeButtonStatus = !likeButtonStatus;
    });
  }
}