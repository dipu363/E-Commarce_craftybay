import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shoes1.jpg',
              width: 140,
              height: 100,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Nick Shoes E7347a',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: grayColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        const Text(
                          '\$350',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                              fontSize: 14),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: const [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amberAccent,
                            ),
                            Text(
                              '4.5',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
