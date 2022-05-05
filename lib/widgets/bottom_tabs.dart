// import 'package:daily_kart/base/color_resources.dart';
// import 'package:daily_kart/screens/home/home.dart';
// import 'package:flutter/material.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key? key}) : super(key: key);
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   final List<Map<String, Object>> _pages = [
//     {
//       'page': Home(),
//       'title': 'Home',
//     },
//     {
//       'page': Home(),
//       'title': 'Search',
//     },
//     {
//       'page': Home(),
//       'title': 'Profile',
//     },
//     {
//       'page': Home(),
//       'title': 'Settings',
//     },
//   ];
//   int _selectedPageIndex = 0;

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedPageIndex]['page'] as Widget,
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: _selectPage,
//         backgroundColor: ColorResources.getHintColor,
//         unselectedItemColor: Colors.black,
//         selectedItemColor: ColorResources.getPrimary,
//         currentIndex: _selectedPageIndex,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           const BottomNavigationBarItem(
//             backgroundColor: ColorResources.getHintColor,
//             icon: Icon(
//               Icons.home,
//             ),
//             // ignore: deprecated_member_use
//             title: Text('Home'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: const Icon(
//               Icons.search,
//             ),
//             // ignore: deprecated_member_use
//             title: const Text('search'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: const Icon(Icons.person),
//             // ignore: deprecated_member_use
//             title: const Text('Profile'),
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Theme.of(context).primaryColor,
//             icon: const Icon(Icons.settings),
//             // ignore: deprecated_member_use
//             title: const Text('Settings'),
//           ),
//         ],
//       ),
//     );
//   }
// }
