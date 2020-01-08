import 'package:flutter/material.dart';
import 'package:flutter_demo/inheritedwidget/myinheritedwidget.dart';
import 'package:flutter_demo/sliever_demo/sliever_demo.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class MyI18n extends StatefulWidget {
  String language;
  MyI18n({this.language});
  @override
  _MyI18nState createState() => _MyI18nState();
}

class _MyI18nState extends State<MyI18n> {
  @override
  Locale currentLang;
  int clicked = 0;

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () async {
      await FlutterI18n.refresh(context, new Locale(widget.language));
      setState(() {
        currentLang = FlutterI18n.currentLocale(context);
      });
    });
  }

  changeLanguage() {
    setState(() {
      currentLang = currentLang.languageCode == 'en'
          ? new Locale('it')
          : new Locale('en');
    });
  }

  incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
      new AppBar(title: new Text(FlutterI18n.translate(context, "title"))),
      body: new Builder(builder: (BuildContext context) {
        return new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(FlutterI18n.translate(context, "label.main",
                  Map.fromIterables(["user"], ["Flutter lover"]))),
              new Text(FlutterI18n.plural(context, "clicked.times", clicked)),
              new FlatButton(
                  color: Colors.white,
                  onPressed: () async {
                    incrementCounter();
//                    Navigator.popAndPushNamed(context, '/inheritedwidget/MyTree');
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (BuildContext context) => SlieverDemo()));
                  },
                  child: new Text(
                      FlutterI18n.translate(context, "button.clickMe"))),
              new FlatButton(
                  onPressed: () async {
                    changeLanguage();
                    await FlutterI18n.refresh(context, currentLang);
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text(
                          FlutterI18n.translate(context, "toastMessage")),
                    ));
                  },
                  child: new Text(
                      FlutterI18n.translate(context, "button.clickMe")))
            ],
          ),
        );
      }),
    );
  }
}

