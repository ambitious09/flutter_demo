import 'package:flutter/material.dart';


class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
             builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                 child: ConstrainedBox(
                   constraints: BoxConstraints(
                     minHeight: viewportConstraints.maxHeight,
                   ),
                   child: IntrinsicHeight(
                     child: Column(
                       children: <Widget>[
                         Container(
//                            A fixed-height child.
                           color: const Color(0xff808000),  //Yellow
                           height: 120.0,
                         ),
                         Expanded(
//                            A flexible child that will grow to fit the viewport but
//                            still be at least as big as necessary to fit its contents.
                           child: Container(
                             color: const Color(0xff800000),  //Red
//                             height: 120.0,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               );
             },
           );
  }
}

