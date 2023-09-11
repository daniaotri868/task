import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import '../../../../token/auth_repo.dart';
import '../models/all_product.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  late final AuthRepo _authRepo;
  ProductCubit() : super(ProductInitial()) {
    _authRepo = AuthRepo();
  }
  late Database database;
  List<AllProduct> myCart=[];
  List<Map> listDataBase=[];


  void showAllProductDio() async {
    emit(AppLoadingGetProduct());
    Either<String, List<AllProduct>> result =
    await _authRepo.showProduct();
    result.fold((l) {
      emit(AppErrorGetProduct());
      print("Error$l");
    }, (r) {
      emit(AppSuccessfulGetProduct(r));
    });
  }





  Future<void> createDataBase() async {
    await openDatabase(
      'core.db',
      version: 2,
      onCreate: (database, version) async {
        await database.execute('CREATE TABLE note (id INTEGER PRIMARY KEY, idx INTEGER, count INTEGER, dt TEXT)').then((value) {
          print("Create Table Successful");
        }).catchError((error) {
          print("Error: Not Create Table");
        });
      },
      onOpen: (database) {
        getDataBase(database).then((value) {
          listDataBase=value;
          emit(AppGetDataBase(value));
        });
        print("-------------------------------------DataBase Successful----------------------------- ");
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBase());
    });
  }

  Future<List<Map<String, dynamic>>> getDataBase(Database database) async {
    emit(AppLoadingGetDataBase());
    print("In get Data");
    return await database.rawQuery('SELECT * FROM note');
  }
  Future insertDataBase({index,count,date})
  {
    print("in insert Data");
    return  database.transaction((txn)async {
      txn.rawInsert("INSERT INTO note (idx, count, dt) VALUES ('$index', '$count', '$date')")
          .then((value){
        emit(AppInsertDataBase());
        print("value =$value");
        // id=value;
        getDataBase(database).then((value) {
          listDataBase=value;
          print(listDataBase);
          emit(AppGetDataBase(listDataBase));
        });
      }
      ).catchError((error){print("error in insert");});
    }
    );
  }
  deleteDataBase({id})async
  {
    print("in delete");
    return await database.rawDelete('DELETE FROM note WHERE idx = $id').then((value) {
      emit(AppDeleteDataBase());
      print("delete successful");
      getDataBase(database).then((value) {
        listDataBase=value;
        print(listDataBase);
        emit(AppGetDataBase(value));
      });
    }).catchError((error){print("error in delete");});
  }
  deleteAll()async
  {
    print("in delete All ");
    return await database.rawDelete('DELETE FROM note ').then((value) {
      emit(AppDeleteDataBase());
      print("delete successful All ");
      getDataBase(database).then((value) {
        listDataBase=value;
        print(listDataBase);
        emit(AppGetDataBase(value));
      });
    }).catchError((error){print("error in delete All ");});

  }


}
