use template
# set some variables for the template
FOO_OR_BAR=bar
@ Creating index page for home
  - output_to /usr/local/openresty/nginx/html/index.html template index.html.tpl