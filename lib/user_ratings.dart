import 'package:flutter/material.dart';
import 'package:item_rating/models/item_Provider.dart';
import 'package:item_rating/models/item_attributes.dart';
import 'package:provider/provider.dart';

class UserRatings extends StatelessWidget {
  UserRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> list = Provider.of<ListOfItems>(context).getList();
    List<Item> ratedItems = [];

    for (int i = 0; i <= list.length - 1; i++) {
      if (Provider.of<ListOfItems>(context, listen: false)
              .items[i]
              .userRating! >
          0) {
        ratedItems
            .add(Provider.of<ListOfItems>(context, listen: false).items[i]);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Ratings'),
        centerTitle: false,
      ),
      body: ratedItems.isEmpty
          ? const Center(
              child: Text(
                "No Items have been rated",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              itemCount: list.where((element) {
                return element.userRating! > 0;
              }).length,
              itemBuilder: ((context, index) {
                // for (int i = 0; i <= list.length - 1; i++) {
                //   if (Provider.of<ListOfItems>(context, listen: false)
                //           .items[i]
                //           .userRating! >
                //       0) {
                //     ratedItems.add(
                //         Provider.of<ListOfItems>(context, listen: false).items[i]);
                //   }
                // }
                return ListTile(
                  title: Text(ratedItems[index].title!), //title
                  trailing: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: ratedItems[index]
                              .userRating
                              .toString(), //itemRating
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: '/5'),
                      ],
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
