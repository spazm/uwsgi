#
# Cookbook Name:: uwsgi
# Resource:: app
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

actions :enable, :disable, :stop, :start, :restart, :reload

attribute :app_name,      :kind_of => String,   :name_attribute => true
attribute :port,          :kind_of => Fixnum,   :required => true
attribute :attributes,    :kind_of => Hash

def initialize(*args)
  super
  @actions = [:enable]
end
