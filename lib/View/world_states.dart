import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/Utilities/states_services.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:covid_tracker/View/reusable/reusable_row.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animatedController = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animatedController.dispose();
  }

  final ColorList = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  FutureBuilder(
                    future: statesServices.fetchWorldStatesRecord(),
                    builder:
                        (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(
                            child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _animatedController,
                        ));
                      } else {
                        return Column(
                          children: [
                            PieChart(
                              dataMap: {
                                "Total": double.parse(
                                    snapshot.data!.cases!.toString()),
                                "Recovered": double.parse(
                                  snapshot.data!.recovered.toString(),
                                ),
                                "Death": double.parse(
                                  snapshot.data!.deaths!.toString(),
                                ),
                              },
                              chartValuesOptions: const ChartValuesOptions(
                                  showChartValuesInPercentage: true),
                              animationDuration:
                                  const Duration(milliseconds: 1200),
                              chartRadius: width / 3.2,
                              legendOptions: const LegendOptions(
                                  legendPosition: LegendPosition.left),
                              chartType: ChartType.ring,
                              colorList: ColorList,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.06),
                              child: Card(
                                child: Column(
                                  children: [
                                    ReusableRow(
                                        title: "Cases",
                                        value:
                                            snapshot.data!.cases!.toString()),
                                    ReusableRow(
                                        title: "Recovered",
                                        value: snapshot.data!.recovered!
                                            .toString()),
                                    ReusableRow(
                                        title: "deaths",
                                        value:
                                            snapshot.data!.deaths!.toString()),
                                    ReusableRow(
                                        title: "Active",
                                        value:
                                            snapshot.data!.active!.toString()),
                                    ReusableRow(
                                        title: "Critical",
                                        value: snapshot.data!.critical!
                                            .toString()),
                                    ReusableRow(
                                        title: "Today Cases",
                                        value: snapshot.data!.todayCases!
                                            .toString()),
                                    ReusableRow(
                                        title: "Today Deaths",
                                        value: snapshot.data!.todayDeaths!
                                            .toString()),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CountriesListScreen(),
                                    ));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1aa260),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text("Track Countries"),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
