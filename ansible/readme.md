# Ansible

Para facilitar a vida na criação de outra máquina vamos criar tasks do ansible.

## Instalação local

```shell
apt-get install ansible
```

## Uso

```shell
ansible-playbook -i hosts tasks/devtools.yml
ansible-playbook -i hosts tasks/deploy.yml
```

