import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class TrackerView extends StatelessWidget {
//   const TrackerView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TrackerView'),
//       ),
//     );
//   }
// }

import 'dart:convert';

// import 'package:casino_buddy/models/budget_tracker_model.dart';
import 'package:intl/intl.dart';
import 'package:leasure_buddy/modules/appbar/app_bar_method.dart';
import 'package:leasure_buddy/modules/tracker/cubit/tracker_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BudgetTrackerService {
  static const String _camblingListKey = 'camblingList';
  static const String _diningListKey = 'diningList';
  static const String _entertainmentListKey = 'entertainmentList';
  static const String _accommodationListKey = 'accommodationList';
  static const String _miscellaneousListKey = 'miscellaneousList';

  //! Budget
  static const String _gamblingBudgetKey = 'gamblingBudget';
  static const String _diningBudgetKey = 'diningBudgetKey';
  static const String _entertainmentBudgetKey = 'entertainmentBudgetKey';
  static const String _accommodationBudgetKey = 'accommodationBudgetKey';
  static const String _miscellaneousBudgetKey = 'miscellaneousBudgetKey';

  Future<void> saveCamblingList(List<BudgetTracker> camblingList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        camblingList.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList(_camblingListKey, jsonList);
  }

  Future<List<BudgetTracker>> loadCamblingList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_camblingListKey);
    if (jsonList != null) {
      return jsonList
          .map((item) => BudgetTracker.fromJson(jsonDecode(item)))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> saveDiningList(List<BudgetTracker> diningList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        diningList.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList(_diningListKey, jsonList);
  }

  Future<List<BudgetTracker>> loadDiningList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_diningListKey);
    if (jsonList != null) {
      return jsonList
          .map((item) => BudgetTracker.fromJson(jsonDecode(item)))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> saveEntertainmentList(
      List<BudgetTracker> entertainmentList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        entertainmentList.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList(_entertainmentListKey, jsonList);
  }

  Future<List<BudgetTracker>> loadEntertainmentList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_entertainmentListKey);
    if (jsonList != null) {
      return jsonList
          .map((item) => BudgetTracker.fromJson(jsonDecode(item)))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> saveAccommodationList(
      List<BudgetTracker> accommodationList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        accommodationList.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList(_accommodationListKey, jsonList);
  }

  Future<List<BudgetTracker>> loadAccommodationList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_accommodationListKey);
    if (jsonList != null) {
      return jsonList
          .map((item) => BudgetTracker.fromJson(jsonDecode(item)))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> saveMiscellaneousList(
      List<BudgetTracker> miscellaneousList) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        miscellaneousList.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList(_miscellaneousListKey, jsonList);
  }

  Future<List<BudgetTracker>> loadMiscellaneousList() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_miscellaneousListKey);
    if (jsonList != null) {
      return jsonList
          .map((item) => BudgetTracker.fromJson(jsonDecode(item)))
          .toList();
    } else {
      return [];
    }
  }

  //! Gambling
  Future<void> saveGamblingBudget(int budget) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_gamblingBudgetKey, budget);
  }

  Future<int> loadGamblingBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_diningBudgetKey) ?? 0;
  }

  //!dining
  Future<void> saveDiningBudget(int budget) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_diningBudgetKey, budget);
  }

  Future<int> loadDiningBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_diningBudgetKey) ?? 0;
  }

  //! Entertainment
  Future<void> saveEntertainmentBudget(int budget) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_entertainmentBudgetKey, budget);
  }

  Future<int> loadEntertainmentBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_entertainmentBudgetKey) ?? 0;
  }

// ! Accommodation
  Future<void> saveAccommodationBudget(int budget) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_accommodationBudgetKey, budget);
  }

  Future<int> loadAccommodationBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_accommodationBudgetKey) ?? 0;
  }

