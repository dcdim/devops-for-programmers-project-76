
install-requirements:
	ansible-galaxy install -r requirements.yml

setup: install-requirements
	@echo "Dependencies installed successfully"

servers:
	ansible-playbook -i inventory.ini playbook.yml

all: setup servers

deploy:
	ansible-playbook -i inventory.ini playbook.yml -u user --become

.PHONY: encrypt decrypt edit-vault deploy

encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml

decrypt:
	ansible-vault decrypt group_vars/webservers/vault.yml

edit-vault:
	ansible-vault edit group_vars/webservers/vault.yml

deploy-vault:
	ansible-playbook -i inventory.ini playbook.yml --ask-vault-pass