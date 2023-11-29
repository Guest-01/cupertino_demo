import 'package:cupertino_demo/screens/tabs.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainApp());
}

TextStyle fontStyle = const TextStyle(
  fontFamily: 'Pretendard',
  color: CupertinoColors.label,
  fontSize: 16,
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: fontStyle,
          actionTextStyle: fontStyle,
          dateTimePickerTextStyle: fontStyle,
          navActionTextStyle: fontStyle,
          navLargeTitleTextStyle: fontStyle,
          navTitleTextStyle: fontStyle,
          pickerTextStyle: fontStyle,
          tabLabelTextStyle: fontStyle.copyWith(fontSize: 14),
        ),
        applyThemeToAll: true,
      ),
      home: const Tabs(),
    );
  }
}
