# Description

Installs and configures uWSGI. Please see the nginx cookbook for additional
support for uWSGI.

# Requirements

# Platform

* Debian, Ubuntu

# Cookbooks

* python
* apt

# Resource/Provider

This cookbook includes LWRPs for create new uWSGI sites.

## `uwsgi_app`

Enables, starts, stops, restarts, or disables a uWSGI app.

### Actions

- `:enable`: Enable a new site by create a configuration file for it.
- `:disable`: Disable a site by removing a given file and stopping any matching
  running service.
- `:start`: Start a uWSGI service.
- `:stop`: Stop a uWSGI service.
- `:restart`: Restart a uWSGI service.

### Attribute Parameters

- `app_name`: The name of the app.
- `port`: The port number that uWSGI should listen on.
- `attributes`: Additional attributes to set in the configuration.

### Examples

    ```ruby
    uwsgi_app "simple-site" do
      port 5330
      attributes {
        'master' => true,
        'workers' => 8,
        'pythonpath' => '/srv/path'
      }
    end
    ```
    
# Usage

## default

Include default recipe in a run list, to get the uWSGI installation.

# Changes and TODOs

* TODO: Possibly add the ability to install from source.

# License and Author

Author:: Gabe McArthur (<gabe@enmasse.com>)

Copyright:: 2011, En Masse Entertainment, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

