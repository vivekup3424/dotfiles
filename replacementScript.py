import re


def replace_markdown(file_path, output_path):
    # """
    # Convert LaTeX delimiters in markdown files from \[ \] and \( \) format
    # to $$ and $ format respectively.
    #
    # Args:
    #     file_path (str): Path to input markdown file
    #     output_path (str): Path to output markdown file
    # """
    try:
        # Read the content of the file
        with open(file_path, "r", encoding="utf-8") as file:
            content = file.read()

        # Define the replacement rules with improved patterns
        replacements = {
            r"\\\[\s*": "$$\n",  # Replace "\[" with "$$" (handles optional spaces)
            r"\s*\\\]": "\n$$",  # Replace "\]" with "$$" (handles optional spaces)
            r"\\\(\s*": "$",  # Replace "\(" with "$" (handles optional spaces)
            r"\s*\\\)": "$",  # Replace "\)" with "$" (handles optional spaces)
        }

        # Apply the replacements
        for pattern, replacement in replacements.items():
            content = re.sub(pattern, replacement, content)

        # Write the modified content to a new file
        with open(output_path, "w", encoding="utf-8") as file:
            file.write(content)

        return True

    except FileNotFoundError:
        print(f"Error: Could not find the file '{file_path}'")
        return False
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        return False


def main():
    # Input and output file paths
    input_file = "input.md"  # Replace with your markdown file
    output_file = "output.md"  # File to save the updated markdown content

    # Perform the replacements
    if replace_markdown(input_file, output_file):
        print(f"Replacements completed. Updated file saved as '{output_file}'.")
    else:
        print("Failed to process the file.")


if __name__ == "__main__":
    main()
