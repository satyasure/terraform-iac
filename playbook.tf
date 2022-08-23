---
- hosts: localhost
  name: Create AWS infrastructure with Terraforms
  vars:
    terraform_dir: /home/ansible/terraform_aws
 
  tasks:
    - name: Create AWS instances with Terraform
      terraform:
        project_path: "{{ terraform_dir }}"
        state: present
      register: outputs
 
    - name: Add all instance public DNS to host group
      add_host: 
        name: "{{ item }}" 
        groups: public-intance
      loop: "{{ outputs.outputs.address.value }}"
 
- hosts: public-intance
  name: Do something with instances
  user: ec2-user
  become: yes
  gather_facts: false
  tasks:
    - name: Wait for instances to become reachable over SSH
      wait_for_connection:
        delay: 60
        timeout: 600
    - name: Ping
      ping:
