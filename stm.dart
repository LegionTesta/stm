
import 'dart:io';


class AdmissionProblem{

  /*
  Índice dos homens: 0 a N-1
  Índice das mulheres: N a 2*N-1
  */
  final List<List<int>> preferenceMatrix;
  final int N;
  final int M;
  final int Q;

  AdmissionProblem({this.preferenceMatrix, this.N, this.M, this.Q});

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
    for(int x = 0; x < M; x++){

      List<int> hash = List(N);
      for(int y = 0; y < N; y++){
        hash[preferenceMatrix[x+N][y]] = y;
      }

      women.add(Woman(
        preferenceMatrix[x+M],
        Q,
        List(),
        List(),
        hash
      ));
    }

    Man man;
    Woman woman;

    int j = 0;

    while(j < 10){
      for(int x = 0; x < N; x++){
        man = men[x];
        if(man.currentPartner == -1){
          man.currentY++;
          women[man.preferenceList[man.currentY]-N].holdList.add(x);
        }
      }
      for(int x = 0; x < M; x++){
        woman = women[x];

        if(!(woman.holdList.isEmpty)){

          woman.holdList.addAll(woman.partners);
          woman.holdList.sort((a, b) => woman.hash[a].compareTo(woman.hash[b]));
          woman.partners = List();

          for(int y = 0; y < Q; y++){
            try{
              woman.partners.add(woman.holdList[y]);
              men[woman.holdList[y]].currentPartner = x;
            } catch(e){}
          }
          for(int y = Q; y < woman.holdList.length; y++){
            men[woman.holdList[y]].currentPartner = -1;
          }
          woman.holdList = List();
        }
      }
      j++;
    }
      print("\nProdutor\tTecnico");
      for(int x = 0; x < N; x++){
        stdout.write("\n$x\t\t");
        stdout.write("${men[x].currentPartner+N}\t");
      }
      print("");
  }
}

class Man extends X{

  Man(List<int> preferenceList, int currentY, int currentPartner) 
  : super(preferenceList, currentY, currentPartner);
}

class Woman extends Y{

  Woman(List<int> preferenceList, int Q, List<int> holdList, List<int> partners, List<int> hash) 
  : super(preferenceList, Q, holdList, partners, hash);
}

abstract class X{

  final List<int> preferenceList;
  int currentY;
  int currentPartner;

  X(this.preferenceList, this.currentY, this.currentPartner);
}

abstract class Y{

  final List<int> preferenceList;
  final List<int> hash;
  final int Q;
  List<int> holdList;
  List<int> partners;

  Y(this.preferenceList, this.Q, this.holdList, this.partners, this.hash);
}

//Implementação do StableMatching no cenário do StableMarriage
//https://www.geeksforgeeks.org/stable-marriage-problem/
class StableMarriage{

  /*
  Índice dos homens: 0 a N-1
  Índice das mulheres: N a 2*N-1
  */
  final List<List<int>> prefer;
  final int N;

  StableMarriage(this.prefer, this.N);

  void makeStableMatch(){
    
    /*
    Armazena o parceiro de cada mulher. O valor de wPartner[i] indica
    o parceiro da mulher N+i. O valor -1 indica que a mulher N+i está livre.
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
          if(wPrefersM1OverM(w, m, m1) == false){
            wPartner[w-N] = m;
            mFree[m] = false;
            mFree[m1] = true;
          }
        }
      }
    }

    print("Mulher\t\tHomem");
    for(int i = 0; i < N; i++)
      print("${i+N}\t\t${wPartner[i]}");
  }

  //woman, man
  bool wPrefersM1OverM(int w, int m, int m1){
    
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