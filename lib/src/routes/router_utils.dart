enum AppPage {
  login,
  home,
  buyCrypto,
  sellCrypto,
  editUser,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.home:
        return "/";
      case AppPage.login:
        return "/login";
      case AppPage.buyCrypto:
        return "/buyCrypto";
      case AppPage.sellCrypto:
        return "/sellCrypto";
      case AppPage.editUser:
        return "/editUser";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.home:
        return "home";
      case AppPage.login:
        return "login";
      case AppPage.buyCrypto:
        return "buyCrypto";
      case AppPage.sellCrypto:
        return "sellCrypto";
      case AppPage.editUser:
        return "editUser";
      default:
        return "home";
    }
  }
}
