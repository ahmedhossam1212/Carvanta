class AuthStates {}

class AuthInitState extends AuthStates {}

class GoogleInitLoginState extends AuthStates {}

class GoogleLoadingLoginState extends AuthStates {}

class GoogleSuccessLoginState extends AuthStates {}

class GoogleErrLoginState extends AuthStates {}

// login with email

class LoginInitState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrState extends AuthStates {}

// register with email

class RegisterInitState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {}

class RegisterErrState extends AuthStates {}
