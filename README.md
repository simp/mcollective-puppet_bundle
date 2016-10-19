# Puppet Bundle Agent

The Puppet Bundle Agent provides the ability to both `deploy` and `apply`
[Puppet Bundle](https://github.com/trevor-vaughan/mcollective-openscap-agent) artifacts.

Please report any errors or make feature requests in the [MCollective Puppet Bundle Project](https://github.com/simp/mcollective-puppet_bundle)

## Installation

Follow the [basic plugin install guide][install guide], taking all
the code from lib and adding it to your MCollective $libdir

[install guide]: https://docs.puppet.com/mcollective/deploy/plugins.html


## Configuring the agent

The agent should work without any additional configuration.

## Application usage

The `mco puppet_bundle` application has several subcommands to interact with an
OpenSCAP installation.

### mco puppet_bundle deploy <bundle>

Pushes a puppet bundle out to a number of clients

```shell
$ mco puppet_bundle deploy my_bundle

 * [ ============================================================> ] 1 / 1
```

### mco puppet_bundle apply <bundle_name>

Applies a previously pushed bundle

```shell
$ mco puppet_bundle apply my_bundle

 * [ ============================================================> ] 1 / 1
```

### mco puppet_bundle deploy <bundle_name> --apply

Pushes and applies a bundle

```shell
$ mco puppet_bundle deploy my_bundle --apply

 * [ ============================================================> ] 1 / 1
```
