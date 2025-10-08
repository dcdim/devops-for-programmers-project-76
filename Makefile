
install-requirements:
	ansible-galaxy install -r requirements.yml

setup: install-requirements
	@echo "Dependencies installed successfully"

servers:
	ansible-playbook -i inventory.ini playbook.yml

all: setup servers