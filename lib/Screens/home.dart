// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:recipie_app/Screens/favourite.dart';
import 'package:recipie_app/Screens/recipiescreen.dart';
import 'package:recipie_app/Services/injection.dart';
import 'package:recipie_app/Services/uihelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipie_app/Services/recipiemodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    getRecipies();
  }

  //List<String> favorited = ["", ""];
  bool isloading = true;
  RecipieApi recipies = RecipieApi();
  getRecipies() {
    client.getRecipie().then((value) {
      setState(() {
        recipies = value;
        isloading = false;
        // filteredRecipies = List.of(recipies);
      });
    }).onError((error, stackTrace) {
      SnackBar(content: Text(error.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      maintainBottomViewPadding: false,
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: const Text("Recipies App"),
          backgroundColor: Colors.blue,
        ),
        body: isloading == true
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue.shade200,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: recipies.meals?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipieScreen(
                                      name: index,
                                      title: recipies.meals![index].strMeal,
                                    ))),
                        child: Card(
                          color: Colors.blue.shade200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 200,
                                        //width: 300,
                                        child: Image.network(
                                          recipies.meals![index].strMealThumb
                                              .toString(),
                                          //  fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name : ${recipies.meals![index].strMeal}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Category : ${recipies.meals![index].strCategory}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Name : ${recipies.meals![index].strMeal}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0, vertical: 5),
                                child: SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        List<String> favorited =
                                            prefs.getStringList('favorited') ??
                                                [];

                                        if (favorited
                                            .contains(index.toString())) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                content: Text(
                                                    "Already added to favorites")),
                                          );
                                        } else {
                                          favorited.add(index.toString());
                                          await prefs.setStringList(
                                              'favorited', favorited);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                duration:
                                                    Duration(milliseconds: 500),
                                                content:
                                                    Text("Added to favorites")),
                                          );
                                        }
                                      },
                                      child: const Text("Add to favorites"),
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            UiHelper.push1(context, const Faourite());
          },
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
