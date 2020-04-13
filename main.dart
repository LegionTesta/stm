

import 'data.dart';
import 'stm.dart';

void main(){

  StableMarriage stableMarriage = StableMarriage(MockStableMarriageData.getData(), N: MockStableMarriageData.getN());

  stableMarriage.makeStableMatch();
}