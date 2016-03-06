chef_teamspeak3 Cookbook
========================

A very rudimentry cookbook to provides a basic Teamspeak3 server install for Fedora/RHEL/CentOS distros (Currently only supports x86 platforms).

Requirements
------------

Attributes
----------

#### chef_teamspeak3::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ts3']['version']</tt></td>
    <td>String</td>
    <td>Teamspeak version</td>
    <td><tt>3.0.12.3</tt></td>
  </tr>
</table>

Usage
-----
#### chef_teamspeak3::default

Edit version attribute to change teamspeak version that will be installed
Include `chef_teamspeak3` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef_teamspeak3]"
  ]
}
```
#### chef_teamspeak3::bzip2

Required by `chef_teamspeak3::default`

#### chef_teamspeak3::ts3ctl

Optional recipe that creates custom control script & systemd service for TS3

Contributing
------------

License and Authors
-------------------
Authors: Mike Eves
