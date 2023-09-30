class CollectionService {
  const CollectionService();

  bool isIdenticalLists(List list1, List list2) {
    final condition1 = list1.toSet().difference(list2.toSet()).isEmpty;
    final condition2 = list1.length == list2.length;
    final isEqual = condition1 && condition2;
    return isEqual;
  }
}
