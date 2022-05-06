import 'package:mobx/mobx.dart';
import 'package:uudi_challenge/entities/cart_item_entity.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {

  @computed
  int get quantityItens => itens.length;
  
  @observable
  ObservableList itens = ObservableList();

  @action
  void addProduct(CardItemEntity value) {
    itens.add(value);
  }

  @action
  void removeProduct(CardItemEntity value) {
    itens.remove(value);
  }
}