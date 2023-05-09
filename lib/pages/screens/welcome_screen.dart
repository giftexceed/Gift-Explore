import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gift_explore/widgets/widgets.dart';

import '../../cubit/app_cubit.dart';
import '../../widgets/button.dart';
import '../../widgets/text.dart';
import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = ["grand-canyon.jpeg", "eiffel-tower.jpeg", "vacation.jpeg"];
  List bigText = ["Grand Canyon", "Eiffel Tower", "Miami Beach"];
  List country = ["Arizona, USA", "Paris, France", "Florida"];
  List smallText = [
    "...visit the magnificent Grand Canyon! Witness one of the world greatest wonders!",
    "...visit Paris, see the beautiful man made structures",
    "...dubai has most of the luxurious relaxation place & resorts",
  ];

  @override
  Widget build(BuildContext context) {
    AppText appText = AppText();
    AppWidget appWidget = AppWidget();
    return Scaffold(
        body: PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (_, index) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/" + images[index],
            ),
            fit: BoxFit.cover,
          )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(
                  top: 150, bottom: 300, left: 20, right: 20),
              color: Colors.white38,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText.largeText(text: bigText[index]),
                        appWidget.sizedBox(height: 5),
                        appText.mediumText(
                            text: country[index], color: Colors.black87),
                        appWidget.sizedBox(height: 12),
                        Container(
                          width: 250,
                          child: appText.smallText(
                            text: smallText[index],
                          ),
                        ),
                        appWidget.sizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()),
                            );
                          },
                          child: Container(
                            width: 200,
                            child: const AppButton(
                              buttonWidth: 100,
                              text: "Proceed",
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (dotsIndex) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 4),
                          width: 6,
                          height: index == dotsIndex ? 25 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == dotsIndex
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ]),
            ),
          ),
        );
      },
    ));
  }
}
