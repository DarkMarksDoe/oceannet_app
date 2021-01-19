import 'package:flutter/material.dart';
import 'package:oceannet/calls/provider/ProviderUser.dart';
import 'package:oceannet/pages/HomePage/widgets/DialogMenu.dart';
import 'package:oceannet/pages/NewUserPage/NewUserPage.dart';
import 'package:oceannet/pages/UserPage/UserPage.dart';
import 'package:provider/provider.dart';

import 'widgets/FlexibleAppBar.dart';
import 'widgets/MyAppBar.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<UserProvider>(
          builder: (_, snapshot, __) {
            print(snapshot);
            if (snapshot.usersList.length == 0) {
              return Center(child: CircularProgressIndicator());
            } else {
              return CustomScrollView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: false,
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    title: MyAppBar(),
                    expandedHeight: 170.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: FlexibleAppBar(),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewUserPage(
                                userProvider: userProvider,
                              ),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add_box_rounded,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await userProvider.createListUser();
                        },
                        icon: Icon(
                          Icons.refresh,
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Container(
                          height: 100,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 5,
                            semanticContainer: true,
                            child: ListTile(
                              title: Text(
                                '${snapshot.usersList[index].name}',
                                style: TextStyle(fontFamily: 'Chivo'),
                              ),
                              subtitle: Text(
                                'Genre: ${snapshot.usersList[index].genre}',
                                style: TextStyle(fontFamily: 'Chivo'),
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: 'assets/loader.gif',
                                    image:
                                        '${snapshot.usersList[index].urlProfilePicture}',
                                  ),
                                ),
                              ),
                              onTap: () {
                                snapshot.user = snapshot.usersList[index];
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UserPage(
                                          userModel: snapshot.usersList[index],
                                        )));
                              },
                              onLongPress: () async {
                                await showDialog(
                                  context: context,
                                  builder: (_) => DialogMenu(
                                      userModel: snapshot.usersList[index],
                                      contextoAnterior: context,
                                      userProvider: userProvider),
                                );
                              },
                            ),
                          ),
                        );
                      },
                      // Builds 1000 ListTiles
                      childCount: snapshot.usersList.length,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
