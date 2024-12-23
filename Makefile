.PHONY: install run

install:
	@echo "Installing dependencies..."
	@if [ -n "$(TERMUX_VERSION)" ]; then \
		pkg update -y && pkg upgrade -y && pkg install python -y && pkg install clang -y && pip install requests pyfiglet rich psutil; \
	elif [ -n "$(which apt)" ]; then \
		sudo apt update -y && sudo apt install python3-pip python3-dev -y && pip3 install requests pyfiglet rich psutil; \
	else \
		echo "Unable to detect a supported environment."; \
		echo "Please ensure you have Python installed and use a supported Linux distribution or Termux."; \
		exit 1; \
	fi
	@echo "Dependencies installed successfully!"

run:
	@echo "Running TempMailViewer..."
	python3 main.py