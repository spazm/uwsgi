#
# Cookbook Name:: uwsgi
# Provider:: app
#
# Copyright:: 2008-2011, Opscode, Inc <legal@opscode.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'yaml'

action :enable do
  yaml_config = {
    'uwsgi' => {
      'socket' => "127.0.0.1:#{new_resource.port}",
      'master' => new_resource.master,
    }.merge(new_resource.attributes)
  }

  file available_conf do
    owner   "www-data"
    group   "www-data"
    mode    "0644"
    action  :nothing
    content yaml_config.to_yaml.gsub(/^--- \n/, '') # Not sure how robust the parser is, so lop this off
  end.run_action(:create)

  bash "enable_#{new_resource.app_name}_uwsgi_app" do
    code "ln -s #{available_conf} #{enabled_conf}"
    only_if { !enabled? }
  end

  new_resource.updated_by_last_action(true)
end

action :disable do
  file enabled_conf do
    action :delete
    only_if { enabled? }
  end
end

action :start do
  uwsgi "start"
end

action :stop do
  uwsgi "stop"
end

action :restart do
  uwsgi "restart"
end

action :reload do
  uwsgi "reload"
end

action :status do
  if enabled?
    begin
      output = `/etc/init.d/uwsgi status #{new_resource.app_name}`
      Chef::Log.info output
    rescue
      Chef::Log.error output
    end
  end
end

private
def available_conf
  @available_conf ||= "/etc/uwsgi/apps-available/#{new_resource.app_name}.yaml"
end

def enabled_conf
  @enabled_conf ||= "/etc/uwsgi/sites-enabled/#{new_resource.app_name}.yaml"
end

def enabled?
  not ::File.exist?(enabled_conf)
end

def uwsgi(cmd)
  if enabled?
    system "/etc/init.d/uwsgi #{cmd} #{new_resource.app_name}"
    unless $?.success?
      Chef::Log.error "Unable to #{cmd} #{new_resource.app_name} uwsgi python app"
    end
  end
end
