git clone https://github.com/opennetworkinglab/aether-ansible.git

cd aether-ansible

cat >> hosts.ini << EOF
[aethercompute]
node1 ansible_host=10.92.2.5

[aethercompute:vars]
ansible_user="<your compute node username>"
ansible_become_password="<sudo password>"
ansible_python_interpreter=/usr/bin/python3
EOF

cat >> sriov-playbook.yaml << EOF
- hosts: all
  vars:
    sriov_pf_name: "<SR-IOV PF name>"
  roles:
    - sriov
EOF

ansible-playbook -b -i hosts.ini sriov-playbook.yaml
