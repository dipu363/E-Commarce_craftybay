import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class HomeCaroselWidget extends StatelessWidget {
  HomeCaroselWidget({super.key});
  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentCaroselIndex = ValueNotifier(0);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              onPageChanged: (index, _){
                _currentCaroselIndex.value = index;
              },
              height: 180.0,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 5)),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'text $i',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _currentCaroselIndex,
          builder: (BuildContext context, value,_) {

            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i = 0; i<5; i++)
                  Padding(
                    padding:  const EdgeInsets.all(2.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: value == i? primaryColor : null,
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