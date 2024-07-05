import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'device_info_model.freezed.dart';
part 'device_info_model.g.dart';

// todo @Project Setup: Change the class according to your needs
@freezed
@Collection(ignore: {'copyWith'})
@Name('DeviceInformation')
class DeviceInfoModel with _$DeviceInfoModel {
  const factory DeviceInfoModel({
    @Default(null) String? fcmToken,
  }) = _DeviceInfoModel;

  const DeviceInfoModel._();

  Id get id => 0;
}
