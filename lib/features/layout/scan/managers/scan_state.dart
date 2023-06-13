part of 'scan_cubit.dart';

@immutable
abstract class ScanState {}

class ScanInitialState extends ScanState {}

class ScanLoadingState extends ScanState {}

class ScanSuccessState extends ScanState {}

class ScanErrorState extends ScanState {}

class San2SuccessState extends ScanState {}

class San2ErrorState extends ScanState {}

///
class PostJoinCompanyLoadingState extends ScanState {}

class PostJoinCompanySuccessState extends ScanState {}

class PostJoinCompanyErrorState extends ScanState {}
