# Ansible con 5 servidores Ubuntu en Docker

```
docker compose up -d
ANSIBLE_CONFIG=./ansible.cfg ansible all -m ping
ANSIBLE_CONFIG=./ansible.cfg ansible-playbook playbook.yml
```
