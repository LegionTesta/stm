

import 'data.dart';
import 'stm.dart';

void main(){

  cenario3();
}

void cenario1(){
  StableMarriage stmCenario1 = StableMarriage(
    MockStableMarriageData.getCenario1(),
    4
  );

  var stmi = DateTime.now();
  stmCenario1.makeStableMatch();
  var stmf = DateTime.now();

  print("stm1: ${stmf.difference(stmi).inMilliseconds}");

  AdmissionProblem admCenario1 = AdmissionProblem(
    preferenceMatrix: MockStableMarriageData.getCenario1(), 
    Q: 1,
    N: 4,
    M: 4
    );

  var admi = DateTime.now();
  admCenario1.makeStableMatch();
  var admf = DateTime.now();

  print("adm1: ${admf.difference(admi).inMilliseconds}");
}

void cenario2(){
  StableMarriage stmCenario2 = StableMarriage(
    MockStableMarriageData.getCenario2(),
    4
  );

  var stmi = DateTime.now();
  stmCenario2.makeStableMatch();
  var stmf = DateTime.now();

  print("stm2: ${stmf.difference(stmi).inMilliseconds}");

  AdmissionProblem admCenario2 = AdmissionProblem(
    preferenceMatrix: MockStableMarriageData.getCenario2(), 
    Q: 1,
    N: 4,
    M: 4
    );

  var admi = DateTime.now();
  admCenario2.makeStableMatch();
  var admf = DateTime.now();

  print("adm2: ${admf.difference(admi).inMilliseconds}");
}

void cenario3(){
  try{
    StableMarriage stmCenario3 = StableMarriage(
      MockStableMarriageData.getCenario3(),
      6
    );

    var stmi = DateTime.now();
    stmCenario3.makeStableMatch();
    var stmf = DateTime.now();

    print("stm3: ${stmf.difference(stmi).inMilliseconds}");
  }catch(e, s){
    print("$e\n$s");
  }

  AdmissionProblem admCenario3 = AdmissionProblem(
    preferenceMatrix: MockStableMarriageData.getCenario3(), 
    Q: 1,
    N: 6,
    M: 3
    );

  var admi = DateTime.now();
  admCenario3.makeStableMatch();
  var admf = DateTime.now();

  print("adm3: ${admf.difference(admi).inMilliseconds}");
}