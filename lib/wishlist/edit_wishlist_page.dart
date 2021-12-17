import 'package:flutter/material.dart';
import 'package:issaq_pro/db/wishlist_database.dart';
import 'package:issaq_pro/model/wishlist_model.dart';
import 'package:issaq_pro/widget/wishlist_form_widget.dart';

class AddEditWishlistPage extends StatefulWidget {
  final Wishlist? wishlist;

  const AddEditWishlistPage({
    Key? key,
    this.wishlist,
  }) : super(key: key);
  @override
  _AddEditWishlistPageState createState() => _AddEditWishlistPageState();
}

class _AddEditWishlistPageState extends State<AddEditWishlistPage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    isImportant = widget.wishlist?.isImportant ?? false;
    number = widget.wishlist?.number ?? 0;
    title = widget.wishlist?.title ?? '';
    description = widget.wishlist?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: WishlistFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateWishlist,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateWishlist() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.wishlist != null;

      if (isUpdating) {
        await updateWishlist();
      } else {
        await addWishlist();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateWishlist() async {
    final wishlist = widget.wishlist!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    await WishlistDatabase.instance.update(wishlist);
  }

  Future addWishlist() async {
    final wishlist = Wishlist(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    await WishlistDatabase.instance.create(wishlist);
  }
}
