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
require 'helpers'

module VMWare
  class VmwareReset < Chef::Knife
    include VMWare::Helpers
    
    deps do
      require 'rbvmomi'
    end
    
    banner "knife vmware reset NODE (options)"
    
    def run  
      unless name_args.size == 1
        puts "You need to supply a node"
        show_usage
        exit 1
      end
      
      node = name_args.first  
    end
    
  end
end