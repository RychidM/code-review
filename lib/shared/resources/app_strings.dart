import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
/* ------------ Auth ------------ */
  static const String sSignInTitleText = 'Manage all your\nstock in one place';
  static const String sSignUpTitleText = 'Sign Up to\nManage Your Stock';
  static const String sRegisterHereText = 'Register here!';
  static const String sLoginHereText = 'Log in here!';
  static const String sSignInSubTitleText =
      'You can register a new user with limited privileges\n';
  static const String saSignUpSubTitleText =
      'Already a registered user of this app?\n';
  static const String sPasswordText = 'Password';
  static const String sConfirmPasswordText = 'Confirm Password';
  static const String sRecoverPasswordText = 'Recover password';
  static const String sPhoneNumber = 'Phone Number';
  static const String sSignInText = 'Sign In';
  static const String sSignUpText = 'Sign Up';
  static const String sEmailOrPasswordText = 'Email or username';
  static const String sLastName = 'Last Name';
  static const String sFullNameTxt = 'Full name';
  static const String sInvalidCredentialsTxt = 'Invalid Credentials';
  static const String sPhoneNumberTakenTxt = 'Phone number is taken';
  static const String sEmailTakenTxt = 'Email is taken';
  static const String sInvalidEmailPasswordTxt = 'Invalid email or password';

//  RegEx Patterns
  static const String sPasswordRegEx =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$";
  static const String sIdReplaceRegEx = r"(\[+)|(\]+)|(\#+)";

  // Db
  // static String sDbName = dotenv.get('APP_DB_NAME');
  // static String sUserTableName = dotenv.get('APP_USER_TABLE_NAME');
  static String sAdmin = 'Admin';
  static String sUser = 'User';

  // User table Columns
  static const String sUserId = 'user_id';
  static const String sDbFirstName = 'first_name';
  static const String sDbLastName = 'last_name';
  static const String sPassword = 'password';
  static const String sRole = 'role';
  static const String sDbEmail = 'email';
  static const String sDbNumber = 'phone_number';
  static const String sProfileImage = 'profile_img';

  /*--------- Home Screen Strings --------*/
  static const String sDashboard = 'Dashboard';
  static const String sProfile = 'Profile';
  static const String sInventory = 'Inventory';
  static const String sReport = 'Report';

  /*------- Dashboard Screen Strings --------*/
  static const String sOverview = 'Overview';
  static const String sManagerDetails = 'Manager Details';
  static const String sActivities = 'Activities';
  static const String sNewManager = 'New Manager';
  static const String sNewItem = 'New Item';
  static const String sNewWH = 'New WH';

  /*--------- General Strings ---------*/
  static const String sStock = 'Stock';
  static const String sAvailableItems = 'Available Items';
  static const String sCategory = 'Category';
  static const String sPrice = 'Price';
  static const String sQuantity = 'Quantity';
  static const String sAction = 'Action';
  static const String sGhCediSymbol = '₵';
  static const String sUserCreated = 'User Created';
  static const String sAppName = 'Stock Savvy';
  static const String sGoodMorning = 'Good Morning';
  static const String sGoodAfternoon = 'Good Afternoon';
  static const String sGoodEvening = 'Good Evening';

  /*---------- Notification Strings -----------*/
  static const String sErrProcessingReqTitle = 'Error processing request';
  static const String sErrProcessingReqMsg =
      'Unable to process process your request at this time, please try again later.';
  static const String sProdAddedTitle = 'Product successfully added';
  static const String sProdAddedMsg = 'Product name with quantity was successfully added to warehouse 2.';

  /*------------ General Error Messages -----------*/
  static const String sWarehouseCreationErr = 'Error creating warehouse, please try again';

}