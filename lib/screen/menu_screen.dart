import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiket_konser_app/colors/app_colors.dart';
import 'package:tiket_konser_app/model/menu_model.dart';
import 'package:tiket_konser_app/widget/menu_container.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideUpAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideUpAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<MenuModel> menuItems = [
      const MenuModel(
        image: 'images/1.jpg',
        title: 'Hindia',
        price: '15',
        ingredints: ' ',
      ),
      const MenuModel(
        image: 'images/2.jpg',
        title: 'Feast',
        price: '12',
        ingredints: ' ',
      ),
      const MenuModel(
        image: 'images/3.jpg',
        title: 'Lomba Sihir',
        price: '12',
        ingredints: ' ',
      ),
      const MenuModel(
        image: 'images/4.jpg',
        title: 'Feel Koplo',
        price: '15',
        ingredints: ' ',
      ),
      const MenuModel(
        image: 'images/5.jpg',
        title: 'Danilla',
        price: '15',
        ingredints: ' ',
      ),
      const MenuModel(
        image: 'images/6.jpg',
        title: 'Pamungkas',
        price: '15',
        ingredints: ' ',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _fadeInAnimation,
                child: SlideTransition(
                  position: _slideUpAnimation,
                  child: Text(
                    'Guest Star',
                    style: GoogleFonts.jotiOne(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 15,
                    childAspectRatio: (0.850 / 1.2),
                  ),
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final animationDelay = 0.2 * index;
                    final itemController = AnimationController(
                      vsync: this,
                      duration: const Duration(seconds: 2),
                    )..forward();

                    final fadeInAnimation = CurvedAnimation(
                      parent: itemController,
                      curve: Interval(
                        animationDelay,
                        1.0,
                        curve: Curves.easeIn,
                      ),
                    );

                    final slideUpAnimation = Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: itemController,
                        curve: Interval(animationDelay, 1.0,
                            curve: Curves.easeOut),
                      ),
                    );
                    return FadeTransition(
                      opacity: fadeInAnimation,
                      child: SlideTransition(
                        position: slideUpAnimation,
                        child: MenuContainer(
                          image: menuItems[index].image,
                          title: menuItems[index].title,
                          price: menuItems[index].price,
                          ingredints: menuItems[index].ingredints,
                          time: '',
                          date: '',
                          location: '',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
