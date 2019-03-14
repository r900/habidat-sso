#SSO Container for habi\*DAT platform

This container provides a SimpleSAMLPHP on top of an debian apache/PHP container. It autoconfigures based on a YML file. 

### Configuration

Create a configuration file called `/params.yml` that defines your authentication sources and metadata (feel free to use `params.yml.dist` as an example)
This file needs to be mounted into the container's root directory as `/params.yml`, either directly via:

```
$ docker run -v $(pwd)/myparams.yml:/params.yml habidat/sso
```

or as a volume in `docker-compose.yml`. The container will automatically write SimpleSAMLphp's configuration files for you based on this document.


### Environment Variables

Two variables should be provided to ensure everything running correctly:

* HABIDAT_DOMAIN: the base domain of your platform (e.g. example.org)
* HABIDAT_TITLE: the title of platform (shown on login screen)

### Credits

Concept inspired heavily by:
* https://github.com/tozny/SimpleSAMLphp

Theme is structurally built upon:
* https://github.com/corycollier/simplesamlphp-module-themes