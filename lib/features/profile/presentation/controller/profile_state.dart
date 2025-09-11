part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final CubitStatus getProfileStatus;
  final ProfileModel? profileModel;
  final BusinessModel? selectedBusiness;
  final String errorMessage;

  const ProfileState({
    this.getProfileStatus = CubitStatus.initial,
    this.profileModel,
    this.selectedBusiness,
    this.errorMessage = '',
  });

  ProfileState copyWith({
    CubitStatus? getProfileStatus,
    ProfileModel? profileModel,
    BusinessModel? selectedBusiness,
    String? errorMessage,
  }) {
    return ProfileState(
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      profileModel: profileModel ?? this.profileModel,
      selectedBusiness: selectedBusiness ?? this.selectedBusiness,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    getProfileStatus,
    profileModel,
    selectedBusiness,
    errorMessage,
  ];
}
