import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatchGameScreen extends StatefulWidget {
  const MatchGameScreen({super.key});

  @override
  State<MatchGameScreen> createState() => _MatchGameScreenState();
}

class GameModel {
  bool moThe;
  String value;

  GameModel(this.moThe, this.value);

  @override
  String toString() {
    return 'GameModel{moThe: $moThe, value: $value}';
  }
}

class _MatchGameScreenState extends State<MatchGameScreen> {
  late List<GameModel> gameModel = [];
  late List<GameModel> chonThe = [];
  int diem = 0;

  @override
  void initState() {
    super.initState();
    khoiTaoGame();
  }

  void khoiTaoGame() {
    gameModel = [
      GameModel(false, 'Dog'),
      GameModel(false, 'Cat'),
      GameModel(false, 'Chicken'),
      GameModel(false, 'Dog'),
      GameModel(false, 'Cat'),
      GameModel(false, 'Chicken'),
    ];
    chonThe.clear();
    diem = 0;
  }

  bool checkAllCardOpened() {
    return gameModel.every((element) => element.moThe);
  }

  @override
  void dispose() {
    gameModel.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Match Game',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Column(
        children: [
          Text('Điểm của bạn là: $diem'),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: true,
              padding: const EdgeInsets.all(40),
              itemCount: gameModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (context, index) {
                return gridViewItem(gameModel[index], (gameModel) {
                  _handleLogicItem(gameModel);
                });
              },
            ),
          ),
          if (checkAllCardOpened())
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    khoiTaoGame();
                  });
                },
                child: Text('Làm mới'))
        ],
      ),
    );
  }

  void _handleLogicItem(GameModel gameModel) {
    setState(() {
      gameModel.moThe = !gameModel.moThe;
      chonThe.add(gameModel);
      if (chonThe.length == 2) {
        if (chonThe[0].value == chonThe[1].value) {
          diem += 1;
          chonThe.clear();
        } else {
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              chonThe[0].moThe = false;
              chonThe[1].moThe = false;
              chonThe.clear();
            });
          });
        }
      }
    });
  }

  Widget gridViewItem(
    GameModel gameModel,
    void Function(GameModel gameModel) callBack,
  ) {
    return InkWell(
      onTap: () {
        callBack(gameModel);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.teal,
        ),
        height: 70,
        width: 70,
        child: Center(
          child: Text(gameModel.moThe ? gameModel.value : "?"),
        ),
      ),
    );
  }
}
