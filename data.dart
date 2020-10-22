
class MockStableMarriageData{


  static List<List<int>> getCenario1(){
    //N = 4
    List<List<int>> data = List<List<int>>.filled(8, List<int>(), growable: false);
    data[0] = [5, 4, 6, 7];
    data[1] = [7, 4, 5, 6];
    data[2] = [4, 5, 6, 7];
    data[3] = [6, 4, 5, 7];
    data[4] = [2, 0, 3, 1]; //0
    data[5] = [0, 2, 3, 1]; //1
    data[6] = [3, 2, 0, 1]; //2
    data[7] = [1, 2, 0, 3]; //3
    return data;
  }

    static List<List<int>> getCenario2(){
    //N = 4
    List<List<int>> data = List<List<int>>.filled(8, List<int>(), growable: false);
    data[0] = [4, 5, 6, 7];
    data[1] = [5, 6, 4, 7];
    data[2] = [6, 4, 5, 7];
    data[3] = [4, 5, 6, 7];
    data[4] = [1, 2, 3, 0]; //0
    data[5] = [2, 3, 0, 1]; //1
    data[6] = [3, 0, 1, 2]; //2
    data[7] = [1, 2, 3, 0]; //3
    return data;
  }

    static List<List<int>> getCenario3(){
    //N = 6
    //M = 3
    List<List<int>> data = List<List<int>>.filled(9, List<int>(), growable: false);
    data[0] = [7, 6, 8];
    data[1] = [6, 7, 8];
    data[2] = [8, 7, 6];
    data[3] = [8, 6, 7]; 
    data[4] = [7, 8, 6]; 
    data[5] = [6, 7, 8]; 
    data[6] = [5, 1, 3, 2, 0, 4]; //0
    data[7] = [4, 1, 2, 3, 0, 5]; //1
    data[8] = [3, 2, 5, 0, 4, 1]; //2
    return data;
  }
}