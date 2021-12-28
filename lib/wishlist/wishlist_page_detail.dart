import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:issaq_pro/db/wishlist_database.dart';
import 'package:issaq_pro/model/wishlist_model.dart';
import 'package:issaq_pro/wishlist/edit_wishlist_page.dart';

class WishlistDetailPage extends StatefulWidget {
  final int wishlistId;

  const WishlistDetailPage({
    Key? key,
    required this.wishlistId,
  }) : super(key: key);

  @override
  _WishlistDetailPageState createState() => _WishlistDetailPageState();
}

class _WishlistDetailPageState extends State<WishlistDetailPage> {
  late Wishlist wishlist;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshWishlist();
  }

  Future refreshWishlist() async {
    setState(() => isLoading = true);

    this.wishlist =
        await WishlistDatabase.instance.readWishlist(widget.wishlistId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      wishlist.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(wishlist.createdTime),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      wishlist.description,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
      );
  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditWishlistPage(wishlist: wishlist),
        ));

        refreshWishlist();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await WishlistDatabase.instance.delete(widget.wishlistId);

          Navigator.of(context).pop();
        },
      );
}
