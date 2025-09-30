import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuis_praktikum_mobile/models/animals_model.dart';
import 'package:kuis_praktikum_mobile/screens/animalDetailPage.dart';

class AnimalListPage extends StatefulWidget {
  const AnimalListPage({super.key});

  @override
  State<AnimalListPage> createState() => _AnimalListPageState();
}

class _AnimalListPageState extends State<AnimalListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 0, 36),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), 
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255), 
          ),
        ),
        title: Text(
          "KnowYourAnimals",
          style: GoogleFonts.dynaPuff(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w900,
          ),
          ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 2, 0, 36),
                Color.fromARGB(255, 16, 15, 19),
              ],
            )
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search for animals",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 121, 117, 182)
                    ),
                    suffixIcon: Icon(Icons.search, color: Color.fromARGB(255, 85, 187, 255)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 33, 30, 88)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 33, 30, 88)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore Most Searched Animals",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        ),
                      Text(
                        "View More",
                        style: TextStyle(
                          color: Color.fromARGB(255, 85, 187, 255),
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16, 
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7, // Ubah nilai ini untuk mengatur tinggi item
                ), 
                itemBuilder: (context, index){
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: _animalList(context, index)
                  );
                },
                itemCount: dummyAnimals.length,
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      )
    );
  }

  Widget _animalList(context, int index){
    return Ink(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AnimalDetailPage(index: index),
          ));
        },
        child: Container(
          padding: EdgeInsets.all(8),
          color: Color.fromARGB(255, 21, 20, 54),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    alignment: Alignment.center,
                    dummyAnimals[index].image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                dummyAnimals[index].name,
                maxLines: 1,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                dummyAnimals[index].type,
                maxLines: 1,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dummyAnimals[index].habitat.length,
                  itemBuilder: (context,habitatIndex){
                    return Row(
                      children: [
                        _animalHabitatList(context, index, habitatIndex),
                      ],
                    );
                  }
                  ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _animalHabitatList(context, int index, int habitatIndex){
    return Text(
                dummyAnimals[index].habitat[habitatIndex],
                maxLines: 1,
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
    );
  }
}