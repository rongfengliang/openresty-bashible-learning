# openresty+bashible learning

## Basic Usage

* pull docker image

```code
docker pull dalongrong/openresty:bashible
```

* template

resources in content && t.bash for template 

t.bash

```code
use template
# set some variables for the template
FOO_OR_BAR=bar
@ Creating index page for home
  - output_to /usr/local/openresty/nginx/html/index.html template index.html.tpl
```

* running

```code
docker runn -d -p 80:80 $PWD/content/:/opt/content/ dalongrong/openresty:bashible
```

## With Multi Stage

* Dockerfile

```code
FROM dalongrong/openresty:bashible as build
WORKDIR /opt
COPY content/ /opt/content
RUN cd /opt/content/ && bashible t.bash

FROM openresty/openresty:alpine
COPY --from=build /usr/local/openresty/nginx/html/index.html  /usr/local/openresty/nginx/html/index.html
```