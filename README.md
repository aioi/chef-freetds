Description
===========

[![Build Status](https://travis-ci.org/aioi/chef-freetds.png?branch=master)](https://travis-ci.org/aioi/chef-freetds)

This cookbook install and configure FreeTDS

Platform
--------

* Debian
* Ubuntu

May work with or without modification on other distributions.

Usage
-----
Just include `freetds` in your node's `run_list`.

If you want to configure some server add them to your node's attributes:

    node['freetds']['servers'] = [
      {
        'name' => 'egServer70',
        'description' => 'A typical Microsoft server',
        'host'=> 'ntmachine.domain.com',
        'port' => 1433,
        'tds_version' => '7.0',
        'text_size' => 1024
      }
    ]

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: [Olivier Brisse](https://github.com/ouranos)
