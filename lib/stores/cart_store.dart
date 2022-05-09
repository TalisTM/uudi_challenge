import 'package:mobx/mobx.dart';
import 'package:uudi_challenge/entities/cart_item_entity.dart';
part 'cart_store.g.dart';

class CartStore = _CartStoreBase with _$CartStore;

abstract class _CartStoreBase with Store {

  @computed
  int get quantityItems => items.length;
  
  @observable
  ObservableList items = ObservableList();

  @action
  void addItem(CardItemEntity value) {
    items.add(value);
  }

  @action
  void removeItem(CardItemEntity value) {
    items.remove(value);
  }

  @action
  void addQuantity(String id) {
    for(CardItemEntity i in items){
      if(i.product.id == id){
        i.quantity++;
        break;
      }
    }
    items = items;
  }

  @action
  void removeQuantity(String id) {
    for(CardItemEntity i in items){
      if(i.product.id == id){
        i.quantity--;
        break;
      }
    }
    items = items;
  }

  @action
  void clear() {
    items.clear();
  }
}