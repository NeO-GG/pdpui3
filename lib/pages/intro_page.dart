import 'package:flutter/material.dart';
import 'package:pdpui3/pages/homepage.dart';
import 'package:pdpui3/utils/Strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  static const String id = "intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          PageView(
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _pageController,
            children: [
              makePage(
                image: "assets/images/image_1.png",
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),

              makePage(
                image: "assets/images/image_3.png",
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),

              makePage(
                image: "assets/images/image_2.png",
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(""),
                SmoothPageIndicator(controller: _pageController, count: 3,),

                onLastPage ? GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: const Text("Skip", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w400, fontSize: 18),),
                ) : const Text(""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({required String content, required String title, required String image}){
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title, style: const TextStyle(color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              Text(content, style: const TextStyle(color: Colors.grey, fontSize: 20), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ),
        ],
      ),
    );
  }

}