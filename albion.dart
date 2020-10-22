

void main(){
  double npcReturn = 0.28;
  double npcExtraReturn = 0.36;
  double bonus = 28;
  double extraBonus = 36;
  double totalBonus = 0;
  double totalExtraBonus = 0;

  for(int x = 0; x < 10; x++){

    totalBonus += bonus;
    totalExtraBonus += extraBonus;

    bonus *= npcReturn;
    extraBonus *= npcExtraReturn;

    print("$totalBonus\t$totalExtraBonus");
  }
}