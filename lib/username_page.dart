import 'package:flutter/material.dart';
import 'package:item_rating/models/item_Provider.dart';
import 'package:item_rating/user_ratings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UsernamePage extends StatelessWidget {
  UsernamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<ListOfItems>(context).usernameInput!),
        centerTitle: false,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (UserRatings()),
                ),
              );
            },
            child: const Text("View Ratings"),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(Provider.of<ListOfItems>(context)
                .items[index]
                .title
                .toString()),
            subtitle: RatingBar.builder(
              itemSize: 35,
              initialRating: 0,
              minRating: 0.0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                Provider.of<ListOfItems>(context, listen: false)
                    .items[index]
                    .userRating = rating;
                //print(rating);
              },
            ),
          );
        }),
      ),
    );
  }
}
