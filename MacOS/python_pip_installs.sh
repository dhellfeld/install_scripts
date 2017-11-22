# Command line tools
tools=(
    gspread
    flake8
    flake8-docstrings
)

echo "Installing python tools with pip..."
pip install ${tools[@]}