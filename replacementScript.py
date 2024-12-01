import re


def replace_markdown(file_path, output_path):
    # Read the content of the file
    with open(file_path, "r") as file:
        content = file.read()

    # Define the replacement rules
    replacements = {
        r"\\\[": "$$",  # Replace "\[ " with "$$"
        r"\\\]": "$$",  # Replace " \]" with "$$"
        r"\\\( ": "$",  # Replace "\( " with "$"
        r" \\\)": "$",  # Replace " \)" with "$"
    }

    # Apply the replacements
    for pattern, replacement in replacements.items():
        content = re.sub(pattern, replacement, content)

    # Write the modified content to a new file
    with open(output_path, "w") as file:
        file.write(content)


# Input and output file paths
input_file = "input.md"  # Replace with your markdown file
output_file = "output.md"  # File to save the updated markdown content

# Perform the replacements
replace_markdown(input_file, output_file)

print(f"Replacements completed. Updated file saved as '{output_file}'.")
