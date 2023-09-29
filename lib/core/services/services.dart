library core.services;

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/auth.dart';
import '../../features/rick&morty/rickandmorty.dart';
import '../core.dart';

export 'storage/key_value_storage_service_impl.dart';
export 'storage/key_value_storage_service.dart';

part 'dio.dart';
part 'global_datasource.dart';
part 'injections.dart';
