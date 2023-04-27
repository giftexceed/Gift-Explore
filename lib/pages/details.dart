import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_cubit.dart';
import '../cubit/cubit_state.dart';
import '../widgets/button.dart';
import '../widgets/text.dart';
import '../widgets/widgets.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int starRating = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    AppText _appText = AppText();
    AppWidget _appWidget = AppWidget();
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState _detail = state as DetailState;
      return Scaffold(
          body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 380,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      _detail.place.img!,
                    ),
                    fit: BoxFit.cover,
                  )),
                )),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).returnHome();
                      },
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    )
                  ],
                )),
            Positioned(
              top: 300,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                width: MediaQuery.of(context).size.width,
                height: 620,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _appWidget.sizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _appText.largeText(
                            text: _detail.place.name,
                            size: 24,
                            color: Colors.black54),
                        _appText.largeText(
                            text: _detail.place.price.toString(),
                            size: 24,
                            color: Theme.of(context).primaryColor),
                      ],
                    ),
                    _appWidget.sizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: Theme.of(context).primaryColor),
                        _appText.smallText(text: _detail.place.location),
                      ],
                    ),
                    _appWidget.sizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < starRating
                                    ? Colors.amberAccent
                                    : Colors.grey);
                          }),
                        ),
                        _appWidget.sizedBox(width: 10),
                        _appText.smallText(text: _detail.place.stars.toString())
                      ],
                    ),
                    _appWidget.sizedBox(height: 18),
                    _appText.largeText(
                      text: "Community",
                      size: 22,
                      color: Colors.black54,
                    ),
                    _appWidget.sizedBox(height: 8),
                    _appText.smallText(
                      text: " ${_detail.place.people} People in your community",
                      color: Colors.black54,
                    ),
                    _appWidget.sizedBox(height: 10),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: _appWidget.appButton(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              bgColor: selectedIndex == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.shade200,
                              size: 60,
                              borderColor: selectedIndex == index
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              isIcon: false,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    _appWidget.sizedBox(height: 10),
                    _appText.largeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.5),
                        size: 20),
                    _appWidget.sizedBox(height: 10),
                    _appText.smallText(
                        text: _detail.place.description,
                        color: Colors.black.withOpacity(0.5),
                        size: 14),
                  ],
                ),
              ),
            ),
            _appWidget.sizedBox(height: 10),
            Positioned(
                bottom: 0,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _appWidget.appButton(
                      color: Colors.black,
                      bgColor: Colors.grey.shade200,
                      size: 60,
                      borderColor: Colors.grey,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    _appWidget.sizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: const AppButton(
                        buttonWidth: 150,
                        text: "Continue",
                        responsive: true,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ));
      ;
    });
  }
}
