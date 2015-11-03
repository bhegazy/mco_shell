class mco_shell {

    Class['puppet_enterprise_mcollective::server::plugins'] -> Class[$title] ~> Service['mcollective']
    include puppet_enterprise_mcollective
    $plugin_basedir = $puppet_enterprise_mcollective::server::plugins::plugin_basedir
    $mco_etc        = $puppet_enterprise_mcollective::params::mco_etc

    file {"${plugin_basedir}/agent/shell.ddl"
        ensure => file,
		    owner => 'root',
		    group => 'root',
		    source => 'puppet:///modules/mco_shell/shell.ddl'
  }

}
