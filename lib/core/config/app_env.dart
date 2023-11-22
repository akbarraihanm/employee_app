enum Environment {
  dev, prod
}

abstract class EnvVar {
  bool get isDev;
}

class AppEnv {
  final Environment env;

  static bool isDev = false;

  AppEnv(this.env) {
    if (env == Environment.dev) {
      isDev = true;
    } else {
      isDev = false;
    }
  }
}