#!/usr/bin/env powershell

# Puppet Task Name:powershell_herd_resolver 
#
sleep -s  $(Get-Random -minimum 1 -maximum $(puppet agent --configprint runinterval))
puppet resource service puppet ensure=stopped
puppet resource service puppet ensure=running
