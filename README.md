# openresty+bashible learning

## Usage

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

