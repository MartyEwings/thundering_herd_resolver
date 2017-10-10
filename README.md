
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

1.0 first release

