void main() {
  var filteredData = stockData.where((element) => element.qty != 0 && element.expirationDate.isAfter(DateTime.now()));

  var categoryMap = groupBy<RawProductItem, String>(filteredData, (c) => c.categoryName);

  Map<String, Map<String, List<String>>> resultMap = {};
  for (var element in categoryMap.entries) {
    var subCategoryMapRaw = groupBy<RawProductItem, String>(element.value, (c) => c.subcategoryName);
    Map<String, List<String>> subCategoryMap = {};
    for (var subElement in subCategoryMapRaw.entries) {
      subCategoryMap[subElement.key] = subElement.value.map((e) => e.name).toSet().toList();
    }
    resultMap[element.key] = subCategoryMap;
  }

  print(resultMap);
}

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}

List<RawProductItem> stockData = [
  RawProductItem(
    name: 'Персик',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2023, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Молоко',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Кефир',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 5,
  ),
  RawProductItem(
    name: 'Творог',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Творожок',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Творог',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Не напитки',
    expirationDate: DateTime(2023, 12, 22),
    qty: 0,
  ),
  RawProductItem(
    name: 'Гауда',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Сыры',
    expirationDate: DateTime(2023, 12, 22),
    qty: 3,
  ),
  RawProductItem(
    name: 'Маасдам',
    categoryName: 'Молочные продукты',
    subcategoryName: 'Сыры',
    expirationDate: DateTime(2023, 12, 22),
    qty: 2,
  ),
  RawProductItem(
    name: 'Яблоко',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2023, 12, 4),
    qty: 4,
  ),
  RawProductItem(
    name: 'Морковь',
    categoryName: 'Растительная пища',
    subcategoryName: 'Овощи',
    expirationDate: DateTime(2023, 12, 23),
    qty: 51,
  ),
  RawProductItem(
    name: 'Черника',
    categoryName: 'Растительная пища',
    subcategoryName: 'Ягоды',
    expirationDate: DateTime(2023, 12, 25),
    qty: 0,
  ),
  RawProductItem(
    name: 'Курица',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2023, 12, 18),
    qty: 2,
  ),
  RawProductItem(
    name: 'Говядина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2023, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Телятина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2022, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Индюшатина',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2023, 12, 17),
    qty: 0,
  ),
  RawProductItem(
    name: 'Утка',
    categoryName: 'Мясо',
    subcategoryName: 'Птица',
    expirationDate: DateTime(2023, 12, 18),
    qty: 0,
  ),
  RawProductItem(
    name: 'Гречка',
    categoryName: 'Растительная пища',
    subcategoryName: 'Крупы',
    expirationDate: DateTime(2023, 12, 22),
    qty: 8,
  ),
  RawProductItem(
    name: 'Свинина',
    categoryName: 'Мясо',
    subcategoryName: 'Не птица',
    expirationDate: DateTime(2023, 12, 23),
    qty: 5,
  ),
  RawProductItem(
    name: 'Груша',
    categoryName: 'Растительная пища',
    subcategoryName: 'Фрукты',
    expirationDate: DateTime(2023, 12, 25),
    qty: 5,
  ),
];

class RawProductItem {
  String name;
  String categoryName;
  String subcategoryName;
  DateTime expirationDate;
  int qty;

  RawProductItem({
    required this.name,
    required this.categoryName,
    required this.subcategoryName,
    required this.expirationDate,
    required this.qty,
  });
}
