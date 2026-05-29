#!/bin/bash

# Puppet Task implementation: thundering_herd_resolver::resolve (shell)
# Selected automatically for targets advertising the 'shell' feature (*nix).
# It will randomise the restart of the puppet agent based on the current value of runinterval.

# When invoked via Bolt/PE orchestrator the AIO puppet binary is not always on PATH.
export PATH="/opt/puppetlabs/bin:${PATH}"

runinterval=$(puppet agent --configprint runinterval)
sleep $(( ( RANDOM % runinterval ) + 1 ))
puppet resource service puppet ensure=stopped
puppet resource service puppet ensure=running
