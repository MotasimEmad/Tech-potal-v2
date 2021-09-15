//  child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     width: 100.0,
//                     decoration: BoxDecoration(
//                       color: currentType == 0
//                           ? Color(0xff7c94b6).withOpacity(.25)
//                           : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: currentType == 0
//                           ? null
//                           : Border.all(
//                               color: Color(0xff7c94b6),
//                               style: BorderStyle.solid,
//                               width: 1.0,
//                             ),
//                     ),
//                     height: 50,
//                     child: FlatButton(
//                       child: Center(
//                         child: Text(
//                           "Current",
//                           style: TextStyle(
//                             color: Color(0xff7c94b6),
//                             fontWeight:
//                                 currentType == 0 ? FontWeight.bold : null,
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           currentType = 0;
//                         });
//                       },
//                       textColor: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     width: 100.0,
//                     decoration: BoxDecoration(
//                       color: currentType == 1
//                           ? Color(0xff7c94b6).withOpacity(.25)
//                           : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: currentType == 1
//                           ? null
//                           : Border.all(
//                               color: Color(0xff7c94b6),
//                               style: BorderStyle.solid,
//                               width: 1.0,
//                             ),
//                     ),
//                     height: 50,
//                     child: FlatButton(
//                       child: Center(
//                         child: Text(
//                           "Coming",
//                           style: TextStyle(
//                             color: Color(0xff7c94b6),
//                             fontWeight:
//                                 currentType == 1 ? FontWeight.bold : null,
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           currentType = 1;
//                         });
//                       },
//                       textColor: Colors.white,
//                     ),
//                   ),
//                   Container(
//                     width: 100.0,
//                     decoration: BoxDecoration(
//                       color: currentType == 2
//                           ? Color(0xff7c94b6).withOpacity(.25)
//                           : Colors.transparent,
//                       borderRadius: BorderRadius.circular(10.0),
//                       border: currentType == 2
//                           ? null
//                           : Border.all(
//                               color: Color(0xff7c94b6),
//                               style: BorderStyle.solid,
//                               width: 1.0,
//                             ),
//                     ),
//                     height: 50,
//                     child: FlatButton(
//                       child: Center(
//                         child: Text(
//                           "Search",
//                           style: TextStyle(
//                             color: Color(0xff7c94b6),
//                             fontWeight:
//                                 currentType == 2 ? FontWeight.bold : null,
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           currentType = 2;
//                         });
//                       },
//                       textColor: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
