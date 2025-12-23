import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';

import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';

import 'package:dartz/dartz.dart' show Either;

abstract class Chatrepoa {
  Future<Either<Serverfailuer, List<Conversion>>> featchconversion(Chattab tab);
  Future<Either<Serverfailuer, List<Conversion>>> searchconversion(convName);
}
