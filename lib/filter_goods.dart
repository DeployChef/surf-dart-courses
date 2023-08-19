void main() {
  final itemsStr = articles.split('\n').where((element) => element.isNotEmpty);
  final items = itemsStr.map((e) {
    var data = e.split(",");
    return Item(id: int.parse(data[0]), categoryName: data[1], name: data[2], price: int.parse(data[3]), qty: int.parse(data[4]));
  });

  printItems(items);

  print("Фильтр категории");
  var categoryFilterResult = applyFilter(items, CategoryFilter(findCategories: ["хлеб"]));
  printItems(categoryFilterResult);

  print("Фильтр цены");
  var priceFilterResult = applyFilter(items, PriceFilter(maxPrice: 400));
  printItems(priceFilterResult);

  print("Фильтр количества");
  var qtyFilterResult = applyFilter(items, QtyFilter(minQty: 7));
  printItems(qtyFilterResult);
}

void printItems(Iterable<Item> itemsToPrint) {
  itemsToPrint.forEach(
    (element) => print("${element.id}\t${element.categoryName}\t${element.name}\t${element.price} рублей\t${element.qty} шт\t"),
  );
}

Iterable<T> applyFilter<T>(Iterable<T> arr, IFilter<T> filter) {
  return arr.where((element) => filter.apply(element));
}

abstract class IFilter<T> {
  bool apply(T item);
}

class CategoryFilter implements IFilter<Item> {
  List<String> findCategories;

  CategoryFilter({required this.findCategories});

  @override
  bool apply(Item item) {
    return findCategories.contains(item.categoryName);
  }
}

class PriceFilter implements IFilter<Item> {
  int maxPrice;

  PriceFilter({required this.maxPrice});

  @override
  bool apply(Item item) {
    return item.price < maxPrice;
  }
}

class QtyFilter implements IFilter<Item> {
  int minQty;

  QtyFilter({required this.minQty});

  @override
  bool apply(Item item) {
    return item.qty > minQty;
  }
}

class Item {
  int id;
  String categoryName;
  String name;
  int price;
  int qty;

  Item({
    required this.id,
    required this.name,
    required this.categoryName,
    required this.price,
    required this.qty,
  });
}

final articles = '''
1,хлеб,Бородинский,500,5
2,хлеб,Белый,200,15
3,молоко,Полосатый кот,50,53
4,молоко,Коровка,50,53
5,вода,Апельсин,25,100
6,вода,Бородинский,500,5
''';
