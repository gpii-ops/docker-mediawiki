FROM inclusivedesign/centos

WORKDIR /etc/ansible/playbooks

COPY provisioning/*.yml /etc/ansible/playbooks/

RUN ansible-galaxy install -r requirements.yml

RUN ansible-playbook build.yml --tags "install,configure,deploy"

COPY provisioning/start.sh /usr/local/bin/start.sh

RUN chmod 755 /usr/local/bin/start.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/start.sh"]
