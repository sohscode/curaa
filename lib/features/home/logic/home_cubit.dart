import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:curaa/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../data/model/pharmacy_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
 List <PharmacyModel> pharmacyList=[];
  emitPharmacyData()async{
    emit(PharmacyLoadingState());
    try {
      final response=await HomeRepo.getPharmacy( );
      log(response.toString());
      if(response.isNotEmpty){
        
        pharmacyList=response;
        emit(PharmacySuccessState());}
    }  catch (e) {
      emit(PharmacyErrorState(e.toString()));
    }
  }
}
