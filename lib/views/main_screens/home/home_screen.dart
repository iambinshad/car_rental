

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rental_app_demo/utils/themes/app_colors.dart';
import 'package:rental_app_demo/views/main_screens/home/filter_bottomsheet.dart';
import 'package:rental_app_demo/views/main_screens/home/widgets_elements.dart';
import 'package:rental_app_demo/views/widgets/widgets.dart';

class HomeScreenTwo extends StatelessWidget {
  const HomeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
      SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary, // Match your app bar color
        statusBarIconBrightness:
            Brightness.light, // Adjust icons for visibility
      ),
    );
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location and Search Bar Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Color(0xFF0B5D3A),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "LOCATION",
                            fontSize: 12,
                            color: AppColors.white,
                          ),
                          Gap(4),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.place,
                                  size: 18,
                                  color: AppColors.white,
                                ),
                              ),
                              AppText(
                                "New York, USA",
                                fontSize: 16,
                                color: AppColors.textwhiteSecondary,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CircledIcon(
                            circleColor: AppColors.circleAvatarBackground,
                            iconColor: AppColors.white,
                            badgeValue: "2",
                            icon: Icons.notifications_outlined,
                          ),
                          const Gap(
                            12,
                          ),
                          CircledIcon(
                            circleColor: AppColors.circleAvatarBackground,
                            iconColor: AppColors.white,
                            badgeValue: "2",
                            icon: Icons.shopping_cart_outlined,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Search Bar
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              const Icon(CupertinoIcons.search,
                                  color: Colors.grey),
                              const SizedBox(width: 8),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search "Tata"',
                                    border: InputBorder.none,
                                    // hintStyle:
                                    //     TextStyle(color: Colors.grey[400]),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.mic, color: Colors.grey),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Gap(9),
                      CircledIcon(
                        ontap: () {
                          // log((orientation==Orientation.portrait).toString())''
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) => const PriceRangeBottomSheet(),
                          );
                        },
                        circleColor: AppColors.white,
                        iconColor: AppColors.iconGrey,
                        badgeValue: "1",
                        icon: Icons.filter_alt_outlined,
                      ),
                    ],
                  ),
                  const Gap(12)
                ],
              ),
            ),

            // Date Selection Section
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        DateSectionWidget(
                            value: 'October 1, 2024',
                            title: "Start Date & Time"),
                        SizedBox(width: 16),
                        DateSectionWidget(
                            value: 'October 4, 2024', title: "End Date"),
                      ],
                    ),
                  ),

                  // Ride Options Section
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Ride options',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // padding: const EdgeInsets.symmetric(horizontal: 0),
                        // scrollDirection: Axis.horizontal,
                        children: [
                          buildRideOption(
                              'https://s3-alpha-sig.figma.com/img/5769/bbeb/60e0f438b30252ec8c5d652a4298ab8b?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nJ9TvPf2lOtKN0nBjFH0~qJpwX10LjI5GwmSuSCwuLt8Ccn77VurzBfl9GVEfm3gtErIGHJ6yHgJtdrjLv5CmIfTHDRx-YgHNwC1W9hVsKXAcbxADPvDx5jaY3P3OecI5vTJW0wRQUAtC0yd0usq4ODe6~Ak49JKr~~06pDFKfYMdsHPfvLkCN6aWYEJvBRPOdOYG8u9CRBH5OTf1Zlg0MTEh9ra0YIw9qlzp5ZjkF~OYiG5ajXSFtxbf6ihRWFb7X81wPGsiqdboi27l92166XrOHVMmAxbxL1HlZd7jZzeGYyTj5zAYGmGnkigamu7YS9ZlAbiSGIWtqcJh5qKzw__',
                              'Sedans'),
                          buildRideOption(
                              'https://s3-alpha-sig.figma.com/img/e4d0/548c/989595565347690200de889fc3d9f2f4?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=PG3NN8hbmnkPSqj3a9bI29GVL9kKvdWOAztNeTOVR-SH2An4CVQKMgv1GGIBFGCVAIbYve3AEaQVIOwC89PKLFaY2MnSmhx0ENoz2FplzGsqD6~KII7AU6Lchv5~QdIxcH~83jvDkUqWVgKx29hj-aj~P5D3Cs5leDlCPtXzuNtWt38wiqDSN9wOMwYGwO4yM8aaIYqVfzVswcDQaeauU95Iv51zujdGBRGQX3B5QgyKa8jTBSj9RDfiW8r22Y8NUuVMlMf~CgSmBq~XhA9~7WvESaBrwDiLf7vyygr8x3xH6l3DeTJF6HCnFhC4zd8eB3pGuMc2f8ARDYkJ5R9~sA__',
                              'SUV'),
                          buildRideOption(
                              'https://s3-alpha-sig.figma.com/img/f8a4/f3c5/83e69979b57cfe7604815616bf3d6a7f?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=nA~OcIzj-ggpQXrYejSg~7Xs3FPo7dhP58otUW6xRj3hAtGEAaY1muvCXKkGW-NOToFa01Och81SdbWZxvBP40vUaQOnDUKge5vf2HWNpBrt4VDMWiK3vyBvbo~KdBTjWoYb6vF-RbsxGTNIyA~hs70H2CgPiIiYROq6T-0WGywkO149NNe6aH3FysfrphgR39jYFzymi0jZAu2y84y2bbTBWN0-B-WQRFnICkA-6sAfSh1lzrBa6~OCTCKTV05U9YCIMQ0SCasoA~UdqaPHqUdgc0AMwTYzr-QMbkRcWq6GS4ZPNDutyXk2qbQNQQB76CX3jEczmvOXPdU5WIYmvg__',
                              'Trucks'),
                          buildRideOption(
                              'https://s3-alpha-sig.figma.com/img/010a/c95f/3d3365865a1f013fce8ae11a11b9e0a2?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gVPnMQSq0IlR61o76YKxXWhNaojXSuy9J3xR6-oNZAm47UvpLWDJKEJlLtJBQD9tD9ayzEENyGyVv-sRCLBG2LCzr6ygrtU8zjc4zsfdnh7AWyuKVgIke~ZrO79mreD51Dt6O7in6FLqCnJakMOpsVoaBhgFdnAlMs8iPIBW0STXSOixB5O5njRNk1wv7eiHjTiSQ7LYAfWrGB9O1vIdIIF1BDpnMDVWjzOqh8LnapzkKeWYRhp86-qO-BGbVvNJsuqL3bPbh1ITlDvYNhPbfmbwICEix2H00RV49vgjIUBVN2JVibK5rwjy6~YzR-znSSxgCd-mb~4N3V20rbwYaA__',
                              'Electric'),
                          buildRideOption('', 'View All'),
                        ],
                      ),
                    ),
                  ),

                  // Popular Cars Section
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Cars',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            color: Color(0xFF0B5D3A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Car Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: OrientationBuilder(
                      builder: (context, orientation) => 
                       Column(
                        children: [
                          buildCarCard(
                            'Toyota Corolla',
                            4.8,
                            'Sedans',
                            'Manual',
                            'Petrol',
                            '5 Seats',
                            '7,000',
                            'https://s3-alpha-sig.figma.com/img/ae74/a9e7/f68182d3f5fd6e910be717cb9f8591cb?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jIdADmQL-923FDGfRrSW4LV~wJcQ6582TS~708NOQH6IL-~SuBys1E8~SlkAdzL03ODBWMzZ2vQAcvn04DtIAb585fasBNWdUomezNL7xUFcqnqGAjiF4XOC4ow2sfeWGQotrFp2uwnuDVGtIDuoSXGZKWenMrtoJOk8biMsBagnJfJ5v8~vezp89lVUku2xQfQk~0MLvkz7p6RkPGrPuIZSoUH7wAbC8OpYnA3wtspUjjgBoTTa182rgMgS4we4TzTuWna8VyafSIUSqmMkV1s9bIY82KSuPt6TLvloptfG5dNbmEnp6T5IuefBBMO-phtQ6N4A581IFl9Wx382Ig__',context,orientation,mediaQuery
                          ),
                          const SizedBox(height: 16),
                          buildCarCard(
                            'Tesla Model 3',
                            4.8,
                            'Electric',
                            'Automatic',
                            'Electric',
                            '5 Seats',
                            '9,000',
                            'https://s3-alpha-sig.figma.com/img/ae74/a9e7/f68182d3f5fd6e910be717cb9f8591cb?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jIdADmQL-923FDGfRrSW4LV~wJcQ6582TS~708NOQH6IL-~SuBys1E8~SlkAdzL03ODBWMzZ2vQAcvn04DtIAb585fasBNWdUomezNL7xUFcqnqGAjiF4XOC4ow2sfeWGQotrFp2uwnuDVGtIDuoSXGZKWenMrtoJOk8biMsBagnJfJ5v8~vezp89lVUku2xQfQk~0MLvkz7p6RkPGrPuIZSoUH7wAbC8OpYnA3wtspUjjgBoTTa182rgMgS4we4TzTuWna8VyafSIUSqmMkV1s9bIY82KSuPt6TLvloptfG5dNbmEnp6T5IuefBBMO-phtQ6N4A581IFl9Wx382Ig__',context,orientation,mediaQuery
                          ),
                          const SizedBox(height: 16),
                          buildCarCard(
                            'Tesla Model 3',
                            4.8,
                            'Electric',
                            'Automatic',
                            'Electric',
                            '5 Seats',
                            '9,000',
                            'https://s3-alpha-sig.figma.com/img/ae74/a9e7/f68182d3f5fd6e910be717cb9f8591cb?Expires=1734912000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jIdADmQL-923FDGfRrSW4LV~wJcQ6582TS~708NOQH6IL-~SuBys1E8~SlkAdzL03ODBWMzZ2vQAcvn04DtIAb585fasBNWdUomezNL7xUFcqnqGAjiF4XOC4ow2sfeWGQotrFp2uwnuDVGtIDuoSXGZKWenMrtoJOk8biMsBagnJfJ5v8~vezp89lVUku2xQfQk~0MLvkz7p6RkPGrPuIZSoUH7wAbC8OpYnA3wtspUjjgBoTTa182rgMgS4we4TzTuWna8VyafSIUSqmMkV1s9bIY82KSuPt6TLvloptfG5dNbmEnp6T5IuefBBMO-phtQ6N4A581IFl9Wx382Ig__',context,orientation,mediaQuery
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(24)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
