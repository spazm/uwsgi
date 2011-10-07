#
# Author:: Gabe McArthur (<gabe@enmasse.com>)
# Cookbook Name:: uwsgi
# Recipe:: python
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

require_recipe "python"

case node['python']['version']
when /^2\.6/
  package "uwsgi-python2.6"
when /^2\.7/
  package "uwsgi-python"
when /^3\.1/
  package "uwsgi-python3.1"
when /^3/
  package "uwsgi-python3"
end

