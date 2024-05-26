import 'package:dartz/dartz.dart';
import 'package:farmacy_app/core/error/failures.dart';
import 'package:farmacy_app/features/home/data/models/category_model.dart';
import 'package:farmacy_app/features/home/domain/repositories/catetgories_domain_repo.dart';
import 'package:farmacy_app/features/home/domain/repositories/medicien_domain_repo.dart';

import '../../data/models/item_model.dart';
import '../../data/models/medicine_body.dart';

class MedicineUseCase{
  MedicineUseCase({required this.medicineDomainRepo});
 final MedicineDomainRepo medicineDomainRepo;

  Future<Either<FailureError, List<SelectedCategoryItemModel>>> getMedicinesByCategoryId(String id) {

   return medicineDomainRepo.getMedicinesByCategoryId(id);
 }

  Future<Either<FailureError, Map<String, dynamic>>>
  createMedicineInSpecificCategory({required MedicineBody medicineBody}){

    return medicineDomainRepo.createMedicineInSpecificCategory(medicineBody: medicineBody);
  }

  Future<Either<FailureError, Map<String, dynamic>>>
  updateMedicineInSpecificCategory({required MedicineBody medicineBody}){

    return medicineDomainRepo.updateMedicineInSpecificCategory(medicineBody: medicineBody);
  }

  Future<Either<FailureError, Map<String, dynamic>>> deleteMedicineInSpecificCategory({required String medicineId}){
   return medicineDomainRepo.deleteMedicineInSpecificCategory(medicineId: medicineId);
  }
}