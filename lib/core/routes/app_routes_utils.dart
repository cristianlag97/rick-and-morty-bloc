part of core.routes;

enum PAGES {
  login,
  home,
  splash,
  result,
  search,
  error,
}

extension AppPageExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/splash";
      case PAGES.login:
        return "/login";
      case PAGES.result:
        return "/result/:id/:provider";
      case PAGES.search:
        return "/search";
      case PAGES.error:
        return "/error";
      case PAGES.home:
      default:
        return "/home/:page";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return " SPLASH";
      case PAGES.login:
        return "LOGIN";
      case PAGES.result:
        return "RESULT";
      case PAGES.search:
        return "SEARCH";
      case PAGES.error:
        return "ERROR";
      case PAGES.home:
      default:
        return "HOME";
    }
  }
}
