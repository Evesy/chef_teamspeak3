chef_teamspeak3 Cookbook
========================

A very rudimentry cookbook to provides a basic Teamspeak3 server install for Fedora/RHEL/CentOS distros (64 bit only atm).

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
  <tr>
    <td><tt>['ts3']['install_dir']</tt></td>
    <td>String</td>
    <td>Install directory</td>
    <td><tt>/teamspeak</tt></td>
  </tr>
  <tr>
    <td><tt>['ts3']['voice_port']</tt></td>
    <td>Integer</td>
    <td>Voice port</td>
    <td><tt>9987</tt></td>
  </tr>
  <tr>
    <td><tt>['ts3']['filetransfer_port']</tt></td>
    <td>Integer</td>
    <td>File trasnfer port</td>
    <td><tt>30033</tt></td>
  </tr>
  <tr>
    <td><tt>['ts3']['query_port']</tt></td>
    <td>Integer</td>
    <td>Server query port</td>
    <td><tt>10011</tt></td>
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

Optional recipe that creates & enables systemd service for Teamspeak

Contributing
------------

License and Authors
-------------------
Authors: Mike Eves
