class CriteriaModel {
  String index;
  String criteriaName;
  String criteriaOption;

  CriteriaModel({
    this.index = '',
    required this.criteriaName,
    required this.criteriaOption,
  });
}

class NewCriteriaModel {
  String criteriaName;
  String criteriaOption;

  NewCriteriaModel({
    required this.criteriaName,
    required this.criteriaOption,
  });
}
