import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) {
    return BlocProvider.of(context);
  }

  int playerXscore = 0;
  int playerOscore = 0;
  int trials = 0;

  bool playerXturn = true;

  List<String> buttons = ['', '', '', '', '', '', '', '', ''];

  String stamper = 'X';

  void resetData() {
    for (int i = 0; i < buttons.length; i++) {
      buttons[i] = '';
    }
    stamper = 'X';
    playerXturn = true;
    trials = 0;
  }

  void changeButton(int ind) {
    int index = ind;
    //check for player
    if (playerXturn == false) {
      stamper = 'O';
    } else {
      stamper = 'X';
    }
    //check if trials reach 9

    //check if button != null
    if (buttons[index] == '') {
      buttons[index] = stamper;
      playerXturn = !playerXturn;
      trials++;

      if (buttons[0] == buttons[1] &&
              buttons[1] == buttons[2] &&
              buttons[0] != '' ||
          buttons[3] == buttons[4] &&
              buttons[4] == buttons[5] &&
              buttons[3] != '' ||
          buttons[6] == buttons[7] &&
              buttons[7] == buttons[8] &&
              buttons[6] != '' ||
          buttons[0] == buttons[3] &&
              buttons[3] == buttons[6] &&
              buttons[0] != '' ||
          buttons[1] == buttons[4] &&
              buttons[4] == buttons[7] &&
              buttons[1] != '' ||
          buttons[2] == buttons[5] &&
              buttons[5] == buttons[8] &&
              buttons[2] != '' ||
          buttons[0] == buttons[4] &&
              buttons[4] == buttons[8] &&
              buttons[0] != '' ||
          buttons[2] == buttons[4] &&
              buttons[4] == buttons[6] &&
              buttons[2] != '') {
        if (stamper == 'X') {
          playerXscore++;
          resetData();
        } else {
          playerOscore++;
          resetData();
        }
      }
    }
    //Check For Pattern

    if (trials == 9) {
      //restart to default values
      resetData();
    }
    print(buttons);
    print('PlayerXTurn: $playerXturn');
    print('Stamper: $stamper');
    print(trials);
    emit(AppChangeButtonState());
  }
}
