import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '/data/model/product_slider_model.dart';
import '../../utils/app_colors.dart';

class HomeCarouselWidget extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);
  final ProductSliderModel productSliderModel;

  HomeCarouselWidget({super.key, required this.productSliderModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              onPageChanged: (index, _) {
                _currentCarouselIndex.value = index;
              },
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 5)),
          items: productSliderModel.sliderData!.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        slider.image?? ''
                      )
                    )
                  ),
                  alignment: Alignment.center,
            
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _currentCarouselIndex,
          builder: (BuildContext context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < (productSliderModel.sliderData!.length); i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: value == i ? primaryColor : null,
                        border: Border.all(
                          color: grayColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
