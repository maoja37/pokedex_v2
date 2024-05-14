
import 'package:flutter/material.dart';
import 'package:pokedex_v2/global/constants/app_images.dart';
import 'package:pokedex_v2/global/constants/spacing.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.yellow,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 20,
             
              child: Image.asset(kProfilePicture
              ),
            ),
          ),
          const HorizontalSpacing(10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Muyiwa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              VerticalSpacing(4),
              Text(
                'lvl 04',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ]),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.location_searching_outlined,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}