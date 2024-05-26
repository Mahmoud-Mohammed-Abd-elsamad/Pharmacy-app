import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';

import '../../data/models/category_model.dart';
import '../../data/models/item_model.dart';
import '../../data/models/medicine_body.dart';

abstract class MedicineDomainRepo {
  Future<Either<FailureError, List<SelectedCategoryItemModel>>>
      getMedicinesByCategoryId(String id);

  Future<Either<FailureError, Map<String, dynamic>>>
      createMedicineInSpecificCategory({required MedicineBody medicineBody});

  Future<Either<FailureError, Map<String, dynamic>>>
      updateMedicineInSpecificCategory({required MedicineBody medicineBody});

  Future<Either<FailureError, Map<String, dynamic>>>
      deleteMedicineInSpecificCategory({required String medicineId});
}
