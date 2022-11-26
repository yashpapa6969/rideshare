import 'dart:developer';
import 'package:flutter/cupertino.dart';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:rideshare/models/home_model.dart';
import 'package:rideshare/screens/swipe_card.dart';

class Example extends StatefulWidget {
  const Example({
    Key? key,
  }) : super(key: key);

  @override
  State<Example> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<Example> {
  final AppinioSwiperController controller = AppinioSwiperController();

  List<SwipeCard> cards = [];

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  void _loadCards() {
    for (HomeModel candidate in candidates) {
      cards.add(
        SwipeCard(
          key: Key(candidate.name),
          model: candidate,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AppinioSwiper(
              unlimitedUnswipe: true,
              controller: controller,
              unswipe: _unswipe,
              cards: cards,
              onSwipe: _swipe,
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 50,
                bottom: 40,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 80,
              ),
              swipeLeftButton(controller),
              const SizedBox(
                width: 20,
              ),
              swipeRightButton(controller),
              const SizedBox(
                width: 20,
              ),
              unswipeButton(controller),
            ],
          )
        ],
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    log("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      log("SUCCESS: card was unswiped");
    } else {
      log("FAIL: no card left to unswipe");
    }
  }
}

class ExampleButton extends StatelessWidget {
  final Function onTap;
  final Widget child;

  const ExampleButton({
    required this.onTap,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: child,
    );
  }
}

//swipe card to the right side
Widget swipeRightButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeRight(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: CupertinoColors.activeGreen,
        borderRadius: BorderRadius.circular(50),

      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.check,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//swipe card to the left side
Widget swipeLeftButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.swipeLeft(),
    child: Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFF3868),
        borderRadius: BorderRadius.circular(50),

      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.close,
        color: CupertinoColors.white,
        size: 40,
      ),
    ),
  );
}

//unswipe card
Widget unswipeButton(AppinioSwiperController controller) {
  return ExampleButton(
    onTap: () => controller.unswipe(),
    child: Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      child: const Icon(
        Icons.rotate_left_rounded,
        color: CupertinoColors.systemGrey2,
        size: 40,
      ),
    ),
  );
}

List<HomeModel> candidates = [
  HomeModel(
    name: 'ganesh bhat',
    burningDesire: 'Testing blood',
    successIs: 'Landing a governament job',
    inBussiness: 'yes',
    bussinessCategory: 'Govermanemt service',
    mySpecialization: 'Bionics and boitechnology',
    goals: 'peaceful retirement',
    residenceNow: 'KR pura, East Vimanpura, Bengaluru',
    interest: 'Diseases',
    noOfPets: '0',
    myFavouriteCoreValue: 'Work is worship',
    id: '123',
    profileImage: 'images/sumuka.jpeg.png',
  ),
  HomeModel(
    name: 'Gomukha Hegde',
    burningDesire: 'Finding love',
    successIs: 'Placeing in a good college',
    inBussiness: 'No',
    bussinessCategory: 'none',
    mySpecialization: 'Electrical science',
    goals: 'Getting a high CTC',
    residenceNow: 'Vibhutiura main road, Ramesh nagar, Bengaluru',
    interest: 'Astrophysics',
    noOfPets: '3',
    id: '69',
    myFavouriteCoreValue: 'gyanam vigyanam cha',
    profileImage: 'images/yashcircle.jpeg.png',
  ),
  HomeModel(
    name: 'Somesh kumar',
    burningDesire: 'To solve as many problems as possible',
    successIs: 'Landing a good job',
    inBussiness: 'yes',
    bussinessCategory: 'Instrumentation',
    mySpecialization: 'Sensor technology',
    goals: 'Solving problems',
    residenceNow: 'GM palya, Vigyan nagar, Bengaluru',
    interest: 'Integrated circutes',
    noOfPets: '2',
    id: '121',
    myFavouriteCoreValue: 'When the going gets though the tough gets going',
    profileImage: 'images/boys.jpg',
  ),
  HomeModel(
    name: 'Soamnath singh',
    burningDesire: 'To run for prime minister',
    successIs: 'Good rank in JEE mains',
    inBussiness: 'No',
    bussinessCategory: 'none',
    mySpecialization: 'Phsycology',
    goals: 'To become a good leader',
    residenceNow: '18th cross, Malleshwaram, Bengaluru',
    interest: 'Emotional impacts of literature',
    noOfPets: '1',
    id: '122',
    myFavouriteCoreValue: 'Flow like the wind, crash like water',
    profileImage: 'images/amith.jpeg',
  ),
  HomeModel(
    name: 'S Rohan',
    burningDesire: 'To become rich',
    successIs: 'Having a lavish life',
    inBussiness: 'Yes',
    bussinessCategory: 'Marketing',
    mySpecialization: 'Digital marketing',
    goals: 'To find success in my workplace',
    residenceNow: 'Suranjan das road, Hal 2nd Stage, Bengaluru',
    interest: 'Social media influencers',
    noOfPets: '5',
    id: '124',
    myFavouriteCoreValue: 'The power to persuade is the strongest',
    profileImage: 'images/girls.jpg',
  )
];

const LinearGradient gradientRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF3868),
    Color(0xFFFFB49A),
  ],
);

const LinearGradient gradientPurple = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF736EFE),
    Color(0xFF62E4EC),
  ],
);

const LinearGradient gradientBlue = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF0BA4E0),
    Color(0xFFA9E4BD),
  ],
);

const LinearGradient gradientPink = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFF6864),
    Color(0xFFFFB92F),
  ],
);

const LinearGradient kNewFeedCardColorsIdentityGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF7960F1),
    Color(0xFFE1A5C9),
  ],
);
