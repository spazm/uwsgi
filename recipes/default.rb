#
# Author:: Gabe McArthur (<gabe@enmasse.com>)
# Cookbook Name:: uwsgi
# Recipe:: default
#
# Copyright 2011, En Masse Entertainment, Inc.
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

require_recipe "apt"
require_recipe "python"

apt_repository "uwsgi" do
  uri         "http://ppa.launchpad.net/uwsgi/release/ubuntu #{node['lsb']['codename']}"
  components  ["main"]
  keyserver   "keyserver.ubuntu.com"
  key         "B33D8107"
  action      :add
end

if node['python']['version'] =~ /^3\./
  package "uwsgi-python3"
else
  package "uwsgi-python"
end

service 'uwsgi-python' do
  action :enable
end
