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

require 'chef/knife'
require 'rbvmomi'

module VMWare
  module Helpers
    
    def vsphere
      @vsphere ||= RbVmomi::VIM.connect ::VMWare.credentials
    end
    
    def list_virtual_machines
      vms = []
      rootFolder = vsphere.serviceInstance.content.rootFolder
      rootFolder.childEntity.grep(RbVmomi::VIM::Datacenter).each do |dc|
        dc.datastoreFolder.childEntity.collect do |datastore|
          vms += datastore.vm.collect { |vm| { :instance => vm, :datastore => datastore.name } }
        end
      end
      # vms.flatten.compact
    end
    
    def find_vm(name)
      rootFolder = vsphere.serviceInstance.content.rootFolder
      vm = {}
      rootFolder.childEntity.grep(RbVmomi::VIM::Datacenter).each do |dc|
        dc.datastoreFolder.childEntity.collect do |datastore|
          vm[:instance] = datastore.vm.find { |x| x.name == name }
          if vm[:instance]
            vm[:datastore] = datastore.name
            break
          end
        end
        break if [:datastore]
      end
      vm
    end
    
    def find_resource_pool(name)
      rootFolder = vsphere.serviceInstance.content.rootFolder
      dc = rootFolder.childEntity.grep(RbVmomi::VIM::Datacenter).select do |dc|
        dc.datastoreFolder.childEntity.find { |d| d.name == name }.nil? == false
      end.flatten.compact.first
      dc.hostFolder.childEntity.collect.first.resourcePool
    end
    
  end
end
