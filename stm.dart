

abstract class STM{

  //O construtor recebe a matriz de preferência
  STM(List<List<int>> prefer);  

  //Função para realizar o stable match
  void makeStableMatch(); 

}

class AdmissionProblem implements STM{

  /*
  Índice dos homens: 0 a N-1
  Índice das mulheres: N a 2*N-1
  */
  final List<List<int>> preferenceMatrix;
  final int N;
  final int Q;

  AdmissionProblem(this.preferenceMatrix, {this.N, this.Q});

  void makeStableMatch(){
    
    List<Man> men = List();
    for(int x = 0; x < N; x++){
      men.add(Man(
        preferenceMatrix[x],
        -1,
        -1
      ));
    }

    List<Woman> women = List();
    for(int x = 0; x < N; x++){
      women.add(Woman(
        preferenceMatrix[x+N],
        Q,
        List(),
        List(),
      ));
    }

    while(true){
      Man man;
      for(int x = 0; x < N; x++){
        man = men[x];
        man.currentY++;
        women[man.preferenceList[man.currentY]-N].holdList.add(x);
      }
      Woman woman;
      for(int x = 0; x < N; x++){
        woman = women[x];
        

      }
      break;
    }
  }
}

class Man extends X{

  Man(List<int> preferenceList, int currentY, int currentPartner) 
  : super(preferenceList, currentY, currentPartner);
}

class Woman extends Y{

  Woman(List<int> preferenceList, int Q, List<int> holdList, List<int> partners) 
  : super(preferenceList, Q, holdList, partners);
}

abstract class X{

  final List<int> preferenceList;
  int currentY;
  int currentPartner;

  X(this.preferenceList, this.currentY, this.currentPartner);
}

abstract class Y{

  final List<int> preferenceList;
  final int Q;
  List<int> holdList;
  List<int> partners;

  Y(this.preferenceList, this.Q, this.holdList, this.partners);
}

//Implementação do StableMatching no cenário do StableMarriage
//https://www.geeksforgeeks.org/stable-marriage-problem/
class StableMarriage implements STM{

  /*
  Índice dos homens: 0 a N-1
  Índice das mulheres: N a 2*N-1
  */
  final List<List<int>> prefer;
  final int N;

  StableMarriage(this.prefer, {this.N});

  void makeStableMatch(){
    
    /*
    Armazena o parceiro de cada mulher. O valor de wPartner[i] indica
    o parceiro da mulher N+i. O valor -1 indica que a mulher N+1 está livre.
    Lista de tamanho N, todos os campos inicializados com valor -1
    */
    List<int> wPartner = List.filled(N, -1, growable: false);

    /*
    Armazena a disponibilidade de cada homem. O valor de mFree[i] indica
    a disponibilidade do homem i, sendo true para livre (inverti em relação
    ao algorítmo do GeeksForGeeks, pois me fez mais sentido assim).
    List de tamanho N, todos os campos inicializados com true
    */
    List<bool> mFree = List.filled(N, true, growable: false);

    //Valor para armazenar quantos homens estão livres
    int freeCount = N;

    while(freeCount > 0){

      int m;
      //Seleciona o primeiro homem m livre
      for(m = 0; m < N; m++)
        if(mFree[m])
          break;
      
      //É checado cada mulher de acordo com a preferência do homem m
      for(int i = 0; i < N && mFree[m]; i++){

        //w é a primeira mulher na lista de preferência do homem m
        int w = prefer[m][i];

        //Se a mulher w está livre, ela e o homem m se tornam parceiros
        if(wPartner[w-N] == -1){
          wPartner[w-N] = m;
          mFree[m] = false;
          freeCount--;
        }
        //Se a mulher w não estiver livre
        else {

          //m1 recebe o atual par da mulher w
          int m1 = wPartner[w-N];

          /*
          Se a mulher w preferir o homem m sobre seu par atual m1, o casamento
          entre a mulher w e o homem m1 é quebrado, formando um par entre a 
          mulher w e o homem m
          */
          if(yPrefersX1OverX(w: w, m: m, m1: m1) == false){
            wPartner[w-N] = m;
            mFree[m] = false;
            mFree[m1] = true;
          }
        }
      }
    }

    print("Mulher\tHomem");
    for(int i = 0; i < N; i++)
      print("${i+N}\t\t${wPartner[i]}");
  }

  //woman, man
  bool yPrefersX1OverX({int w, int m, int m1}){
    
    //Itera a lista de preferência da mulher w para ver se m1 aparece antes de m
    for(int i = 0; i < N; i++){

      //Se m1 aparecer antes, w prefere m1 sobre m, portanto retorna true
      if(prefer[w][i] == m1)
        return true;

      //Se m aparecer antes, w prefere m sobre m1, portanto retorna false
      if(prefer[w][i] == m)
        return false;
    }

    //Retorno para supressao de erro, ignorar
    return true;
  }
}