Site: https://www.ansible.com/
Docs: https://docs.ansible.com/

# Install

macOS:

brew install ansible

# Concepts

* inventory - the list of hosts we manage

# Inventory File

Default Format: INI, YAML

Default:
/etc/ansible/hosts

Override with `-i PATH`

# Projects

## Dependencies

Called "Collections"
https://docs.ansible.com/ansible/latest/user_guide/collections_using.html

requirements.yml

```yaml
---
collections:
- NAME
```

Install

ansible-galaxy install -r requirements.yml
