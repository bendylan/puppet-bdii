class bdii::sambdii inherits bdii::params {

  Class[Bdii::Config] -> Class[Bdii::Sambdii]

  if defined( Class["bdii"]) {
    fail("Do not include / declare top level bdii class when using bdii::sitebdii")
  }
  include bdii::install
  include bdii::firewall
  class {"bdii::config":
    delete_delay => $bdii::params::sitedeletedelay,
  } 

  package { "emi-bdii-top":
          ensure => present,
  }
  package { "glite-info-plugin-fcr":
    ensure => present,
  }

  file {"/etc/bdii/gip/glite-info-site-defaults.conf":
      content => template('bdii/glite-info-site-defaults.erb'),
      owner => 'root',
      group => 'root',
      mode => '644',
      loglevel => err,
  }
}
  
