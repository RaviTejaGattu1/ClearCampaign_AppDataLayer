import os

def generate_directory_buttons():
    directories = [d for d in os.listdir() if os.path.isdir(d) and not d.startswith('.')]
    buttons = [f"- [{d}]({d}/)" for d in directories]
    return buttons

def generate_readme():
    buttons = generate_directory_buttons()
    with open('README.md', 'w') as file:
        file.write("# Repository Directory Navigator\n\n")
        file.write("Welcome to the Repository Directory Navigator! Below, you'll find a list of directories within this repository. Click on any directory name to navigate to that directory.\n\n")
        file.write("## Directories\n\n")
        file.write("\n".join(buttons))
        file.write("\n\nFeel free to explore!")

if __name__ == "__main__":
    generate_readme()
