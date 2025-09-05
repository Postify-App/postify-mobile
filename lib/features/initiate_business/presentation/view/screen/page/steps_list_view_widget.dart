// import 'package:flutter/material.dart';

// class StepsListViewWidget extends StatefulWidget {
//   const StepsListViewWidget({super.key});

//   @override
//   State<StepsListViewWidget> createState() => _StepsListViewWidgetState();
// }

// class _StepsListViewWidgetState extends State<StepsListViewWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//               top: 100,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: PageView.builder(
//                 controller: _pageController,
//                 onPageChanged: (index) {
//                   setState(() {
//                     _currentPage = index;
//                   });
//                 },
//                 itemCount: _steps.length,
//                 itemBuilder: (context, index) {
//                   return CustomInitiateBusinessStepPage(
//                     step: _steps[index],
//                     steps: _steps,
//                     currentPage: _currentPage,
//                     nextPage: _nextPage,
//                   );
//                 },
//               ),
//             );
//   }
// }