

import 'data.dart';
import 'stm.dart';

void main(){

  
  STM stm = AdmissionProblem(
    MockStableMarriageData.getData(), 
    N: MockStableMarriageData.getN()
    );

  stm.makeStableMatch();
}