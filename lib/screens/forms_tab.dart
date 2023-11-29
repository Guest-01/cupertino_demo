import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormsTab extends StatefulWidget {
  const FormsTab({super.key});

  @override
  State<FormsTab> createState() => _FormsTabState();
}

class _FormsTabState extends State<FormsTab> {
  final _formKey = GlobalKey<FormState>();
  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Forms'),
      ),
      // backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoListSection.insetGrouped(
                header: const Text('CupertinoListSection'),
                footer: const Divider(),
                children: [
                  CupertinoListTile.notched(
                    leading: const Icon(CupertinoIcons.arrow_up_right),
                    title: const Text('CupertinoListTile.notched'),
                    subtitle: const Text('subtitle'),
                    additionalInfo: const Text('ad*info'),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {},
                  ),
                  const CupertinoListTile(
                    title: Text('Minimum Tile'),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: CupertinoFormSection.insetGrouped(
                  header: const Text('CupertinoFormSection'),
                  children: [
                    CupertinoTextFormFieldRow(
                      prefix: const Text('username'),
                      placeholder: 'CupertinoTextFormFieldRow',
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return '값을 입력해주세요';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                    CupertinoTextFormFieldRow(
                      prefix: const Text('password'),
                      placeholder: 'CupertinoTextFormFieldRow',
                      obscureText: true,
                      validator: (v) {
                        if (v == null || v.length < 6) {
                          return '6자리 이상 입력해주세요';
                        }
                        return null;
                      },
                    ),
                    CupertinoFormRow(
                      prefix: const Text('on or off'),
                      child: CupertinoSwitch(
                        value: _switch,
                        onChanged: (v) {
                          _switch = v;
                          setState(() {});
                        },
                        activeColor: CupertinoColors.activeGreen,
                      ),
                    ),
                    CupertinoListTile(
                      title: const Text('selects - page transition'),
                      trailing: const CupertinoListTileChevron(),
                      additionalInfo: const Text('Option 1'),
                      onTap: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) {
                              return CupertinoPageScaffold(
                                navigationBar: const CupertinoNavigationBar(
                                  middle: Text('Select Option'),
                                ),
                                child: SafeArea(
                                  child: CupertinoListSection(
                                    // dividerMargin: 0,
                                    additionalDividerMargin: 0,
                                    children: const [
                                      CupertinoListTile(
                                        title: Text(
                                          'Option 1',
                                          style: TextStyle(
                                            color: CupertinoColors.activeBlue,
                                          ),
                                        ),
                                        trailing:
                                            Icon(CupertinoIcons.checkmark_alt),
                                      ),
                                      CupertinoListTile(
                                        title: Text('Option 2'),
                                      ),
                                      CupertinoListTile(
                                        title: Text('Option 3'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    CupertinoListTile(
                      title: const Text('selects - menu'),
                      trailing: const Icon(
                        CupertinoIcons.chevron_up_chevron_down,
                        color: CupertinoColors.inactiveGray,
                        size: 14,
                      ),
                      additionalInfo: const Text('Option A'),
                      onTap: () {
                        showCupertinoModalPopup(
                            semanticsDismissible: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                color: CupertinoColors.systemBackground,
                                child: CupertinoPicker(
                                  looping: true,
                                  useMagnifier: true,
                                  magnification: 1.1,
                                  itemExtent: 25,
                                  onSelectedItemChanged: (index) {},
                                  children: const [
                                    Text('Option A'),
                                    Text('Option B'),
                                    Text('Option C'),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
              CupertinoListSection.insetGrouped(
                children: [
                  CupertinoListTile(
                    title: const Text(
                      'Reset And Clear All',
                      style: TextStyle(
                        color: CupertinoColors.destructiveRed,
                      ),
                    ),
                    onTap: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _switch = true;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    child: const Text('Submit'),
                    onPressed: () {
                      _formKey.currentState!.validate();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
