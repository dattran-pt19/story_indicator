import 'package:flutter/material.dart';
import 'package:story_indicator/story_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Story Indicator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  final currentIndex = ValueNotifier(0);
  static const itemOfOnBoarding = 5;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    currentIndex.addListener(() {
      if (currentIndex.value == 0) {
        _pageController.jumpToPage(currentIndex.value);
      } else {
        _pageController.animateToPage(currentIndex.value,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        itemCount: itemOfOnBoarding,
                        itemBuilder: (_, index) => Container(
                            padding: const EdgeInsets.all(24),
                            child: Container(
                                alignment: Alignment.center,
                                color: Colors.white,
                                child: Text("Page number ${index + 1}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
                            )
                        ),
                        onPageChanged: (index) {
                          currentIndex.value = index;
                        }
                    )
                ),
                Container(
                    padding: const EdgeInsets.all(24),
                    child: StoryIndicator(
                        itemCount: itemOfOnBoarding,
                        currentIndex: currentIndex,
                        highlightColor: Colors.red,
                        indicatorSpacing: 8,
                        interval: const Duration(seconds: 2)
                    )
                )
              ]
          )
      )
    );
  }
}
