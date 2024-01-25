class EqualityUtil{
static  bool listEquality<T>(List<T>? list1, List<T>? list2) {
    if (identical(list1, list2)) return true;
    if (list1 == null && list2 == null) return true;
    if (list1 == null || list2 == null) return false;
    if (list1.length != list2.length) return false;
    return list2.every((e) => list1.contains(e) == true) == true;
  }

}