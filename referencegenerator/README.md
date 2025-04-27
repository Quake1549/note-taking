
# APA Reference Generator

A simple interactive **Bash script** that generates APA-style reference entries for different types of sources (books, YouTube videos, web articles, podcasts, and movies).  
The script prompts the user for necessary information and formats the reference automatically.

## 📋 Features

- Supports multiple source types:
  - Books
  - YouTube videos
  - Web articles
  - Podcast episodes
  - Movies
- Easy step-by-step prompts
- Outputs a properly formatted APA reference

## 🚀 How to Use

1. Make sure the script is executable:
   ```bash
   chmod +x apa_reference_generator.sh
   ```

2. Run the script:
   ```bash
   ./apa_reference_generator.sh
   ```

3. Follow the prompts to enter the required information.
4. Copy the generated APA reference for use in your work.

## 🛠 Example

Running the script:

```
$ ./apa_reference_generator.sh
APA Reference Generator
Select source type:
1) Book
2) YouTube Video
3) Web Article
4) Podcast Episode
5) Movie
Enter number: 1

Author's last name: Kaufmann
Author's initials: W.
Year of publication: 1954
Title of the book: The Portable Nietzsche
Publisher: Penguin Books
```

Output:
```
APA Reference:
Kaufmann, W. (1954). *The Portable Nietzsche*. Penguin Books.
```

## 📚 Requirements

- Bash (available on macOS and Linux by default)
- No extra dependencies
