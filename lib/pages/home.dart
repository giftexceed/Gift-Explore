// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_cubit.dart';
import '../cubit/cubit_state.dart';
import '../widgets/text.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  var images = {
    "grand-canyon.jpeg": "Grand Canyon",
    "eiffel;-tower.jpeg": "Paris Tower",
    "vacation.jpeg": " Ibeza UAE",
    "grand-canyon.jpeg": "Canyon",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    AppText _appText = AppText();
    AppWidget _appWidget = AppWidget();

    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        print('Image ${info.toList()}');

        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            _appWidget.sizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(right: 180),
              child: _appText.largeText(text: "Discover"),
            ),
            _appWidget.sizedBox(height: 15),
            Container(
              child: Align(
                // alignment: Alignment.centerLeft,
                child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        color: Theme.of(context).primaryColor, radius: 5),
                    tabs: const [
                      Tab(text: "Place"),
                      Tab(text: "Experience"),
                      Tab(text: "Imagination"),
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context)
                              .detailPage(info[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(info[index].img!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                const Text("Exp"),
                const Text("Img"),
              ]),
            ),
            _appWidget.sizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _appText.largeText(text: "Explore more", size: 20),
                  _appText.smallText(text: "see all", size: 20),
                ],
              ),
            ),
            _appWidget.sizedBox(height: 10),
            Container(
              height: 110,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 15),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          Container(
                            // margin: const EdgeInsets.only(right: 50),
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/" +
                                      images.keys.elementAt(index),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          _appWidget.sizedBox(height: 5),
                          Container(
                            child: _appText.smallText(
                                text: images.values.elementAt(index), size: 12),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({
    required this.color,
    required this.radius,
  });
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
