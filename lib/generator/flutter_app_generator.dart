import 'dart:io';

class FlutterAppGenerator {
  static Future<void> generate(
      String projectName, List<String> features) async {
    // Run flutter create to initialize a new Flutter project
    var result = await Process.run('flutter', ['create', projectName]);
    if (result.exitCode != 0) {
      print('Failed to create Flutter project: ${result.stderr}');
      return;
    }

    print('Flutter project created successfully.');

    // After creating the base project, start adding features
    var projectDir = Directory(projectName);
    var libDir = Directory('${projectDir.path}/lib');
    var featuresDir = Directory('${libDir.path}/features');
    featuresDir.createSync(recursive: true); // Ensure features directory exists

    for (var feature in features) {
      var featureDir = Directory('${featuresDir.path}/$feature');
      var dataDir = Directory('${featureDir.path}/data');
      var repoDir = Directory('${dataDir.path}/repo');

      featureDir.createSync(recursive: true);
      dataDir.createSync(recursive: true);
      repoDir.createSync(recursive: true);

      var repoDartFile = File('${repoDir.path}/${feature}_repository.dart');
      repoDartFile.createSync();
      repoDartFile.writeAsStringSync('// Repository for $feature');
    }

    print('Added custom features to Flutter project.');
  }
}