//! Miscellaneous
  Future<void> saveMiscellaneousBudget(int budget) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_miscellaneousBudgetKey, budget);
  }

  Future<int> loadMiscellaneousBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_miscellaneousBudgetKey) ?? 0;
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:math' as math;

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:casino_buddy/models/budget_tracker_model.dart';
// import 'package:casino_buddy/modules/tracker/cubit/tracker_cubit.dart';
// import 'package:casino_buddy/modules/tracker/service/budget_tracker_service.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// import 'package:casino_buddy/models/tracker_model.dart';
// import 'package:casino_buddy/modules/appbar/app_bar_method.dart';
// import 'package:casino_buddy/modules/tracker/widgets/circly_container.dart';

class TrackerView extends StatefulWidget {
  const TrackerView({super.key});

  @override
  State<TrackerView> createState() => _TrackerViewState();
}

class _TrackerViewState extends State<TrackerView> {
  @override
  void initState() {
    super.initState();
    // BudgetTrackerService().loadCamblingList();
    loadData();
  }

  Future<void> loadData() async {
    List<BudgetTracker> loadedCamblingList =
        await BudgetTrackerService().loadCamblingList();
    List<BudgetTracker> loadedDiningList =
        await BudgetTrackerService().loadDiningList();
    List<BudgetTracker> loadedEntertainmentList =
        await BudgetTrackerService().loadEntertainmentList();

    //!  Accommodation
    List<BudgetTracker> loadedAccommodationList =
        await BudgetTrackerService().loadAccommodationList();

    List<BudgetTracker> loadedMiscellaneousList =
        await BudgetTrackerService().loadMiscellaneousList();

    //! Gambling
    int loadedGamblingBudget =
        await BudgetTrackerService().loadGamblingBudget();

    //! Dining
    int loadedDiningBudget = await BudgetTrackerService().loadDiningBudget();

    //! Entertainment
    int loadedEntertainmentBudget =
        await BudgetTrackerService().loadEntertainmentBudget();

    //!  Accommodation
    int loadedAccommodationBudget =
        await BudgetTrackerService().loadAccommodationBudget();

    int loadedMiscellaneousBudget =
        await BudgetTrackerService().loadMiscellaneousBudget();

    setState(() {
      camblingList = loadedCamblingList.reversed
          .toList(); // Reverse the list to sort by last entered
      diningList = loadedDiningList.reversed
          .toList(); // Reverse the list to sort by last entered
      entertainmentList = loadedEntertainmentList.reversed
          .toList(); // Reverse the list to sort by last entered

      //!  Accommodation
      accommodationList = loadedAccommodationList.reversed.toList();

      miscellaneousList = loadedMiscellaneousList.reversed.toList();
    });

    //? number
    gamblingBudget = loadedGamblingBudget;
    diningBudget = loadedDiningBudget;
    entertainmentBudget = loadedEntertainmentBudget;

    //!  Accommodation
    accommodationBudget = loadedAccommodationBudget;
    miscellaneousBudget = loadedMiscellaneousBudget;
  }

  void saveData() async {
    await BudgetTrackerService().saveCamblingList(
        camblingList.reversed.toList()); // Save the reversed list

    await BudgetTrackerService()
        .saveDiningList(diningList.reversed.toList()); // Save the reversed list

    await BudgetTrackerService()
        .saveEntertainmentList(entertainmentList.reversed.toList());
    //!  Accommodation
    await BudgetTrackerService()
        .saveAccommodationList(accommodationList.reversed.toList());

    await BudgetTrackerService()
        .saveMiscellaneousList(miscellaneousList.reversed.toList());

    //! Gambling
    await BudgetTrackerService().saveGamblingBudget(gamblingBudget);
    //! Dining
    await BudgetTrackerService().saveDiningBudget(diningBudget);

    //! Entertainment
    await BudgetTrackerService().saveEntertainmentBudget(entertainmentBudget);

    //!  Accommodation
    await BudgetTrackerService().saveAccommodationBudget(accommodationBudget);
    await BudgetTrackerService().saveMiscellaneousBudget(miscellaneousBudget);
  }

