

import 'data.dart';
import 'stm.dart';

void main(){

  
  AdmissionProblem stm = AdmissionProblem(
    MockStableMarriageData.getData(), 
    N: MockStableMarriageData.getN(),
    Q: 2
    );

  stm.makeStableMatch();

  StableMarriage stableMarriage = StableMarriage(
    MockStableMarriageData.getData(),
    MockStableMarriageData.getN()
  );

  stableMarriage.makeStableMatch();
}