import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:rideshare/models/home_model.dart';
import 'package:rideshare/widgets/colorConstantsswipe.dart';

class SwipeCard extends StatelessWidget {
  final HomeModel model;

  const SwipeCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
    print(model.name);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ConstantColors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                    fontFamily: 'medium',
                    fontSize: 20,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.35,
              width: width,
              decoration: const BoxDecoration(
                color: ConstantColors.unSelected,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: model.profileImage != ""
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image(
                  image: AssetImage(model.profileImage),
                  fit: BoxFit.cover,
                ),
              )
                  : ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image(
                  image: Image.asset("assets/icons/useers.png").image,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Card(
              elevation: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: Image.asset("assets/icons/bniYear.png").image,
                              height: 23,
                              width: 23,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("",
                              style: const TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 1,
                            color: ConstantColors.black.withOpacity(.20),
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              image: Image.asset("assets/icons/bussinessYear.png").image,
                              height: 17,
                              width: 18,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.inBussiness,
                              style: const TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            width: 1,
                            color: ConstantColors.black.withOpacity(.20),
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                              image: Image.asset("assets/icons/petIcon.png").image,
                              height: 18,
                              width: 17,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("dv",
                              style: const TextStyle(
                                fontFamily: 'medium',
                                fontSize: 12,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/hobbiessIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Hobbies",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),

                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/networkIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Network",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),

                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/skillIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),

                    Divider(
                      thickness: 1,
                      color: ConstantColors.black.withOpacity(.10),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/accompIcon.png",
                          height: 15,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Accomplishments",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontFamily: "medium",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),

                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffACEBFF).withOpacity(0.30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Burning Desire",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "medium",
                      color: Color(0xff327E97),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      model.burningDesire.isEmpty ? "NA" : model.burningDesire,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: "medium",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffE7FAEB).withOpacity(0.30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Success Is",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "medium",
                      color: Color(0xff327E97),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      model.successIs.isEmpty ? "NA" : model.successIs,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: "medium",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffFFEAA0).withOpacity(0.30),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Goal",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: "medium",
                      color: Color(0xff4F4525),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: width,
                    child: Text(
                      model.goals.isEmpty ? "NA" : model.goals,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontFamily: "medium",
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}