  void updateGamblingBudget() {
    int enteredAmount = int.tryParse(gamblingBudgetCtr.text) ?? 0;
    // setState(
    //   () {
    gamblingBudget += enteredAmount;
    // camblingList.add(
    //   BudgetTracker(
    //     amount: enteredAmount.toString(),
    //     commit: gamblingCommit.text,
    //     data: DateFormat('dd.MM.yyyy').format(DateTime.now()),
    //     // DateTime.now().toIso8601String(),
    //   ),
    // );
    // context.read<TrackerCubit>().saveCamblingList(
    //       BudgetTracker(
    //         amount: enteredAmount.toString(),
    //         commit: gamblingCommit.text,
    //         data: DateFormat('dd.MM.yyyy').format(DateTime.now()),
    // DateTime.now().toIso8601String(),
    // ),
    // );
    //   },
    // );
    saveData();
  }

  void updateDiningBudget() {
    int enteredAmount = int.tryParse(diningBudgetCtr.text) ?? 0;
    setState(
      () {
        diningBudget += enteredAmount;
        diningList.add(
          BudgetTracker(
            amount: enteredAmount.toString(),
            commit: diningCommit.text,
            data: DateFormat('dd.MM.yyyy').format(DateTime.now()),
          ),
        );
      },
    );
    saveData();
  }

  void updateEntertainmentBudget() {
    int enteredAmount = int.tryParse(entertainmentBudgetCtr.text) ?? 0;
    setState(
      () {
        entertainmentBudget += enteredAmount;
        entertainmentList.add(
          BudgetTracker(
            amount: enteredAmount.toString(),
            commit: entertainmentCommit.text,
            data: DateFormat('dd.MM.yyyy').format(DateTime.now()),
          ),
        );
      },
    );
    saveData();
  }

  //!  Accommodation
  void updateAccommodationBudget() {
    int enteredAmount = int.tryParse(accommodationBudgetCtr.text) ?? 0;
    setState(
      () {
        accommodationBudget += enteredAmount;
        accommodationList.add(
          BudgetTracker(
            amount: enteredAmount.toString(),
            commit: accommodationCommit.text,
            data: DateFormat('dd.MM.yyyy').format(DateTime.now()),
          ),
        );
      },
    );
    saveData();
  }

  void updateMiscellaneousBudget() {
    int enteredAmount = int.tryParse(miscellaneousBudgetCtr.text) ?? 0;
    setState(
      () {
        miscellaneousBudget += enteredAmount;
        miscellaneousList.add(
          BudgetTracker(
            amount: enteredAmount.toString(),
            commit: miscellaneousCommit.text,
            data: DateFormat('dd.MM.yyyy').format(DateTime.now()),
          ),
        );
      },
    );
    saveData();
  }

  String? _selectedStatus;

  int current = 0;

  //! Gambling
  final gamblingBudgetCtr = TextEditingController();
  int gamblingBudget = 0;
  final gamblingCommit = TextEditingController();

  //! Dining
  final diningBudgetCtr = TextEditingController();
  int diningBudget = 0;
  final diningCommit = TextEditingController();

  //! entertainment
  final entertainmentBudgetCtr = TextEditingController();
  int entertainmentBudget = 0;
  final entertainmentCommit = TextEditingController();

  //! Accommodation
  final accommodationBudgetCtr = TextEditingController();
  int accommodationBudget = 0;
  final accommodationCommit = TextEditingController();

