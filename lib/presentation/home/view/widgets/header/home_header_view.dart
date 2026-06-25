import 'package:event_hub/presentation/home/view/widgets/header/home_category_list.dart';
import 'package:event_hub/presentation/home/view/widgets/header/home_header_app_bar.dart';
import 'package:event_hub/presentation/home/view/widgets/header/home_header_search_view.dart';
import 'package:flutter/material.dart';

class HomeHeaderView extends StatelessWidget {
  const HomeHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        clipBehavior: Clip.none, 
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
            decoration: const BoxDecoration(
              color: Color(0xFF4A43EC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    HomeHeaderAppBar(), 
                    SizedBox(height: 20), 
                    HomeHeaderSearchBar(),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20), 
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: HomeCategoryList(),
          ),
        ],
      ),
    );
  }
}
