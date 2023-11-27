import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

enum RadioOptions { one, two }

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isLoading = false;
  bool checkbox = false;
  RadioOptions radio = RadioOptions.one;
  double slider = 0.5;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Hello Cupertino!'),
        ),
        child: SafeArea(
          child: CupertinoScrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            HapticFeedback.lightImpact();
                          },
                          child: const Text('CupertinoButton'),
                        ),
                        Expanded(
                          child: CupertinoButton.filled(
                            padding: const EdgeInsets.symmetric(horizontal: 60),
                            onPressed: isLoading
                                ? null
                                : () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    Vibration.vibrate();
                                    Future.delayed(
                                        const Duration(milliseconds: 600), () {
                                      // Do something
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                                  },
                            child: isLoading
                                ? const CupertinoActivityIndicator()
                                : const Text('filled'),
                          ),
                        ),
                      ],
                    ),
                    const CupertinoTextField(
                      placeholder: 'CupertinoTextField',
                    ),
                    const CupertinoTextField.borderless(
                      placeholder: 'CupertinoTextField.borderless',
                    ),
                    const CupertinoSearchTextField(
                      placeholder: 'CupertinoSearchTextField',
                    ),
                    Row(
                      children: [
                        CupertinoCheckbox(
                          value: checkbox,
                          onChanged: (v) {
                            setState(() {
                              checkbox = v as bool;
                            });
                          },
                        ),
                        const Text('CupertinoCheckbox'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CupertinoRadio(
                              value: RadioOptions.one,
                              groupValue: radio,
                              onChanged: (v) {
                                setState(() {
                                  radio = v as RadioOptions;
                                });
                              },
                            ),
                            const Text('CupertinoRadio (1)'),
                          ],
                        ),
                        Row(
                          children: [
                            CupertinoRadio(
                              value: RadioOptions.two,
                              groupValue: radio,
                              onChanged: (v) {
                                setState(() {
                                  radio = v as RadioOptions;
                                });
                              },
                            ),
                            const Text('CupertinoRadio (2)'),
                          ],
                        ),
                      ],
                    ),
                    CupertinoListSection(
                      header: const Text('CupertinoListSection'),
                      children: const [
                        CupertinoListTile(title: Text('CupertinoListTile')),
                        CupertinoListTile(title: Text('CupertinoListTile')),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CupertinoSlider(
                            value: slider,
                            onChanged: (v) {
                              setState(() {
                                slider = v;
                              });
                            },
                          ),
                        ),
                        Text('CupertinoSlider ${slider.toStringAsFixed(2)}'),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 100,
                      child: CupertinoPicker.builder(
                        itemExtent: 26,
                        childCount: 10,
                        onSelectedItemChanged: (i) {},
                        itemBuilder: (_, index) {
                          return Text('CupertinoPicker $index');
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 100,
                      child: CupertinoDatePicker(
                        dateOrder: DatePickerDateOrder.ymd,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dt) {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.extraLightBackgroundGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 100,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (dt) {},
                      ),
                    ),
                    const Divider(),
                    Builder(
                      builder: (context) {
                        return CupertinoButton(
                          child: const Text('show AlertDialog'),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title:
                                      const Text('CupertinoAlertDialog title'),
                                  content: const Text(
                                      'CupertinoAlertDialog content'),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDefaultAction: true,
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('default'),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('destructive'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                    Builder(
                      builder: (context) {
                        return CupertinoButton(
                          child: const Text('show ActionSheet'),
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoActionSheet(
                                  title:
                                      const Text('CupertinoActionSheet title'),
                                  message: const Text(
                                      'CupertinoActionSheet message'),
                                  actions: [
                                    CupertinoActionSheetAction(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('action 1'),
                                    ),
                                    CupertinoActionSheetAction(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('action 2'),
                                    ),
                                  ],
                                  cancelButton: CupertinoActionSheetAction(
                                    child: const Text('cancel'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
