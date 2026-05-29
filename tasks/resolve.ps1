#!/usr/bin/env pwsh

# Puppet Task implementation: thundering_herd_resolver::resolve (powershell)
# Selected automatically for targets advertising the 'powershell' feature (Windows).
# It will randomise the restart of the puppet agent based on the current value of runinterval.

$puppet = 'C:\Program Files\Puppet Labs\Puppet\bin\puppet.bat'
$runinterval = [int](& $puppet agent --configprint runinterval)
Start-Sleep -Seconds (Get-Random -Minimum 1 -Maximum $runinterval)
& $puppet resource service puppet ensure=stopped
& $puppet resource service puppet ensure=running
