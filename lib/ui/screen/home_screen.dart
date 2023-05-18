
import '../widget/caregoty_card_widget.dart';
import '../widget/product_card_widget.dart';
import '/ui/utils/app_colors.dart';

import 'package:flutter/material.dart';

import '../widget/home/app_bar_icon_boutton.dart';
import '../widget/home/home_carosel.dart';
import '../widget/home/marker_title.dart';
import '../widget/home/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(iconData: Icons.person_outline, onTap: () {}),
            AppBarIconButton(iconData: Icons.call_outlined, onTap: () {}),
            AppBarIconButton(
                iconData: Icons.notifications_outlined, onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children:[
                const  SearchTextField(),
                const SizedBox(height: 16),
                HomeCaroselWidget(),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                  title: 'All Categories',
                  onTap: (){},
                ),
                const SizedBox(height: 8),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: const [
                        CategoryCardWidget(name: 'Computer',),
                        CategoryCardWidget(name: 'Electronics',),
                        CategoryCardWidget(name: 'Food',),
                        CategoryCardWidget(name: 'Accessories',),
                        CategoryCardWidget(name: 'Home Appliance',),

                     ],
                   ),
                 ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                  title: 'Popular',
                   onTap: (){},
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Row(
                     children: const[
                       ProductCardWidget(),
                       ProductCardWidget(),
                       ProductCardWidget(),
                       ProductCardWidget(),
                     ],
                   ),
                 ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                   title: 'Spacial',
                   onTap: (){},
                 ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const[
                      ProductCardWidget(),
                      ProductCardWidget(),
                      ProductCardWidget(),
                      ProductCardWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                   title: 'New',
                   onTap: (){},
                 ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const[
                      ProductCardWidget(),
                      ProductCardWidget(),
                      ProductCardWidget(),
                      ProductCardWidget(),
                    ],
                  ),
                ),
          ],
          ),
        ),
      ),
    );
  }
}





