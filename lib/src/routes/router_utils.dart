enum AppPage {
  login,
  home,
  buyCrypto,
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
      default:
        return "home";
    }
  }
}
