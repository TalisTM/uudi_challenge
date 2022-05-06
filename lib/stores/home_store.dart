import 'package:mobx/mobx.dart';
import 'package:uudi_challenge/entities/product_entity.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  
  @observable
  ObservableList<ProductEntity> products = ObservableList<ProductEntity>();

  @action
  void setProducts(List<ProductEntity> value) => products.addAll(value);
}