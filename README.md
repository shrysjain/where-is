# where-is 🔍
`where-is` is a command-line tool designed to help you find files and directories efficiently. It provides a range of features to enhance your file search capabilities directly from the terminal.

## Key Features

- **Basic Usage**: Search for a specific filename in the current directory or a specified path.
- **Exclude Directories**: Use the `-e <dir>` flag to exclude specific directories from the search.
- **Gitignore Integration**: Use the `--gitignore` flag to exclude files and directories listed in the `.gitignore` file.
- **Verbose Output**: Use the `--verbose` flag for a more detailed output.
- **Extension-Based Search**: Use the `--ext <extension>` flag to search for all files with a given extension.
- **Directory Search**: Use the `-d` flag to include directories in the search results.

## Installation

### Using Homebrew

1. **Tap the repository:**

    ```bash
    brew tap shrysjain/where-is
    ```

2. **Install the `where-is` tool:**

    ```bash
    brew install where-is
    ```

3. **Verify the installation:**

    ```bash
    where-is --help
    ```

### Running Your Own Instance (Without Homebrew)

1. **Clone the repository:**

    ```bash
    git clone https://github.com/shrysjain/homebrew-where-is.git
    cd homebrew-where-is
    ```

2. **Make the script executable:**

    ```bash
    chmod +x where-is.sh
    ```

3. **Move the script to a directory in your PATH:**

    ```bash
    sudo mv where-is.sh /usr/local/bin/where-is
    ```

4. **Verify the installation:**

    ```bash
    where-is --help
    ```

## Usage

Basic usage:

```bash
where-is <filename> [path]
```

For detailed help on available options, use:

```bash
where-is --help
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes. Make sure to follow the existing code style and add tests for new features.

## Licensing

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
