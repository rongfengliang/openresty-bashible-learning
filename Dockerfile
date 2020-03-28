FROM openresty/openresty:1.15.8.3-stretch
RUN apt update && apt-get install -y wget net-tools
RUN wget https://raw.githubusercontent.com/mig1984/bashible/master/bashible
RUN wget https://raw.githubusercontent.com/mig1984/bashible/master/bashible.edit.bash
RUN wget https://raw.githubusercontent.com/mig1984/bashible/master/bashible.net.bash
RUN wget https://raw.githubusercontent.com/mig1984/bashible/master/bashible.template.bash
RUN wget https://raw.githubusercontent.com/mig1984/bashible/master/bashible.timeout.bash
RUN chmod 755 bashible && chmod 755 bashible.edit.bash && chmod 755 bashible.net.bash  && chmod 755 bashible.template.bash && chmod 755 bashible.timeout.bash
RUN mv bashible /usr/local/bin && mv bashible.edit.bash /usr/local/bin && mv bashible.net.bash /usr/local/bin && mv bashible.template.bash /usr/local/bin && mv bashible.timeout.bash /usr/local/bin
CMD ["sh", "-c", "cd /opt/content/ && bashible t.bash && /usr/bin/openresty -g 'daemon off;'"]