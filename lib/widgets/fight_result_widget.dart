import 'package:flutter/cupertino.dart';

import '../fight_result.dart';
import '../resources/fight_club_colors.dart';
import '../resources/fight_club_images.dart';

class FightResultWidget extends StatelessWidget {
  final FightResult fightResult;

  const FightResultWidget({Key? key, required this.fightResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(child: ColoredBox(color: FightClubColors.white)),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FightClubColors.white,
                        FightClubColors.darkPurple
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(child: ColoredBox(color: FightClubColors.darkPurple)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    "You",
                    style: TextStyle(color: FightClubColors.darkGreyText),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    FightClubImages.youAvatar,
                    width: 92,
                    height: 92,
                  ),
                ],
              ),
              Container(
                height: 44,
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(22.0),
                  color: _setFightResultColor(fightResult),
                ),
                alignment: Alignment.center,
                child: Text(
                  _setFightResultText(fightResult),
                  style: const TextStyle(
                    color: FightClubColors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    "Enemy",
                    style: TextStyle(
                      color: FightClubColors.darkGreyText,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    FightClubImages.enemyAvatar,
                    width: 92,
                    height: 92,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _setFightResultText(FightResult fightResult) {
    if (fightResult == FightResult.won) {
      return "won";
    } else if (fightResult == FightResult.lost) {
      return "lost";
    } else if (fightResult == FightResult.draw) {
      return "draw";
    }
    return "undefined";
  }

  Color _setFightResultColor(FightResult fightResult) {
    if (fightResult == FightResult.won) {
      return FightClubColors.greenFightResult;
    } else if (fightResult == FightResult.lost) {
      return FightClubColors.redFightResult;
    } else if (fightResult == FightResult.draw) {
      return FightClubColors.blueButton;
    }
    return FightClubColors.transparentFightResult;
  }
}
