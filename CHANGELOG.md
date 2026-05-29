# Changelog


## Release 2.0.0

Compatibility refresh for the latest Puppet Enterprise (Puppet 8).

- **Breaking:** consolidated the two per-OS tasks (`bash_herd_resolver`, `powershell_herd_resolver`) into a single cross-platform task `thundering_herd_resolver::resolve`. The task's `implementations` metadata selects the bash (`shell` feature) or PowerShell (`powershell` feature) script automatically based on the target.
- Updated the `puppet` requirement to `>= 7.0.0 < 9.0.0` (PE 2021 / 2023 / 2025).
- Modernised `operatingsystem_support`: RedHat/CentOS/OracleLinux/Rocky/AlmaLinux 8 & 9, Debian 11 & 12, Ubuntu 20.04/22.04/24.04, Windows Server 2016/2019/2022. Dropped end-of-life platforms.
- Updated module to PDK 3.4.0 metadata.
- `bash_herd_resolver` now prepends `/opt/puppetlabs/bin` to `PATH` so it resolves the AIO `puppet` binary when run via Bolt / PE orchestrator, and uses a suffix-free `sleep` for portability across coreutils versions.
- `powershell_herd_resolver` hardened for modern PowerShell (5.1 & 7+): invokes puppet via the `&` call operator against the fully qualified `puppet.bat`, and casts `runinterval` with `[int]` instead of relying on implicit string coercion.
- Added rspec unit tests for both tasks (validated with `pdk test unit`).


## Release 0.1.0

First Release



## Release 0.1.2

Added Licence Information to the Readme

## Release 1.0.0

Qualified Paths For PowerShell
Confirmed support for Win2016 and Puppet 2019.0.x and 2018.1.X
Updated to PDK 1.9
