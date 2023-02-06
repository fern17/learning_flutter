import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mag2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(
                    0.6,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.book,
                      color: Colors.white,
                      size: 40,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Recipe trends',
                      style: FooderlichTheme.darkTextTheme.headline2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Chip(
                          label: Text('Healthy',
                              style: FooderlichTheme.darkTextTheme.bodyText1),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {},
                        ),
                        Chip(
                          label: Text('Vegan',
                              style: FooderlichTheme.darkTextTheme.bodyText1),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {},
                        ),
                        Chip(
                          label: Text('Fish',
                              style: FooderlichTheme.darkTextTheme.bodyText1),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {},
                        ),
                      ],
                    ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
