import 'package:flutter/material.dart';
import 'package:flutter_demo/draw_demo/search_demo_search_delegate.dart';
import 'package:flutter_demo/util/tools.dart';
import 'package:flare_flutter/flare_actor.dart';

class DrawerDemo extends StatefulWidget {
  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> {
  final SearchDemoSearchDelegate _delegate = SearchDemoSearchDelegate();
 final  GlobalKey<ScaffoldState> _globalKey=new GlobalKey<ScaffoldState>();
 int _lastIntegerSelected;
 dynamic str="12121";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        leading: IconButton(
            tooltip: "menu",
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_arrow,
              progress: _delegate.transitionAnimation,
              color: Colors.black,
            ),
            onPressed: () {
              _globalKey.currentState.openDrawer();
            }
        ),
        title: const Text("测试"),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null && selected != _lastIntegerSelected) {
                setState(() {
                  _lastIntegerSelected = selected;
                });
              }
            },
          ),
//          MaterialDemoDocumentationButton(),
          IconButton(
            tooltip: 'More (not implemented)',
            icon: Icon(
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Icons.more_horiz
                  : Icons.more_vert,
            ),
            onPressed: Tools().debounce(() {
               print("测试快速点击");
            },500)
          )
        ],

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            MergeSemantics(
//              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Press the '),
                      Tooltip(
                        message: 'search',
                        child: Icon(
                          Icons.search,
                          size: 18.0,
                        ),
                      ),
                      Text(' icon in the AppBar'),
                    ],
                  ),
                  const Text('and search for an integer between 0 and 100,000.'),
                ],
              ),
//            ),
            const SizedBox(height: 64.0),
            Text('Last selected integer: ${_lastIntegerSelected ?? 'NONE' }.'),
            SizedBox(
              width: 42,
              height: 42,
              child: FlareActor(
                "images/myfir.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
//                animation: "switch_day",

              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(tooltip: 'Back', // Tests depend on this label to exit the demo.
        onPressed: () {
//          Navigator.of(context).pop();
         setState(() {
           str=null;
         });
        },
        label: const Text('Close demo'),
        icon: const Icon(Icons.close),),


      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Peter Widget'),
              accountEmail: Text('peter.widget@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'people/square/peter.png',
                  package: 'flutter_gallery_assets',
                ),
              ),
              margin: EdgeInsets.zero,
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child:  ListTile(
                leading: Icon(Icons.payment),
                title: Text(str),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
