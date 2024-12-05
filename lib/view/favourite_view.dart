import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({super.key});

  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    print('build');
    // final favouriteProvider = Provider.of<FavouriteItemProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Consumer<FavouriteItemProvider>(
                        builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          value.selectedItem.contains(index)
                              ? value.removeItem(index)
                              : value.addItem(index);
                        },
                        title: Text('item' + index.toString()),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_rounded),
                      );
                    });
                  }))
        ],
      ),
    );
  }
}
