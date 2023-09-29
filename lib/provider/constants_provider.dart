
import 'package:flutter/material.dart';


import '../data/repository/constants_repo.dart';

class ConstantsProvider with ChangeNotifier {
  final ConstantsRepo constantsRepo;

  ConstantsProvider({this.constantsRepo});

  int index = 2;
  int indexTrainer = 2;
  int indexMarketer = 2;

}
