# RabbitMQ Lager (Logging) Integration

This repository provides a means to integrate the
[lager](https://github.com/basho/lager) logging framework into
[RabbitMQ](http://www.rabbitmq.com/) as a plugin.

### Usage

To activate the plugin, use the `rabbitmq-plugins` command line tool:

```bash
$ rabbitmq-plugins enable lager
```

For further documentation, see http://www.rabbitmq.com/plugins.html and
`man rabbitmq-plugins`.

To configure the plugin, set the relevant section of your RabbitMQ
config file using the key `lager`:

```erlang
[{rabbit, [...]},
 {lager, [
     {handlers, [
       {lager_console_backend, info},
       {lager_file_backend, [
         {"/var/log/rabbitmq/error.log", error, 10485760, "$D0", 5},
         {"/var/log/rabbitmq/console.log", info, 10485760, "$D0", 5}
       ]}
     ]}
   ]}
 ].
```

For further documentation, see http://www.rabbitmq.com/configure.html
and http://www.erlang.org/doc/man/config.html.

### A note about custom formatting

Whilst [lager](https://github.com/basho/lager) supports custom formatting,
RabbitMQ currently logs directly to the error_logger, and this plugin
simply starts the lager application so that its built-in error_logger
redirection kicks in and routes log messages to lager instead of the
default handlers. Because RabbitMQ is not using lager's logging APIs
however, metadata that is usually inserted by the lager parse_transform
will not be present and therefore any custom formatting rules added to
log handlers should provide a fallback if possible. See the documentation
at https://github.com/basho/lager#custom-formatting for more details.

### Installation

A binary release of the plugin, compiled against R14B03 is available for
download from github:

    $ curl -O https://raw.github.com/hyperthunk/rabbitmq-lager/master/rabbitmq_lager-2.0.0.ez

The binary artefact should be placed into your `plugins` directory and
should then be visible via the `rabbitmq-plugins list` command.

### Installation from source

Should you wish to compile the plugin yourself, then the following actions
should be enough to get you up and running.

    $ hg clone http://hg.rabbitmq.com/rabbitmq-public-umbrella
    $ cd rabbitmq-public-umbrella
    $ make co
    $ git clone git://github.com/hyperthunk/rabbitmq-lager.git
    $ cd rabbitmq-lager
    $ make

The built artefact will be located beneath the `./dist` folder.

### License

This package is dual-licensed under the MPL and Apache Licence v2.
Please see the LICENSE file for more details.
