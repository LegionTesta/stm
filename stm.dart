

abstract class STM{

  //o construtor recebe a matriz de preferencia
  STM({List<List<int>> preferenceMatrix});  

  //funcao para realizar o stable match
  void makeStableMatch(); 

  //funcao para ver se o elemento y prefere o elemento x1 (seu par atual) sobre o elemento x
  bool yPrefersX1OverX();
}

class StableMarriage extends STM{

  final List<List<int>> preferenceMatrix;

  StableMarriage(this.preferenceMatrix);

  void makeStableMatch(){

  }

  bool yPrefersX1OverX(){
    return true;
  }
}