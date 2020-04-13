
class MockStableMarriageData{

  static List<List<int>> getData(){


    List<List<int>> data = List<List<int>>.filled(8, List<int>(), growable: false);
    data[0] = [7, 5, 6, 4];
    data[1] = [5, 4, 6, 7];
    data[2] = [4, 5, 6, 7];
    data[3] = [4, 5, 6, 7];
    data[4] = [0, 1, 2, 3];
    data[5] = [0, 1, 2, 3];
    data[6] = [0, 1, 2, 3];
    data[7] = [0, 1, 2, 3];
    return data;
  }

  static int getN(){
    return 4;
  }
}