import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:fvm/utils/config_utils.dart';

final _configUtils = ConfigUtils();

/// Flutter Repo Address
const kFlutterRepo = 'https://github.com/flutter/flutter.git';

/// Directory that the script is running
final kFvmDirectory = Platform.script.toString();

/// Working Directory for FVM
final kWorkingDirectory = Directory.current;

/// Local Project Flutter Link
final kLocalFlutterLink = Link(path.join(kWorkingDirectory.path, 'fvm'));

/// FVM Home directory
String get fvmHome {
  var home = '';
  final envVars = Platform.environment;
  if (Platform.isMacOS) {
    home = envVars['HOME'];
  } else if (Platform.isLinux) {
    home = envVars['HOME'];
  } else if (Platform.isWindows) {
    home = envVars['UserProfile'];
  }

  return path.join(home, 'fvm');
}

/// Config file of fvm's config.
File get kConfigFile => File(path.join(fvmHome, '.fvm_config'));

/// Where Flutter SDK Versions are stored
Directory get kVersionsDir {
  final flutterPath = _configUtils.getStoredPath();
  if (flutterPath != null) {
    return Directory(flutterPath);
  }
  return Directory(path.join(fvmHome, 'versions'));
}

/// Flutter Channels
final kFlutterChannels = ['master', 'stable', 'dev', 'beta'];

/// Flutter stored path of config.
const kConfigFlutterStoredKey = 'cache_path';
