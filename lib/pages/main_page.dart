import 'package:flutter/material.dart';
import 'package:flutter_fight_club/pages/fight_page.dart';
import 'package:flutter_fight_club/pages/statistics_page.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/action_button.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fight_result.dart';
import '../resources/fight_club_images.dart';
import '../widgets/fight_result_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MainPageContent();
  }
}

class _MainPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const Center(
              child: Text(
                "The\nFight\nClub",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: FightClubColors.darkGreyText,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            FutureBuilder<String?>(
              future: SharedPreferences.getInstance().then(
                (sharedPreferences) =>
                    sharedPreferences.getString("last_fight_result"),
              ),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const SizedBox();
                }
                return FightResultWidget(
                  fightResult: _getFightResultText(snapshot.data),
                  // fightResult: Text(snapshot.data!),
                );
              },
            ),
            const Expanded(child: SizedBox()),
            SecondaryActionButton(
              text: "Statistics",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StatisticsPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),
            ActionButton(
              text: "Start",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FightPage(),
                  ),
                );
              },
              color: FightClubColors.blackButton,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  FightResult _getFightResultText(snapshotData) {
    if (snapshotData.toString().toLowerCase() == 'won') {
      return FightResult.won;
    } else if (snapshotData.toString().toLowerCase() == 'lost') {
      return FightResult.lost;
    } else if (snapshotData.toString().toLowerCase() == 'draw') {
      return FightResult.draw;
    }
    return snapshotData;
  }
}