  //! Miscellaneous
  final miscellaneousBudgetCtr = TextEditingController();
  int miscellaneousBudget = 0;
  final miscellaneousCommit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMethod.appBarMethod(context, 'Budget Tracker'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),
            CarouselSlider(
              options: CarouselOptions(
                height: 150,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    current = index;
                  });
                },
              ),
              items: trackerList.map((i) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: i.colors,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i.title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            if (i.title == 'Gambling')
                              Text('Gambling')
                            // BlocBuilder<TrackerCubit, TrackerState>(
                            //   builder: (context, state) {
                            //     if (state.camblingList.isEmpty) {
                            //       return Center(
                            //         child: Text(
                            //           '0',
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .labelMedium,
                            //         ),
                            //       );
                            //     } else {
                            //       final int totalAmount = state.camblingList
                            //           .map((item) => int.parse(item.amount))
                            //           .reduce((value, element) =>
                            //               value + element);
                            //       return Text(
                            //         '$totalAmount',
                            //         // '${i.amount + gamblingBudget.toInt()}',
                            //         style: Theme.of(context)
                            //             .textTheme
                            //             .labelMedium,
                            //       );
                            //     }
                            //   },
                            // )

                            else if (i.title == 'Dining')
                              Text(
                                '${i.amount + diningBudget.toInt()}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            else if (i.title == 'Entertainment')
                              Text(
                                '${i.amount + entertainmentBudget.toInt()}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            else if (i.title == 'Accommodation')
                              Text(
                                '${i.amount + accommodationBudget.toInt()}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            else if (i.title == 'Miscellaneous')
                              Text(
                                '${i.amount + miscellaneousBudget.toInt()}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            else
                              Text(
                                i.amount.toString(),
                                // gamblingBudget.toString(),
                                // '${i.amount + gamblingBudget.toInt()}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                          ],
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          i.subTitle,
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 25),

            //!  TOTAL
            if (current == 0)
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 280,
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 135,
                              lineWidth: 23,
                              percent:
                                  0.45, // Adjust this value to represent the overall progress
                              backgroundColor: Colors.grey[800]!,
                              progressColor: Colors.red,
                              circularStrokeCap: CircularStrokeCap.round,
                              startAngle: 0,
                            ),
                            SizedBox(
                              width: 140,
                              height: 140,
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 1.5,
                                  // borderData: FlBorderData(border: Border.all()),
                                  sections: [
                                    PieChartSectionData(
                                      color: Colors.blue,
                                      value: miscellaneousBudget.toDouble(),
                                      radius: 21,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xff9646FF),
                                      value: gamblingBudget.toDouble(),
                                      radius: 21,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xff01CA66),
                                      value: diningBudget.toDouble(),
                                      radius: 21,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xffF0AD13),
                                      value: entertainmentBudget.toDouble(),
                                      radius: 21,
                                      title: '',
                                    ),
                                    PieChartSectionData(
                                      color: const Color(0xffC930EF),
                                      value: miscellaneousBudget.toDouble(),
                                      radius: 21,
                                      title: '',
                                    ),
                                    // PieChartSectionData(
                                    //   color: Color(0xff30B6EF),
                                    //   value: 5,
                                    //   radius: 21,
                                    //   title: '',
                                    // ),
                                  ],
                                  centerSpaceRadius: 70,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "5000 USD",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  "1000 USD",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        rowTrackerMethod(
                            'Total', '5000 USD', const Color(0xffD00400)),
                        const Divider(color: Color(0xff2D72F8)),
                        rowTrackerMethod('Gambling', '$gamblingBudget USD',
                            const Color(0xff9646FF)),
                        rowTrackerMethod('Dining', '$diningBudget USD',
                            const Color(0xff01CA66)),
                        rowTrackerMethod(
                            'Entertainment',
                            '$entertainmentBudget USD',
                            const Color(0xffF0AD13)),
                        rowTrackerMethod(
                            'Accomodation',
                            '$accommodationBudget USD',
                            const Color(0xffC930EF)),
                        rowTrackerMethod(
                            'Muscellaneous',
                            '$miscellaneousBudget USD',
                            const Color(0xff30B6EF)),
                        const Divider(color: Color(0xff2D72F8)),
                        const SizedBox(height: 8),
                        rowTrackerMethod(
                            'Remaining', '4000 USD', const Color(0xffDF5203)),
                        const SizedBox(height: 18),
                        Text('Choose your currency',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        // Container(
                        //   width: double.infinity,
                        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).colorScheme.secondary,
                        //     border: Border.all(
                        //       color: const Color(0xff17036b),
                        //     ),
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: DropdownButton<String>(
                        //     dropdownColor:
                        //         Theme.of(context).colorScheme.secondary,
                        //     isExpanded: true,
                        //     hint: Text(
                        //       'Choose your currency',
                        //       style: Theme.of(context).textTheme.displaySmall,
                        //     ),
                        //     value: _selectedStatus,
                        //     items: [
                        //       DropdownMenuItem(
                        //         value: 'USD',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/svg/icon_dollar.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Dollar',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('USD',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/f-amer.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'CAD',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/svg/icon_dollar.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Dollar',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('CAD',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/fl-ca.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'AUD',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/svg/icon_dollar.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Dollar',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('AUD',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/fl-aut.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'NZD',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/svg/icon_dollar.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Dollar',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('NZD',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/fl-nzd.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'EUR',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/svg/icon_euro.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Euro',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('EUR',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/flag-eu.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'GBP',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset('assets/svg/gbp.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Pound',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('GBP',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/flag-gb.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'JPY',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset('assets/svg/yen.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Yen',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('JPY',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/yen.png')
                        //           ],
                        //         ),
                        //       ),
                        //       DropdownMenuItem(
                        //         value: 'CHF',
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset('assets/svg/frank.svg'),
                        //             const SizedBox(width: 5),
                        //             Text('Frank',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 6),
                        //             Text('CHF',
                        //                 style: Theme.of(context)
                        //                     .textTheme
                        //                     .headlineSmall),
                        //             const SizedBox(width: 5),
                        //             Image.asset('assets/images/frank.png')
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //     onChanged: (String? newValue) {
                        //       setState(() {
                        //         _selectedStatus = newValue;
                        //       });
                        //     },
                        //     underline: const SizedBox(),
                        //   ),
                        // ),

                        const SizedBox(height: 24),
                        Text('Add your total budget',
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 7),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextFormField(
                            cursorColor: Colors.white,
                            style: Theme.of(context).textTheme.titleLarge,
                            decoration: InputDecoration(
                              fillColor:
                                  Theme.of(context).colorScheme.secondary,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Add your total budget',
                              hintStyle:
                                  Theme.of(context).textTheme.displaySmall,
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff2D72F8), width: 2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff1ec932),
                                  Color(0xff0db3e3),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Add to Budget',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                      ],
                    ),
                  ),
                ],
              )
            else if (current == 1)
              //! Gambling
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '18%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                '100%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.7, // 70% progresstest
                            backgroundColor: const Color(0xff010A6D),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff01AA76)),
                            minHeight: 5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Add your gambling expence',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: gamblingBudgetCtr,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your total budget',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Add your comment',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: gamblingCommit,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your comment',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        updateGamblingBudget();

                        setState(() {});
                        // saveData();
                        // camblingList.add(
                        //   BudgetTracker(
                        //     amount: gamblingBudgetCtr.text,
                        //     commit: gamblingCommit.text,
                        //     data: DateFormat('dd.MM.yyyy').format(
                        //       DateTime.now(),
                        //     ),
                        //   ),
                        // );
                        gamblingBudgetCtr.clear();
                        gamblingCommit.clear();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Budget',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (camblingList.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your gambling expences',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 18),
                          BlocBuilder<TrackerCubit, TrackerState>(
                              builder: (context, state) {
                            if (state.camblingList.isEmpty) {
                              return const Center(child: Text('null'));
                            } else {
                              return ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.camblingList.length,
                                  itemBuilder: (context, index) {
                                    final camb = state.camblingList[index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      width: double.infinity,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        // const Color(0xff02015D),
                                        border: Border.all(
                                            color: const Color(0xff0907C0),
                                            width: 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              camb.commit,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                            Text(
                                              camb.amount.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            )
                                          ],
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          child: Text(
                                            camb.data,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }
                          }),
                        ],
                      )
                  ],
                ),
              )
            else if (current == 2)
              //! Dining
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '18%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                '100%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.7, // 70% progresstest
                            backgroundColor: const Color(0xff010A6D),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff01AA76)),
                            minHeight: 5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Add your dining expence',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: diningBudgetCtr,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your dining budget',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Add your comment',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: diningCommit,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your comment',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                        // saveData();
                        updateDiningBudget();
                        // diningList.add(
                        //   BudgetTracker(
                        //     amount: diningBudget.text,
                        //     commit: diningCommit.text,
                        //     data: DateFormat('dd.MM.yyyy').format(
                        //       DateTime.now(),
                        //     ),
                        //   ),
                        // );
                        diningBudgetCtr.clear();
                        diningCommit.clear();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Budget',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (diningList.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your dining expences',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 18),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: diningList.length,
                              itemBuilder: (context, index) {
                                final dining = diningList[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    // const Color(0xff02015D),
                                    border: Border.all(
                                        color: const Color(0xff0907C0),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dining.commit,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(
                                          dining.amount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        )
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        dining.data,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )
                  ],
                ),
              )
            else if (current == 3)
              //! Entertainment
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '18%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                '100%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.7, // 70% progresstest
                            backgroundColor: const Color(0xff010A6D),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff01AA76)),
                            minHeight: 5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Add your entertainment expence',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: entertainmentBudgetCtr,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your entertainment budget',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff2D72F8),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Add your comment',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: entertainmentCommit,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Your entertainment expences',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff2D72F8),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                        // saveData();
                        updateEntertainmentBudget();
                        // entertainmentList.add(
                        //   BudgetTracker(
                        //     amount: entertainmentBudgetCtr.text,
                        //     commit: entertainmentCommit.text,
                        //     data: DateFormat('dd.MM.yyyy').format(
                        //       DateTime.now(),
                        //     ),
                        //   ),
                        // );
                        entertainmentBudgetCtr.clear();
                        entertainmentCommit.clear();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Budget',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (entertainmentList.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your entertainment expences',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 18),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: entertainmentList.length,
                              itemBuilder: (context, index) {
                                final entertainment = entertainmentList[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    // const Color(0xff02015D),
                                    border: Border.all(
                                        color: const Color(0xff0907C0),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          entertainment.commit,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(
                                          entertainment.amount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        )
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        entertainment.data,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )
                  ],
                ),
              )

            //! Accommodation
            else if (current == 4)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '18%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                '100%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.7, // 70% progresstest
                            backgroundColor: const Color(0xff010A6D),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff01AA76)),
                            minHeight: 5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Add your accommodation expence',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: accommodationBudgetCtr,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your accommodation expence',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Add your comment',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: accommodationCommit,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your comment',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                        // saveData();
                        updateAccommodationBudget();
                        // entertainmentList.add(
                        //   BudgetTracker(
                        //     amount: entertainmentBudgetCtr.text,
                        //     commit: entertainmentCommit.text,
                        //     data: DateFormat('dd.MM.yyyy').format(
                        //       DateTime.now(),
                        //     ),
                        //   ),
                        // );
                        accommodationBudgetCtr.clear();
                        accommodationCommit.clear();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Budget',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (accommodationList.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your accommodation expences',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 18),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: accommodationList.length,
                              itemBuilder: (context, index) {
                                final accommodation = accommodationList[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    // const Color(0xff02015D),
                                    border: Border.all(
                                        color: const Color(0xff0907C0),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          accommodation.commit,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(
                                          accommodation.amount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        )
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        accommodation.data,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )
                  ],
                ),
              )

            //! Miscellaneous
            else if (current == 5)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '18%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                '100%',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          LinearProgressIndicator(
                            value: 0.7, // 70% progresstest
                            backgroundColor: const Color(0xff010A6D),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xff01AA76)),
                            minHeight: 5,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Add your miscellaneous expence',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: miscellaneousBudgetCtr,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your miscellaneous expence',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('Add your comment',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 7),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        controller: miscellaneousCommit,
                        cursorColor: Colors.white,
                        style: Theme.of(context).textTheme.titleLarge,
                        decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Add your comment',
                          hintStyle: Theme.of(context).textTheme.displaySmall,
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff2D72F8), width: 2),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() {});
                        // saveData();
                        updateMiscellaneousBudget();
                        // entertainmentList.add(
                        //   BudgetTracker(
                        //     amount: entertainmentBudgetCtr.text,
                        //     commit: entertainmentCommit.text,
                        //     data: DateFormat('dd.MM.yyyy').format(
                        //       DateTime.now(),
                        //     ),
                        //   ),
                        // );
                        miscellaneousBudgetCtr.clear();
                        miscellaneousCommit.clear();
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1ec932),
                              Color(0xff0db3e3),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Budget',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (miscellaneousList.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your miscellaneous expences',
                              style: Theme.of(context).textTheme.labelMedium),
                          const SizedBox(height: 18),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: miscellaneousList.length,
                              itemBuilder: (context, index) {
                                final miscellaneous = miscellaneousList[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  width: double.infinity,
                                  // height: 100,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    // const Color(0xff02015D),
                                    border: Border.all(
                                        color: const Color(0xff0907C0),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          miscellaneous.commit,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Text(
                                          miscellaneous.amount.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        )
                                      ],
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        miscellaneous.data,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget rowTrackerMethod(String text, String money, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ContainerCircleWidget(color: color),
          const SizedBox(width: 5.5),
          Text(text, style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(),
          Text(
            money,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}

class ContainerCircleWidget extends StatelessWidget {
  const ContainerCircleWidget({
    super.key,
    required this.color,
  });

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class BudgetTracker {
  BudgetTracker({
    required this.amount,
    required this.commit,
    required this.data,
  });

  final String amount;
  final String commit;
  final String data;

  factory BudgetTracker.fromJson(Map<String, dynamic> json) {
    return BudgetTracker(
      amount: json['amount'],
      commit: json['commit'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'commit': commit,
      'data': data,
    };
  }
}

//? camblingList
List<BudgetTracker> camblingList = [];

//? Dining
List<BudgetTracker> diningList = [];

//? Endertainment

List<BudgetTracker> entertainmentList = [];

List<BudgetTracker> accommodationList = [];

List<BudgetTracker> miscellaneousList = [];

// import 'package:flutter/material.dart';

class TrackerModel {
  TrackerModel({
    required this.title,
    required this.subTitle,
    required this.amount,
    required this.colors,
  });

  final String title;
  final String subTitle;
  final int amount;
  final List<Color> colors;
}

List<TrackerModel> trackerList = [
  TrackerModel(
    title: 'Total',
    subTitle: 'Total amount of money you plan to spend on a casino visit',
    amount: 0,
    colors: [
      const Color(0xffD00400),
      const Color(0xffBB5700),
    ],
  ),
  TrackerModel(
    title: 'Gambling',
    subTitle:
        'The portion of the total budget allocated specifically for gambling',
    amount: 0,
    colors: [
      const Color(0xff9646FF),
      const Color(0xff610FE7),
    ],
  ),
  TrackerModel(
    title: 'Dining',
    subTitle:
        'The portion of the total budget allocated specifically for gambling',
    amount: 0,
    colors: [
      const Color(0xff01CA66),
      const Color(0xff01AA76),
    ],
  ),
  TrackerModel(
    title: 'Entertainment',
    subTitle: 'Funds set aside for shows and other entertainment expenses',
    amount: 0,
    colors: [
      const Color(0xffF0AD13),
      const Color(0xffFD9650),
    ],
  ),
  TrackerModel(
    title: 'Accommodation',
    subTitle: 'Budget for hotel or other lodging expenses if applicable',
    amount: 0,
    colors: [
      const Color(0xffC930EF),
      const Color(0xffFD50AD),
    ],
  ),
  TrackerModel(
    title: 'Miscellaneous',
    subTitle: 'Allocated funds for other miscellaneous expenses',
    amount: 0,
    colors: [
      const Color(0xff30B6EF),
      const Color(0xff3A65FD),
    ],
  ),
];
