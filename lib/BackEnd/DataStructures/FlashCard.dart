import 'package:flashcard_app/BackEnd/DataStructures/CardSideIndicator.dart';

const String separator = "=";

///Classe que define um FlashCard
class FlashCard {
  ///Atributos
  String _frontSide = '', _backSide = '';
  CardSideIndicator _openSide = CardSideIndicator.FRONTSIDE;

  ///Construtor
  FlashCard(String back, String front) {
    this._frontSide = front;
    this._backSide = back;
  }

  ///Define o texto da face frontal do card
  void setFrontSide(String side) {
    this._frontSide = side;
  }

  ///Pega o texto da face frontal do card
  String getFrontSide() {
    return this._frontSide;
  }

  ///Define o texto da face traseira do card
  void setBackSide(String side) {
    this._backSide = side;
  }

  ///Pega o texto da face frontal do card
  String getBackSide() {
    return this._backSide;
  }

  ///Define o lado que está virado do card
  void setOpenSide(CardSideIndicator side) {
    this._openSide = side;
  }

  ///Pega o lado que está virado do card
  CardSideIndicator getOpenSide() {
    return this._openSide;
  }

  ///Vira o lado da carta
  void turnOpenSide() {
    if (this._openSide == CardSideIndicator.FRONTSIDE) {
      this._openSide = CardSideIndicator.BACKSIDE;
    } else {
      this._openSide = CardSideIndicator.FRONTSIDE;
    }
  }

  ///Compara o flashcard para o frontside e igual ao backside
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

  ///Transforma um card em string
  String toString() {
    return this._frontSide + separator + this._backSide;
  }

  ///Transforma uma string em um card
  void stringToFlashCard(String card) {
    List<String> splitCard;
    splitCard = card.split(separator);
    if (splitCard.length == 2) {
      this._frontSide = splitCard[0];
      this._frontSide = splitCard[1];
    }
  }
}
