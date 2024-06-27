import 'dart:io';

class FlutterAppGenerator {
  static Future<void> generate(String projectName, List<String> features) async {
    if (!await _createFlutterProject(projectName)) {
      return;
    }

    print('Flutter project created successfully.');

    var projectDir = Directory(projectName);
    var libDir = Directory('${projectDir.path}/lib');
    var featuresDir = Directory('${libDir.path}/features');
    featuresDir.createSync(recursive: true); // Ensure features directory exists

    for (var feature in features) {
      _createFeatureDirectories(featuresDir, feature);
      _createFeatureFiles(feature, featuresDir);
    }

    print('Added custom features to Flutter project.');
  }

  static Future<bool> _createFlutterProject(String projectName) async {
    var result = await Process.run('flutter', ['create', projectName]);
    if (result.exitCode != 0) {
      print('Failed to create Flutter project: ${result.stderr}');
      return false;
    }
    return true;
  }

  static void _createFeatureDirectories(Directory featuresDir, String feature) {
    var featureDir = Directory('${featuresDir.path}/$feature');
    var dataDir = Directory('${featureDir.path}/data');
    var presentationDir = Directory('${featureDir.path}/presentation');
    var repoDir = Directory('${dataDir.path}/repository');
    var servicesDir = Directory('${dataDir.path}/services');
    var modelDir = Directory('${dataDir.path}/models');
    var dtoDir = Directory('${dataDir.path}/dto');
    var routesDir = Directory('${presentationDir.path}/routes');
    var stringsDir = Directory('${presentationDir.path}/strings');
    var viewsDir = Directory('${presentationDir.path}/views');
    var widgetsDir = Directory('${presentationDir.path}/widgets');

    for (var dir in [
      featureDir,
      dataDir,
      presentationDir,
      repoDir,
      servicesDir,
      modelDir,
      dtoDir,
      routesDir,
      stringsDir,
      viewsDir,
      widgetsDir
    ]) {
      dir.createSync(recursive: true);
    }
  }

  static void _createFeatureFiles(String feature, Directory featuresDir) {
    _createFile(
        '${featuresDir.path}/$feature/data/repository/${feature}_repository.dart', '// Repository for $feature');
    _createFile('${featuresDir.path}/$feature/data/services/${feature}_service.dart', '// Services for $feature');
    _createFile('${featuresDir.path}/$feature/data/models/${feature}_model.dart', '// Model for $feature');
    _createFile('${featuresDir.path}/$feature/data/dto/${feature}_dto.dart', '// DTO for $feature');
    _createFile('${featuresDir.path}/$feature/presentation/routes/${feature}_routes.dart', '// Routes for $feature');
    _createFile('${featuresDir.path}/$feature/presentation/strings/${feature}_strings.dart', '// Strings for $feature');
    _createFile('${featuresDir.path}/$feature/presentation/views/${feature}_views.dart', '// Views for $feature');
    _createFile('${featuresDir.path}/$feature/presentation/widgets/${feature}_widgets.dart', '// Widgets for $feature');
  }

  static void _createFile(String path, String contents) {
    var file = File(path);
    file.createSync();
    file.writeAsStringSync(contents);
  }
}
