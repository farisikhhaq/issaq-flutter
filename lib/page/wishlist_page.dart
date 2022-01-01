import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:issaq_pro/db/wishlist_database.dart';
import 'package:issaq_pro/model/wishlist_model.dart';
import 'package:issaq_pro/wishlist/edit_wishlist_page.dart';
import 'package:issaq_pro/wishlist/wishlist_page_detail.dart';
import 'package:issaq_pro/widget/wishlist_card_widget.dart';
import 'package:issaq_pro/utils/theme.dart';

class WishlistsPage extends StatefulWidget {
  @override
  _WishlistsPageState createState() => _WishlistsPageState();
}

class _WishlistsPageState extends State<WishlistsPage> {
  late List<Wishlist> wishlists;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshWishlists();
  }

  @override
  void dispose() {
    WishlistDatabase.instance.close();

    super.dispose();
  }

  Future refreshWishlists() async {
    setState(() => isLoading = true);

    this.wishlists = await WishlistDatabase.instance.readAllWishlists();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: orangeColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: greenColor,
            )),
          title: Text(
            'Wishlists',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
        ),
        backgroundColor: orangeColor,
        body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : wishlists.isEmpty
                  ? Text(
                      'No Wishlists',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    )
                  : buildWishlists(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: greenColor,
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditWishlistPage()),
            );

            refreshWishlists();
          },
        ),
      );

  Widget buildWishlists() => StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(8),
        itemCount: wishlists.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          final wishlist = wishlists[index];

          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    WishlistDetailPage(wishlistId: wishlist.id!),
              ));

              refreshWishlists();
            },
            child: WishlistCardWidget(wishlist: wishlist, index: index),
          );
        },
      );
}
