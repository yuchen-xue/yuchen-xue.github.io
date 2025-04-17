from datetime import UTC, datetime
from pathlib import Path
import tomllib

from jinja2 import Environment, FileSystemLoader

# Path to the TOML file that contains the data for building the website
TOML_FILE = "Yuchen_Xue-data.toml"

# Path to the Jinja2 template file for the website index page
INDEX_TEMPLATE = "index_template.html"

# Path to the output HTML index file
OUTPUT_FOLDER = "_site"


def main(toml_file: str, index_template: str, output_folder: str):
    """Create a website index page from a TOML file and a Jinja2 template.

    Args:
        toml_file (str): _path to the TOML file containing website data_
        index_template (str): _path to the Jinja2 template file for the website index page_
        output_folder (str): _a folder that contains the output HTML index file_
    """

    # Load Toml data
    with Path(toml_file).open("rb") as f:
        data = tomllib.load(f)

    # Add any extra context if needed
    data["current_year"] = datetime.now(tz=UTC).year

    if "social_networks" in data:
        for link in data["social_networks"]:
            if link.get("svg_path"):
                with Path(link["svg_path"]).open(encoding="utf-8") as svg_file:
                    link["svg_data"] = svg_file.read()

    # Set up Jinja environment
    env = Environment(loader=FileSystemLoader("."), autoescape=True)
    template = env.get_template(index_template)

    # Render the template with the data
    html_output = template.render(**data)

    print(f"Files found: \n\
            - HTML template: {index_template}\n\
            - Toml file: {toml_file}")
    print("Start rendering HTML output ...")
    
    # Create the directory that contains the rendered HTML file
    output_folder = Path(output_folder)
    output_folder.mkdir(parents=True, exist_ok=True)

    # Write the output to an HTML file
    output_file = output_folder.joinpath("index.html")
    with output_file.open("w", encoding="utf-8") as f:
        f.write(html_output)

    print(f"HTML file {output_file} generated successfully!")


if __name__ == "__main__":
    main(TOML_FILE, INDEX_TEMPLATE, OUTPUT_FOLDER)
