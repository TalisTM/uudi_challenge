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
  void addItem(CardItemEntity value) {
    itens.add(value);
  }

  @action
  void removeItem(CardItemEntity value) {
    itens.remove(value);
  }

  @action
  void addQuantity(String id) {
    for(CardItemEntity i in itens){
      if(i.product.id == id){
        i.quantity++;
        break;
      }
    }
    itens = itens;
  }

  @action
  void removeQuantity(String id) {
    for(CardItemEntity i in itens){
      if(i.product.id == id){
        i.quantity--;
        break;
      }
    }
    itens = itens;
  }

  @action
  void clear() {
    itens.clear();
  }
}