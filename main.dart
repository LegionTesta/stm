

import 'data.dart';
import 'stm.dart';

void main(){

  cenario1();
}

void cenario1(){
  StableMarriage stmCenario1 = StableMarriage(
    MockStableMarriageData.getCenario1(),
    4
  );

  var stmi = DateTime.now();
  stmCenario1.makeStableMatch();
  var stmf = DateTime.now();

  print("stm: ${stmf.difference(stmi).inMilliseconds}");

  AdmissionProblem admCenario1 = AdmissionProblem(
    preferenceMatrix: MockStableMarriageData.getCenario1(), 
    Q: 1,
    N: 4,
    M: 4
    );

  var admi = DateTime.now();
  admCenario1.makeStableMatch();
  var admf = DateTime.now();

  print("adm: ${admf.difference(admi).inMilliseconds}");
}