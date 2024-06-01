// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:recipie_app/Services/injection.dart';
import 'package:recipie_app/Services/recipiemodel.dart';

class RecipieScreen extends StatefulWidget {
  final name;
  final title;
  const RecipieScreen({
    super.key,
    required this.name,
    this.title,
  });

  @override
  State<RecipieScreen> createState() => _RecipieScreenState();
}

class _RecipieScreenState extends State<RecipieScreen> {
  //strIngredient;
  @override
  void initState() {
    super.initState();
    getRecipies();
  }

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
    return Scaffold(
        backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          title: Text(widget.title.toString()),
          backgroundColor: Colors.blue,
        ),
        body: isloading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 200,
                              //width: 300,
                              child: Image.network(
                                recipies.meals![widget.name].strMealThumb
                                    .toString(),
                                //  fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Name : ${recipies.meals![widget.name].strMeal}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Text(
                                        "Area : ${recipies.meals![widget.name].strArea}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Category : ${recipies.meals![widget.name].strCategory}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ])),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Ingredients :",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          //scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: recipies.meals![widget.name]
                                          .strIngredient[index] ==
                                      ''
                                  ? const SizedBox(
                                      height: 0.00000000000000001,
                                    )
                                  : Text(
                                      recipies.meals![widget.name]
                                              .strIngredient[index] +
                                          "   =   " +
                                          recipies.meals![widget.name]
                                              .strMeasure[index],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                            );
                          }),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Instructions :",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        recipies.meals![widget.name].strInstructions.toString(),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    recipies.meals![widget.name].strYoutube.toString() == ''
                        ? const SizedBox()
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Youtube Video Link :",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                    InkWell(
                        onTap: () => launchUrl(
                            Uri.parse(recipies.meals![widget.name].strYoutube
                                .toString()),
                            mode: LaunchMode.platformDefault),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Text(
                            recipies.meals![widget.name].strYoutube.toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )),
                    recipies.meals![widget.name].strSource.toString() == ''
                        ? const SizedBox()
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Blog Link :",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                    InkWell(
                        onTap: () => launchUrl(
                            Uri.parse(recipies.meals![widget.name].strSource
                                .toString()),
                            mode: LaunchMode.platformDefault),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Text(
                            recipies.meals![widget.name].strSource.toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ));
  }
}
