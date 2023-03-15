import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theme_demo/main.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController? _controller;
  late Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      // duration: const Duration(seconds: 3),
    );
    // _animation = CurvedAnimation(
    //   parent: _controller!,
    //   curve: Curves.easeInOut,
    // );
    // _controller!.forward().then((value) {
    //   navigateTo();
    //   // Navigate to the home screen after the animation has finished.
    //   // You can use Navigator.pushReplacement() to navigate to a new screen
    //   // and remove the current screen from the navigation stack.
    // });
  }

  navigateTo() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Home'),
        ));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lotties/truck_logo.json',
          controller: _controller,
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _controller!
              ..duration = composition.duration
              ..forward().then((value) => navigateTo());
          },
        ),
        // ScaleTransition(
        //   scale: _animation!,
        //   child: Image.asset(
        //     'assets/app-design/images/image-10-bg-Av4.png',
        //     width: 200,
        //     height: 200,
        //   ),
        // ),
      ),
    );
  }
}
