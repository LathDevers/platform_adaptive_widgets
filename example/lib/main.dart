import 'package:flutter/material.dart';
import 'package:platform_adaptive_widgets/platform_adaptive_widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _slider = 0;
  bool _switch = false;
  int _segmented = 0;
  int _dropDown = 0;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTabScaffoldWithBottomNavigation(
      pages: [
        AdaptiveTabPage(
          appBar: const TabPageAppBar(
            title: 'First Tab',
          ),
          navigationBar: TabPageNavigationBar(
            icon: AdaptiveIcons.hare,
            label: 'First',
            selectedIcon: AdaptiveIcons.hare_fill,
          ),
          body: (BuildContext context, int index, void Function(int) setActiveTab) {
            return [
              const HeadingTitle('ListTiles'),
              AdaptiveListTile(
                leading: Icon(AdaptiveIcons.thumbsup),
                title: const Text('title'),
                subtitle: const Text('subtitle'),
                trailing: AdaptiveCheckbox(
                  value: _checkbox,
                  onChanged: (bool? value) => setState(() => _checkbox = value ?? false),
                ),
              ),
              AdaptiveListTile.avatar(
                leadingAvatar: CircleAvatar(child: Icon(AdaptiveIcons.person)),
                title: const Text('circle avatar ListTile'),
                trailing: AdaptiveCheckbox(
                  value: _checkbox,
                  onChanged: (bool? value) => setState(() => _checkbox = value ?? false),
                ),
              ),
              AdaptiveListTile.image(
                title: const Text('image ListTile'),
                trailing: AdaptiveCheckbox(
                  value: _checkbox,
                  onChanged: (bool? value) => setState(() => _checkbox = value ?? false),
                ),
              ),
              const HeadingTitle('Circular Progress Indicators'),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      HeadingTitle.comment('determinate'),
                      AdaptiveCircularProgressIndicator.determinate(value: .4),
                      Text('40%'),
                    ],
                  ),
                  SizedBox(width: 50),
                  Column(
                    children: [
                      HeadingTitle.comment('indeterminate'),
                      AdaptiveCircularProgressIndicator.indeterminate(),
                    ],
                  ),
                ],
              ),
              const HeadingTitle('Progress Bars'),
              const HeadingTitle.comment('determinate'),
              const AdaptiveProgressBar.determinate(value: .4),
              const HeadingTitle.comment('indeterminate'),
              const AdaptiveProgressBar.indeterminate(),
              const HeadingTitle('Dropdown Menu'),
              AdaptiveDropDown<int>(
                value: _dropDown,
                dropDownElements: {
                  0: MyDDElement(name: (_) => '0'),
                  1: MyDDElement(name: (_) => '1'),
                  2: MyDDElement(name: (_) => '2'),
                  3: MyDDElement(name: (_) => '3'),
                },
                onChanged: (int? value) => setState(() => _dropDown = value ?? 0),
              ),
              const HeadingTitle('Pull Down Button'),
              Row(
                children: [
                  AdaptivePullDownButton(
                    itemBuilder: (context) => [
                      AdaptivePullDownItem(
                        title: 'title',
                        subtitle: 'subtitle',
                        icon: AdaptiveIcons.archive,
                      ),
                      AdaptivePullDownGroup(
                        title: 'group',
                        items: [
                          AdaptivePullDownItem(
                            title: 'title',
                            subtitle: 'subtitle',
                            icon: AdaptiveIcons.archive,
                          ),
                        ],
                      ),
                      const AdaptivePullDownItem.divider(),
                      const AdaptivePullDownItem.selectable(
                        title: 'selectable',
                        selected: true,
                      ),
                      const AdaptivePullDownItem(
                        title: 'destructive',
                        isDestructive: true,
                      ),
                    ],
                  ),
                ],
              ),
              const HeadingTitle('Segmented Control'),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: AdaptiveSegmented<int>(
                      segments: const {
                        0: Text('0'),
                        1: Text('1'),
                        2: Text('2'),
                      },
                      value: _segmented,
                      onSelectionChanged: (int? value) => setState(() => _segmented = value ?? 0),
                    ),
                  ),
                ],
              ),
              const HeadingTitle('Slider'),
              AdaptiveSlider(
                value: _slider,
                onChanged: (double value) => setState(() => _slider = value),
              ),
              const HeadingTitle('Switch'),
              Row(
                children: [
                  AdaptiveSwitch(
                    value: _switch,
                    onChanged: (bool value) => setState(() => _switch = value),
                  ),
                ],
              ),
            ];
          },
        ),
        AdaptiveTabPage(
          onPop: (fct) => fct(0),
          appBar: TabPageAppBar(
            title: 'Second Tab',
            leadingButton: LeadingButton(
              icon: AdaptiveIcons.arrow_back,
              text: 'Back',
              onPressed: (Function fct) => fct(0),
              color1: Colors.white,
              color2: Theme.of(context).colorScheme.primary,
            ),
          ),
          navigationBar: TabPageNavigationBar(
            icon: AdaptiveIcons.tortoise,
            selectedIcon: AdaptiveIcons.tortoise_fill,
            label: 'Second',
          ),
        ),
      ],
    );
  }
}

class HeadingTitle extends StatelessWidget {
  const HeadingTitle(
    this.text, {
    super.key,
  }) : _comment = false;

  const HeadingTitle.comment(
    this.text, {
    super.key,
  }) : _comment = true;

  final String text;
  final bool _comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          text,
          style: _comment ? null : Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
