import 'dart:io';

import 'package:contacts/ios/views/details.view.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class ContactListItem extends StatelessWidget {
  final ContactModel model;

  ContactListItem({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: model.image == null
                  ? AssetImage('assets/images/profile-picture.png')
                  : FileImage(
                      File(model.image),
                    ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  model.phone,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
        CupertinoButton(
          child: Icon(
            CupertinoIcons.person,
          ),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => DetailsView(
                  id: model.id,
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
