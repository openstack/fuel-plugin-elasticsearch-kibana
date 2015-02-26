Elasticsearch-Kibana Plugin for Fuel
====================================

Elasticsearch-Kibana plugin
---------------------------

Overview
--------

Elasticsearch and Kibana provide a full-text search engine with a flexible web
interface for exploring and visualizing data.

Requirements
------------

| Requirement                    | Version/Comment |
|--------------------------------|-----------------|
| Mirantis OpenStack compatility | 6.1 or higher   |

Recommendations
---------------

It is highly recommended to use dedicated disk(s) for data storage. Otherwise
Elasticsearch will store its data on the root filesystem.

Limitations
-----------

None so far.

Installation Guide
==================

**Elasticsearch-Kibana** plugin installation
--------------------------------------------


To install the Elasticsearch-Kibana plugin, follow these steps:

1. Download the plugin from the [Fuel Plugins
   Catalog](https://software.mirantis.com/download-mirantis-openstack-fuel-plug-ins/).

2. Copy the plugin file to the Fuel Master node. Follow the [Quick start
   guide](https://software.mirantis.com/quick-start/) if you don't have a running
   Fuel Master node yet.
   ```
   scp elasticsearch-kibana-plugin-6.1.0.fp root@<IP address>:
   ```
3. Install the plugin using the `fuel` command line:
   ```
   fuel plugins --install elasticsearch-kibana-plugin-6.1.0.fp
   ```
4. Verify that the plugin is installed correctly:
   ```
   fuel plugins --list
   ```

User Guide
==========

**Elasticsearch-Kibana** plugin configuration
---------------------------------------------

1. Create a new environment with the Fuel UI wizard.
2. Add a node with the "Operating System" role.
3. Before applying changes or once changes applied, edit the name of the node by
   clicking on "Untitled (xx:yy)" and modify it for "elasticsearch".
4. Click on the Settings tab of the Fuel web UI.
5. Scroll down the page, select the "Elasticsearch-Kibana Server plugin" checkbox
   and fill-in the required fields.

Known issues
------------

None.

Release Notes
-------------

**6.1.0**

* Initial release of the plugin

Contributors
------------

* Guillaume Thouvenin <gthouvenin@mirantis.com>
* Simon Pasquier <spasquier@mirantis.com>
* Swann Croiset <scroiset@mirantis.com>
