# Flutter Cote CLI

## Overview

Flutter Cote CLI is a Command Line Interface tool that automates the setup and configuration of new Flutter applications. It integrates directly with the Flutter CLI to initialize the base project and then adds specified features, structuring them into a clean architecture pattern. This tool is ideal for developers looking to streamline their Flutter project setup process with predefined features and directories.

## Features

- **Automated Flutter Project Initialization**: Utilizes `flutter create` to establish the initial project structure.
- **Feature-Based Customization**: Adds specified features to the project, organizing them into directories and files for data handling and UI representation.
- **Designed for Extensibility**: Easily extended with additional features or custom file templates.

## Prerequisites

- **Dart SDK**: Installed on your system for running and developing the CLI tool.
- **Flutter SDK**: Necessary for project initialization and must be properly set up in your system's PATH.

## Installation

To begin using Flutter Cote CLI, follow these steps:

1. **Clone the Repository**
   Clone the CLI tool from GitHub to your local machine:
   ```bash
   git clone https://github.com/yourgithub/flutter_cote_cli.git
   cd flutter_cote_cli

2. **Fetch Dependencies**
   Fetch the necessary Dart dependencies by running:
   ```bash
   dart pub get

3. **Install Globally**
   To use the CLI tool from any terminal session, install it globally:
   ```bash
   dart pub global activate --source path .

## Usage

After installation, the CLI tool can be accessed globally through the `cote` command. Use the tool as follows:

```bash
cote -p <project_name> -f <feature1> <feature2> ...
```

### Example Command

```bash
cote -p my_flutter_app -f auth home
```
This command initializes a new Flutter project named my_flutter_app and configures it with 'auth' and 'home' features, each structured into its designated directories and starter files.

## Project Structure

The project structure organized by the CLI tool will appear as follows:

```plaintext
my_flutter_app/
│
├── lib/
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   │   ├── repo/
│   │   │   │   │   └── auth_repository.dart
│   │   │   │   ├── service/
│   │   │   │   ├── dto/
│   │   │   │   ├── models/
│   │   │   ├── presentation/
│   │   │   │   └── auth_page.dart
│   │   ├── home/
│   │   │   ├── data/
│   │   │   │   ├── repo/
│   │   │   │   │   └── home_repository.dart
│   │   │   │   ├── service/
│   │   │   │   ├── dto/
│   │   │   │   ├── models/
│   │   │   ├── presentation/
│   │   │   │   └── home_page.dart
│
```

## Extending the Tool

For developers looking to enhance the CLI tool or add new features:

- **Modify the Generator**: Edit `lib/generator/flutter_app_generator.dart` to tweak the file and directory creation logic according to new requirements.
- **Implement Templates**: Incorporate a templating engine to generate files from templates, enhancing the customization capabilities of the tool.

## Support

For support, feature requests, or contributions, visit the GitHub repository issues page:
[GitHub Issues](https://github.com/thurakhant/cote-cli/issues)

