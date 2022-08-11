import 'package:flutter/material.dart';
import 'package:item_rating/models/item_Provider.dart';
import 'package:item_rating/models/item_attributes.dart';
import 'package:provider/provider.dart';

class UserRatings extends StatelessWidget {
  UserRatings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Item> list = Provider.of<ListOfItems>(context).getList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Ratings'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: list.where((element) {
          return element.userRating! > 0;
        }).length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(Provider.of<ListOfItems>(context).items[index].title!),
            trailing: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: Provider.of<ListOfItems>(context)
                        .items[index]
                        .userRating
                        .toString(),
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
