part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final CubitStatus getProfileStatus;
  final ProfileModel? profileModel;
  final UserModel? userModel;
  final String errorMessage;

  const ProfileState({
    this.getProfileStatus = CubitStatus.initial,
    this.profileModel,
    this.userModel,
    this.errorMessage = '',
  });

  ProfileState copyWith({
    CubitStatus? getProfileStatus,
    ProfileModel? profileModel,
    UserModel? userModel,
    String? errorMessage,
  }) {
    return ProfileState(
      getProfileStatus: getProfileStatus ?? this.getProfileStatus,
      profileModel: profileModel ?? this.profileModel,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    getProfileStatus,
    profileModel,
    userModel,
    errorMessage,
  ];
}
