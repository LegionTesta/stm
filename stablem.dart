class StableMarriage{
  final List<List<int>> prefer;
  final int N;
  StableMarriage(this.prefer, this.N);
  void makeStableMatch(){
    List<int> wPartner = List.filled(N, -1, growable: false);
    List<bool> mFree = List.filled(N, true, growable: false);
    int freeCount = N;
    while(freeCount > 0){
      int m;
      for(m = 0; m < N; m++)
        if(mFree[m])
          break;
      for(int i = 0; i < N && mFree[m]; i++){
        int w = prefer[m][i];
        if(wPartner[w-N] == -1){
          wPartner[w-N] = m;
          mFree[m] = false;
          freeCount--;
        } else {
          int m1 = wPartner[w-N];
          if(wPrefersM1OverM(w, m, m1) == false){
            wPartner[w-N] = m;
            mFree[m] = false;
            mFree[m1] = true;
          }
        }
      }
    }
    print("Mulher\tHomem");
    for(int i = 0; i < N; i++)
      print("${i+N}\t${wPartner[i]}");
  }
  bool wPrefersM1OverM(int w, int m, int m1){
    for(int i = 0; i < N; i++){
      if(prefer[w][i] == m1)
        return true;
      if(prefer[w][i] == m)
        return false;
    }
    return true;
  }
}