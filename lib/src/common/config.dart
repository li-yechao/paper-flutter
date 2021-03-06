class Config {
  static String get graphqlUri {
    final uri = const String.fromEnvironment('GRAPHQL_URI');
    assert(uri.isNotEmpty, 'Required env GRAPHQL_URI is not present');
    return uri;
  }

  static String get githubClientId {
    final value = const String.fromEnvironment('GITHUB_CLIENT_ID');
    assert(value.isNotEmpty, 'Required env GITHUB_CLIENT_ID is not present');
    return value;
  }

  static Uri get githubRedirectUri {
    final value = const String.fromEnvironment('GITHUB_REDIRECT_URI');
    assert(value.isNotEmpty, 'Required env GITHUB_REDIRECT_URI is not present');
    return Uri.parse(value);
  }

  static String get editorUri {
    final uri = const String.fromEnvironment('EDITOR_URI');
    assert(uri.isNotEmpty, 'Required env EDITOR_URI is not present');
    return uri;
  }

  static String get editorSocketUri {
    final uri = const String.fromEnvironment('EDITOR_SOCKET_URI');
    assert(uri.isNotEmpty, 'Required env EDITOR_SOCKET_URI is not present');
    return uri;
  }
}
