
# thundering_herd_resolver
#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with thundering_herd_resolver](#setup)
    * [What thundering_herd_resolver affects](#what-thundering_herd_resolver-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with thundering_herd_resolver](#beginning-with-thundering_herd_resolver)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This Module Contains tasks for Bash and Powershell environments that will alleviate a thundering herd by restarting the Puppet Agent Service at random intervals

When the tasks in this module are run on any given node, they will take the current setting of the parameter "runinterval" and restart the the service randomly within an interval defined as >= and <= runinterval


## Setup



### Beginning with thundering_herd_resolver  

Install the Module, select the task appropriate to the OS Target node the options are:

bash_herd_resolver - for Linux systems running a bash shell
powershell_herd_resolver - for windows server systems



## Limitations


##Development


## Release Notes/Contributors/Etc.

0.1.1 first release

## Copyright and License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

