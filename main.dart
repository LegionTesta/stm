

import 'data.dart';
import 'stm.dart';

void main(){

  
  AdmissionProblem stm = AdmissionProblem(
    MockStableMarriageData.getData1(), 
    Q: 2
    );

  stm.makeStableMatch();

  StableMarriage stableMarriage = StableMarriage(
    MockStableMarriageData.getData(),
    MockStableMarriageData.getN()
  );

  stableMarriage.makeStableMatch();
}