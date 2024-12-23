#!/bin/bash

install_dependencies() {
    pip install requests pyfiglet rich psutil
}

install_termux_dependencies() {
    pkg update -y
    pkg upgrade -y
    pkg install python -y
    pkg install clang -y
    pip install requests pyfiglet rich psutil
}

install_linux_dependencies() {
    sudo apt update -y
    sudo apt install python3-pip python3-dev -y
    pip3 install requests pyfiglet rich psutil
}

if [[ $TERMUX_VERSION ]]; then
    install_termux_dependencies
elif [[ -n $(which apt) ]]; then
    install_linux_dependencies
else
    echo "Unable to detect a supported environment."
    echo "Please ensure you have Python installed and use a supported Linux distribution or Termux."
    exit 1
fi

echo "Verifying installation..."
python3 -c "import requests, pyfiglet, rich, psutil; print('All dependencies are installed successfully!')"

if [ $? -ne 0 ]; then
    echo "Installation failed! Trying alternate method..."
    echo "If you are on Linux, try manually installing the dependencies using the following commands:"
    echo "1. sudo apt install python3-pip python3-dev"
    echo "2. pip3 install requests pyfiglet rich psutil"
    echo "If you are on Termux, ensure you have the latest version of Termux and try running the script again."
    exit 1
fi

echo "Installation completed successfully!"