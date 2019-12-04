//import 'package:danamm/base/base_page_state.dart';
//import 'package:danamm/constants/page_constants.dart';
//import 'package:danamm/module/question/question_presenter.dart';
//import 'package:danamm/router/route.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:annotation_route/route.dart';
//import 'package:flutter/material.dart';
//import '../question/entity/question_entity.dart';
//import 'package:oktoast/oktoast.dart';
//import 'package:danamm/constants/colors.dart';
//import 'package:danamm/widget/vertical_line.dart';
//import 'package:danamm/widget/Toolbar.dart';
//import 'package:danamm/widget/back_button_arrows.dart';
//
//@ARoute(url: PageConstants.QuestionPage)
//class QuestionPage extends StatefulWidget {
//  final RouteOption options;
//
//  QuestionPage(this.options);
//
//  @override
//  QuestionPageState createState() => QuestionPageState();
//}
//
//class QuestionPageState
//    extends BasePageState<QuestionPage, QuestionPagePresenter> {
//  QuestionEntity questionLists;
//
//  @override
//  void initState() {
//    super.initState();
//    presenter.getQuestions();
//  }
//
//  void showQuestionLists(QuestionEntity data) {
//    setState(() {
//      questionLists = data;
//      print('dataisnull=${data == null}');
//    });
//  }
//
//  void showErrorMsg(String msg) {
//    showToast(msg);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: Toolbar(
//        leading: BackButtonArrows(
//          color: color333333,
//        ),
//        title: Text(
//          "Q&A",
//          style: TextStyle(color: color333333, fontSize: 18),
//        ),
//        backgroundColor: colorWhite,
//        centerTitle: true,
//        actions: <Widget>[Image.asset("assets/service.png")],
//      ),
//      body: questionLists == null
//          ? Container()
//          : SingleChildScrollView(
//          child: ExpansionPanelList(
//            expansionCallback: (index, isExpand) {
//              _setCurrentIndex(index, isExpand);
//            },
//            children: questionLists.data
//                .map<ExpansionPanel>((QuestionData questionData) {
//              return ExpansionPanel(
//                  headerBuilder: (context, isExpand) {
//                    return Padding(
//                      padding: EdgeInsets.only(left: 20),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Expanded(
//                            flex: 1,
//                            child: Stack(
//                              children: <Widget>[
////                          Image.asset("assets/ic_q&a.png"),
//                                Container(
//                                    padding:
//                                    EdgeInsets.only(top: 2, bottom: 2),
//                                    width: 28,
//                                    height: 24,
//                                    decoration: BoxDecoration(
//                                      image: DecorationImage(
//                                          image:
//                                          AssetImage("assets/ic_q&a.png"),
//                                          fit: BoxFit.fill),
//                                    ),
//                                    child: Text(
//                                      'Q${questionData.index + 1}',
//                                      style: TextStyle(
//                                          color: colorWhite, fontSize: 12),
//                                      textAlign: TextAlign.center,
//                                    ))
//                              ],
//                            ),
//                          ),
//                          Expanded(
//                            flex: 6,
//                            child: Text(
//                              "${questionData.question}",
//                              style:
//                              TextStyle(color: color333333, fontSize: 15),
//                            ),
//                          ),
//                        ],
//                      ),
//                    );
//                  },
//                  body: Container(
//                    alignment: Alignment.centerLeft,
//                    padding: EdgeInsets.fromLTRB(65, 0, 20, 17),
//                    child: RichText(
//                        text: TextSpan(
//                            text: '${questionData.answer}',
//                            style:
//                            TextStyle(color: color999999, fontSize: 12))),
//                  ),
//                  isExpanded: questionData.isOpen);
//            }).toList(),
//          )),
//    );
//  }
//
//  // 判断用户点击是否打开
//  _setCurrentIndex(int index, bool isExpand) {
//    setState(() {
////      _panelIndex = index;
//      // 循环设置用户的点击初始状态
//      if (questionLists.data != null) {
//        questionLists.data[index].isOpen = !isExpand;
//      }
//    });
//  }
//}
