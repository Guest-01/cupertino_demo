import 'package:cupertino_demo/screens/buttons_tab.dart';
import 'package:cupertino_demo/screens/forms_tab.dart';
import 'package:flutter/cupertino.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cube_box),
            label: 'Buttons',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_text),
            label: 'Forms',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.arrow_up_circle),
            label: 'Modals',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.ellipsis_circle),
            label: 'Others',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return switch (index) {
              0 => const ButtonsTab(),
              1 => const FormsTab(),
              _ => CupertinoPageScaffold(
                  child: Center(
                    child: Text('unknown tab number $index'),
                  ),
                )
            };
          },
        );
      },
    );
  }
}
