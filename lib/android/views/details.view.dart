import 'package:contacts/android/views/address.view.dart';
import 'package:contacts/android/views/home.view.dart';
import 'package:contacts/android/views/loading.view.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:contacts/repositories/contact.repository.dart';
import 'package:contacts/shared/widgets/contact-details-description.widget.dart';
import 'package:contacts/shared/widgets/contacts-details-image.widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'editor-contact.view.dart';

class DetailsView extends StatefulWidget {
  final int id;

  DetailsView({
    @required this.id,
  });

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final _repository = new ContactRepository();

  onDelete() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Exclusão de Contato'),
            content: Text('Deseja excluir este contato?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text('Excluir'),
                onPressed: delete,
              ),
            ],
          );
        });
  }

  delete() {
    _repository
        .delete(widget.id)
        .then((_) => onSuccess())
        .catchError((err) => onError(err));
  }

  onSuccess() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeView(),
      ),
    );
  }

  onError(err) {
    print(err);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _repository.getContact(widget.id),
      builder: (BuildContext context, AsyncSnapshot<ContactModel> snapshot) {
        if (snapshot.hasData) {
          ContactModel contact = snapshot.data;
          return page(context, contact);
        } else {
          return LoadingView();
        }
      },
    );
  }

  Widget page(BuildContext context, ContactModel model) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contato'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          ContactDetailsImage(image: model.image),
          SizedBox(
            height: 10,
          ),
          ContactDetailsDescription(
              name: model.name, phone: model.phone, email: model.email),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  launch('tel://${model.phone}');
                },
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.phone,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                onPressed: () {
                  launch('mailto://${model.email}');
                },
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.email,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.camera_enhance,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text(
              'Endereço',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.addressLine1 ?? 'Nenhum endereço cadastrado',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  model.addressLine2 ?? '',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            isThreeLine: true,
            trailing: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressView(),
                  ),
                );
              },
              child: Icon(
                Icons.pin_drop,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              width: double.infinity,
              height: 50,
              color: Color(0xFFFF0000),
              child: FlatButton(
                child: Text(
                  'Excluir Contato',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onPressed: onDelete,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditorContactView(
                model: model,
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
