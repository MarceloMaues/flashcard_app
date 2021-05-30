import 'package:flashcard_app/BackEnd/DataStructures/CardSideIndicator.dart';

const String separator = "=";

class FlashCard {
  String _frontSide, _backSide;
  CardSideIndicator _openSide;

  FlashCard(String back, String front) {
    this._frontSide = front;
    this._backSide = back;
    this._openSide = CardSideIndicator.FRONTSIDE;
  }

  void setFrontSide(String side) {
    this._frontSide = side;
  }

  String getFrontSide() {
    return this._frontSide;
  }

  void setBackSide(String side) {
    this._backSide = side;
  }

  String getBackSide() {
    return this._backSide;
  }

  void setOpenSide(CardSideIndicator side) {
    this._openSide = side;
  }

  CardSideIndicator getOpenSide() {
    return this._openSide;
  }

  void turnOpenSide() {
    if (this._openSide == CardSideIndicator.FRONTSIDE) {
      this._openSide = CardSideIndicator.BACKSIDE;
    } else {
      this._openSide = CardSideIndicator.FRONTSIDE;
    }
  }

  bool decreasingAlphabeticOrder(FlashCard card) {
    List<int> thisCardFrontSide = this._frontSide.toUpperCase().codeUnits;
    List<int> cardFrontSide = this._frontSide.toUpperCase().codeUnits;
    int maxSize, letterLocal = 0;
    bool status = true;
    if(thisCardFrontSide.length<cardFrontSide.length){
      maxSize=thisCardFrontSide.length;
    }else{
      maxSize=cardFrontSide.length;
    }
    while((thisCardFrontSide[letterLocal]==cardFrontSide[letterLocal])&&(letterLocal<maxSize)){
      letterLocal=letterLocal+1;
    }
    if (thisCardFrontSide[letterLocal]<cardFrontSide[letterLocal]) {
      status = false;
    }
    return status;
  }

  bool growingAlphabeticOrder(FlashCard card) {
    List<int> thisCardFrontSide = this._frontSide.toUpperCase().codeUnits;
    List<int> cardFrontSide = this._frontSide.toUpperCase().codeUnits;
    int maxSize, letterLocal = 0;
    bool status = true;
    if(thisCardFrontSide.length<cardFrontSide.length){
      maxSize=thisCardFrontSide.length;
    }else{
      maxSize=cardFrontSide.length;
    }
    while((thisCardFrontSide[letterLocal]==cardFrontSide[letterLocal])&&(letterLocal<maxSize)){
      letterLocal=letterLocal+1;
    }
    if (thisCardFrontSide[letterLocal]>cardFrontSide[letterLocal]) {
      status = false;
    }
    return status;
  }

  bool compareFlashCard(FlashCard card) {
    bool duplicated = false;
    if ((this._frontSide == card.getFrontSide()) ||
        (this._frontSide == card.getBackSide())) {
      if ((this._backSide == card.getFrontSide()) ||
          (this._backSide == card.getBackSide())) {
        duplicated = true;
      }
    }
    return duplicated;
  }

  String toString() {
    return this._frontSide + separator + this._backSide;
  }

  void stringToFlashCard(String card) {
    List<String> splitCard;
    splitCard = card.split(separator);
    if (splitCard.length == 2) {
      this._frontSide = splitCard[0];
      this._frontSide = splitCard[1];
    }
  }
}
