<?php

{{ $ds := ds "params" }}

$config = array(
	// This is a authentication source which handles admin authentication.
	'admin' => array(
		// The default is to use core:AdminPassword, but it can be replaced with
		// any authentication source.
		'core:AdminPassword',
	),

	{{ range $authsource := $ds.authsources_ldap  }}
		'{{ $authsource.name }}' => array(
		   'ldap:LDAP',

		    /* The hostname of the LDAP server. */
		    'hostname' => '{{ $authsource.host }}',

		    /* Whether SSL/TLS should be used when contacting the LDAP server. */
		    'enable_tls' => {{ $authsource.enable_tls }},

		    /*
		     * Which attributes should be retrieved from the LDAP server.
		     * This can be an array of attribute names, or NULL, in which case
		     * all attributes are fetched.
		     */
		    'attributes' => NULL,

		    /*
		     * The pattern which should be used to create the user's DN given the username.
		     * %username% in this pattern will be replaced with the user's username.
		     *
		     * This option is not used if the search.enable option is set to TRUE.
		     */
		    'dnpattern' => '{{ $authsource.dn_pattern }}',

		    /*
		     * As an alternative to specifying a pattern for the users DN, it is possible to
		     * search for the username in a set of attributes. This is enabled by this option.
		     */
		    'search.enable' => {{ $authsource.search_enable}},

		    /*
		     * The DN which will be used as a base for the search.
		     * This can be a single string, in which case only that DN is searched, or an
		     * array of strings, in which case they will be searched in the order given.
		     */
		    'search.base' => '{{ $authsource.search_base }}',

		            /*
		             * The scope of the search. Valid values are 'subtree' and 'onelevel' and 'base',
		             * first one being the default if no value is set.
		             */
		            'search.scope' => '{{ $authsource.search_scope }}',

		    /*
		     * The attribute(s) the username should match against.
		     *
		     * This is an array with one or more attribute names. Any of the attributes in
		     * the array may match the value the username.
		     */
		    'search.attributes' => array(
				{{ range $attribute := $authsource.attributes  }}
				  '{{ $attribute }}',
                {{ end }}
            ),
		    /*
		     * Additional filters that must match for the entire LDAP search to be TRUE
		     *
		     * This should be a single string conforming to (RFC 1960, 2544)
		     * The string is appended to the search attributes
		     */
		    'search.filter' => '{{ $authsource.search_filter }}',

		    /*
		     * The username & password where SimpleSAMLphp should bind to before searching. If
		     * this is left NULL, no bind will be performed before searching.
		     */
		    'search.username' => '{{ $authsource.search_username }}',
		    'search.password' => '{{ $authsource.search_password }}',
		),
	{{ end }}
);
