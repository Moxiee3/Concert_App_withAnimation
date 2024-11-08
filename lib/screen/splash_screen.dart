import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiket_konser_app/colors/app_colors.dart';
import 'package:tiket_konser_app/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoOpacityAnimation;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<double> _buttonOpacityAnimation;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );
    super.initState();

    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );

    _logoSlideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0,
          0.5,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _buttonOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeIn),
      ),
    );

    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.8, curve: Curves.elasticOut),
      ),
    );

    _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SlideTransition(
            position: _logoSlideAnimation,
            child: FadeTransition(
              opacity: _logoOpacityAnimation,
              child: SizedBox(
                height: 350,
                width: double.infinity,
                child: Image.asset(
                  'images/bg2.png',
                ),
              ),
            ),
          ),
          const Spacer(),
          ScaleTransition(
            scale: _buttonScaleAnimation,
            child: FadeTransition(
              opacity: _buttonOpacityAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: black,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: black,
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: Offset(1.5, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: FadeTransition(
                        opacity: _textOpacityAnimation,
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.ibmPlexMono(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
