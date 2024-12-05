import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/theme_manager.dart';
import 'package:provider/provider.dart';

import '../provider/favourite_provider.dart';

class MyFavouriteView extends StatelessWidget {
  const MyFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    print('build');
    final favouriteProvider = Provider.of<FavouriteItemProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<ThemeManager>(builder: (context, themeManager, child){
            return IconButton(onPressed: themeManager.toggleTheme, icon: Icon(themeManager.isDarkMode ? Icons.light_mode : Icons.dark_mode));
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favouriteProvider.selectedItem.length,
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
