maintainer        "En Masse Entertainment, Inc."
maintainer_email  "gabe@enmasse.com"
license           "Apache 2.0"
description       "Installs "
version           "0.1.0"

depends           "python"
depends           "apt"

recipe "uwsgi",           "Installs uWSGI"
recipe "uwsgi::python",   "Installs the python support for uWSGI, depending upon your version."
recipe "uwsgi::extra",    "Installs the uWSGI extras."
recipe "uwsgi::mod_uwsgi", "Installs the Apache2 mod_uwsgi module."
recipe "uwsgi::plugin_lua", "Installs the lua plugin"
recipe "uwsgi::plugin_psgi", "Installs the psgi plugin"
recipe "uwsgi::plugin_rack", "Installs the rack plugin"
recipe "uwsgi::plugins_all", "Installs all of the plugins"

%w{ debian ubuntu }.each do |os|
  supports os
end
