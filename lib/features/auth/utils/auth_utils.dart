import '../../../network/api_constants.dart';

enum RespCodes { success, invalidCredentials, alreadyExists }

enum Identifier { admin, user }

class AuthUtils {
  static Map<RespCodes, String> respCodes = {
    RespCodes.success: "000",
    RespCodes.alreadyExists: "045",
    RespCodes.invalidCredentials: "049",
  };

  static Map<Identifier, String> identifierStrings = {
    Identifier.admin: "admin",
    Identifier.user: "user",
  };

  static Map<String, Identifier> reverseIdentifiers() {
    return identifierStrings.map((key, value) => MapEntry(value, key));
  }

  static getEndpoint(Identifier identifier) {
    switch (identifier) {
      case Identifier.admin:
        return SApiConstants.sAdminSignIn;
      case Identifier.user:
        return SApiConstants.sUserSignIn;
      default:
        return '';
    }
  }
}
