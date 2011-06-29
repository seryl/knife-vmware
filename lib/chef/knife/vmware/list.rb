#
# Author:: Josh Toft <jtoft@zinio.com>
# Copyright:: Copyright (c) 2011 Zinio, LLC
# License:: Apache License, Version 2.0
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

$:.unshift File.dirname(__FILE__)

require 'chef/knife'
require 'chef/shef/ext'
require 'helpers'

module VMWare
  class VmwareList < Chef::Knife
    include VMWare::Helpers
  
    deps do
      require 'rbvmomi'
    end
  
    banner "knife vmware list (options)"
  
    def run
      ui.output(find_vm('stg-main-gmond1'))
      # ui.output(list_virtual_machines)
      # Shef::Extensions.extend_context_object(self)
      # ui.output(nodes.find("role:newsstand"))
    end
    
  end
end
