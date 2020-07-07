
<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

 {{ $ds := ds "params" }}

{{ range $spremote := $ds.sp_remote }}
$metadata['{{ $spremote.entityid }}'] = array(
   'AssertionConsumerService'      => '{{ $spremote.assertionconsumerservice }}',
   'NameIDFormat'                  => '{{ $spremote.nameidformat }}',
   'simplesaml.nameidattribute'    => '{{ $spremote.ssnameidattribute }}',
   'simplesaml.attributes'         =>  {{ $spremote.ssattributes }},
   'SingleLogoutService'           => '{{ $spremote.singlelogoutservice }}',
{{ if eq $spremote.restricttoldapgroup "all" }}
{{ else }}
   'authproc' => [
       60 => [
           'class' => 'authorize:Authorize',
           'regex' => false,
           'memberOf' => [
               '{{ $spremote.restricttoldapgroup }}',
           ],
           'reject_msg' => [
               'en' => 'This site is only available to members of {{ $spremote.restricttoldapgroup }}.',
               'de' => 'Diese Seite nur f  r Mitglieder von {{ $spremote.restricttoldapgroup }} verf  gbar.',
           ]
    ]
]
{{ end }}
);

{{ end }}
