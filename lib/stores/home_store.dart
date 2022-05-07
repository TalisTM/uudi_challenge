import 'package:mobx/mobx.dart';
import 'package:uudi_challenge/datasource/get_products.dart';
import 'package:uudi_challenge/entities/product_entity.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  
  @observable
  ObservableList<ProductEntity> products = ObservableList<ProductEntity>();

  Future<void> getProducts() async {
    List<ProductEntity> products = await GetProducts.get();
    setProduct(products);
  }

  @action
  void setProduct(List<ProductEntity> value) => products = ObservableList.of(value);

}