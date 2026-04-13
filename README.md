# Auto Organizer

A tool for automatically organizing files based on naming patterns.

# ⚠️ DISCLAIMER
## It is strongly advised against using this application with large folders and files in the watch directory. Furthermore, please refrain from processing any sensitive or critical data. As this application is not yet fully stable, it may exhibit unexpected behavior.

## Features
- Automatically move files between folders based on naming patterns
- Dark and light theme support
- System tray integration
- Persistent logs with undo/redo functionality
- Export logs

## Installation
Simply download and run the Installer.

> **Note:** Windows Defender may flag this application as a potential threat or unwanted software because it has permission to read and move files. However, rest assured that **Auto Organizer** is safe and does not contain any viruses or harmful components.

> To prevent this warning, you can either temporarily disable Windows Defender or add Auto Organizer to the **exclusion list** in Windows Security settings.

## Usage
1. Open the application
2. Add watch and target folder pairs
3. Click Start to begin watching
4. Files in the watch folders will be organized into subfolders in the target folders

## How the Folder Watcher Works
**1. Select Folders:**
* **Watched Folder:** Choose the folder you want to monitor for new files.
* **Target Folder:** Select where the files will be organized.

**2.Naming Scheme:**
Files in the Watched Folder will be renamed based on your naming scheme, automatically creating folders inside the Target Folder.

**How It Works:**
For example, let's say you have a file for English Homework.

In the Watched Folder, you name the file like this: English,Homework(hw).

Folder Creation:

The system will:

1. Check if a folder named English exists in the Target Folder. If not, it will create one.

2. Inside the English folder, it will create another folder named hw (because it's inside the parentheses ()).

3. Finally, it will move the file into the hw folder.

**Advanced Example:**

You can also use more complex names like: English,Homework(hw)[hw2]-hw3-.

The system will create folders inside each other:

English → hw → hw2 → hw3, and move the file into the final folder hw3.

Example 1: Simple Naming Scheme
Watched Folder: C:/Documents/

File Name: English,Homework(hw).pdf

Target Folder: C:/Organized/

Result:

```css
Copy
Edit
C:/Organized/
   └── English/
         └── hw/
            └── Homework.pdf
```
Example 2: Advanced Naming Scheme
Watched Folder: C:/Documents/

File Name: English,Homework(hw)[hw2]-hw3-.pdf

Target Folder: C:/Organized/

Result:

```css
Copy
Edit
C:/Organized/
   └── English/
         └── hw/
               └── hw2/
                     └── hw3/
                        └── Homework.pdf
```
With this setup, your files are automatically organized into nested folders, saving you time and effort!

## Support
For issues or feature requests, please visit:
[Issues](https://github.com/EyadElshaer/Auto-Organize/issues)
