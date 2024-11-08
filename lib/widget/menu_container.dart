import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiket_konser_app/colors/app_colors.dart';

class MenuContainer extends StatelessWidget {
  final String price;
  final String ingredints;
  final String time;
  final String image;
  final String title;
  final String date;
  final String location;
  const MenuContainer({
    super.key,
    required this.time,
    required this.image,
    required this.title,
    required this.date,
    required this.location,
    required this.price,
    required this.ingredints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 295,
        width: double.infinity,
        decoration: BoxDecoration(
          color: peach,
          borderRadius: BorderRadius.circular(8),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.ibmPlexMono(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
