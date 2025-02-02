import 'package:bloc/bloc.dart';

/// Cubit for the exception message value
class ExceptionCubit extends Cubit<String> {
  final String exceptionMsg;
  ExceptionCubit({required this.exceptionMsg}) : super("");
}
