import 'package:contacts/controllers/home.controller.dart';
import 'package:contacts/ios/views/editor-contact.view.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchAppBar extends StatefulWidget {
  final HomeController controller;

  SearchAppBar({
    @required this.controller,
  });

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Observer(
        builder: (_) => widget.controller.showSearch
            ? CupertinoTextField(
                autofocus: true,
                placeholder: 'Pesquisar',
                onSubmitted: (val) => widget.controller.search(val),
              )
            : Text('Meus Contatos'),
      ),
      leading: GestureDetector(
        onTap: () {
          if (widget.controller.showSearch) widget.controller.search('');
          widget.controller.toggleSearch();
        },
        child: Observer(
          builder: (_) => Icon(
            widget.controller.showSearch
                ? CupertinoIcons.clear
                : CupertinoIcons.search,
          ),
        ),
      ),
      trailing: GestureDetector(
        child: Icon(CupertinoIcons.add),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => EditorContactView(
                model: ContactModel(
                  id: 0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
