

import 'data.dart';
import 'stm.dart';

void main(){

  
  STM stm = AdmissionProblem(
    MockStableMarriageData.getData(), 
    N: MockStableMarriageData.getN(),
    Q: 2
    );

  stm.makeStableMatch();
}