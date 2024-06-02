import 'package:flutter/material.dart';
import 'package:recipie_app/Screens/recipiescreen.dart';
import 'package:recipie_app/Services/injection.dart';
import 'package:recipie_app/Services/recipiemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Faourite extends StatefulWidget {
  const Faourite({super.key});

  @override
  State<Faourite> createState() => _FaouriteState();
}

class _FaouriteState extends State<Faourite> {
  var favorite = [];
  @override
  void initState() {
    super.initState();
    getData();
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

  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();

    // Get the stored index (as a string) from shared preferences
    List<String>? storedIndexStrings = prefs.getStringList('favorited');

    // If the stored index is not null, convert it to an int and add it to the list
    if (storedIndexStrings != null) {
      favorite = storedIndexStrings.map((e) => int.parse(e)).toList();
    } else {
      const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text("Add recipies in Favourite to see here"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: const Text("Favorite recipies"),
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
                child: favorite.isEmpty
                    ? const Center(
                        child: Text(
                          "Nothing in favorite!",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: favorite.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecipieScreen(
                                          name: favorite[index],
                                          title: recipies
                                              .meals![favorite[index]].strMeal,
                                        ))),
                            child: Card(
                              color: Colors.blue.shade200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 200,
                                            //width: 300,
                                            child: Image.network(
                                              recipies.meals![favorite[index]]
                                                  .strMealThumb
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name : ${recipies.meals![favorite[index]].strMeal}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Category : ${recipies.meals![favorite[index]].strCategory}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Name : ${recipies.meals![favorite[index]].strMeal}",
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
                                            final prefs =
                                                await SharedPreferences
                                                    .getInstance();
                                            setState(() {
                                              int index1 = favorite[index];
                                              // Remove the index from the favorite list
                                              favorite.removeWhere((element) =>
                                                  element == index1);

                                              // Convert the favorite list back to a list of strings
                                              List<String> favoriteStrings =
                                                  favorite
                                                      .map((e) => e.toString())
                                                      .toList();

                                              // Save the updated favorite list in shared preferences
                                              prefs.setStringList(
                                                  'favorited', favoriteStrings);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  content: Text(
                                                      "Removed From Favorites"),
                                                ),
                                              );
                                            });
                                          },
                                          child: const Text("Remove favorites"),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
      ),
    );
  }
}
