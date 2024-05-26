import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/data_sources/categories_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/data/data_sources/medicien_data_source.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/data/models/item_model.dart';
import 'package:farmacy_app/features/home/data/models/medicine_body.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';

import '../../domain/repositories/medicien_domain_repo.dart';


class MedicineDataRepo extends MedicineDomainRepo{
  MedicineDataRepo(this.medicineDataSource);

MedicineDataSource medicineDataSource;
  @override
  Future<Either<FailureError, List<SelectedCategoryItemModel>>> getMedicinesByCategoryId(String id) {
    return medicineDataSource.getMedicinesByCategoryId(id: id);
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>> createMedicineInSpecificCategory({required MedicineBody medicineBody}) {
    return medicineDataSource.createMedicineInSpecificCategory(medicineBody: medicineBody);
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>> updateMedicineInSpecificCategory({required MedicineBody medicineBody}) {

    return medicineDataSource.updateMedicineInSpecificCategory(medicineBody: medicineBody);
  }

  @override
  Future<Either<FailureError, Map<String, dynamic>>> deleteMedicineInSpecificCategory({required String medicineId}) {
    return medicineDataSource.deleteMedicineInSpecificCategory(medicineId: medicineId);
  }

}