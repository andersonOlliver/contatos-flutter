import 'package:contacts/ios/styles.dart';
import 'package:contacts/ios/views/address.view.dart';
import 'package:contacts/ios/views/editor-contact.view.dart';
import 'package:contacts/models/contact.model.dart';
import 'package:flutter/cupertino.dart';

class DetailsView extends StatefulWidget {
  final int id;

  DetailsView({
    @required this.id,
  });
  
  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Contato'),
            trailing: CupertinoButton(
              child: Icon(
                CupertinoIcons.pen,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => EditorContactView(
                      model: ContactModel(
                        id: 1,
                        name: 'Anderson Olliver',
                        email: 'pla.olliver@gmail.com',
                        phone: '65 98145-8168',
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(200),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/-FSNL-FsK0LE/AAAAAAAAAAI/AAAAAAAAAAA/6DC82q4c3E0/s200-c-k/photo.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Anderson Olliver',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '65 98145-8168',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'pla.olliver@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.phone,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.mail,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.photo_camera,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                            ),
                            Text(
                              'Endereço',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Rua Treze, 877',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Cuiabá/MT',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AddressView(),
                            ),
                          );
                        },
                        child: Icon(
                          CupertinoIcons.location,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
