import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_page.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatisticsPageContent();
  }
}

class _StatisticsPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 24),
              height: 72,
              alignment: Alignment.center,
              child: const Text(
                "Statistics",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: FightClubColors.darkGreyText,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            FutureBuilder<Map<String, int>?>(
              future: SharedPreferences.getInstance().then(
                (sharedPreferences) => {
                  "statsWon": sharedPreferences.getInt("stats_won") ?? 0,
                  "statsDraw": sharedPreferences.getInt("stats_lost") ?? 0,
                  "statsLost": sharedPreferences.getInt("stats_draw") ?? 0
                },
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const SizedBox();
                }
                return StatisticsWidget(statisticsData: snapshot.data);
              },
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SecondaryActionButton(
                text: "Back",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
              ),
            ),
            // const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class StatisticsWidget extends StatelessWidget {
  final Map<String, int>? statisticsData;

  const StatisticsWidget({Key? key, required this.statisticsData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Text(
            'Won: ${statisticsData?["statsWon"]!.toString()}',
            style: const TextStyle(
              color: FightClubColors.darkGreyText,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 40,
          child: Text(
            'Draw: ${statisticsData?["statsDraw"]!.toString()}',
            style: const TextStyle(
              color: FightClubColors.darkGreyText,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 40,
          child: Text(
            'Lost: ${statisticsData?["statsLost"]!.toString()}',
            style: const TextStyle(
              color: FightClubColors.darkGreyText,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
