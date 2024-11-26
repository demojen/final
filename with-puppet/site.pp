package { 'httpd':
  ensure => installed,
}

service { 'httpd':
  ensure => running,
  enable => true,
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => '<h1>Welcome to Puppet-Managed Apache!</h1>',
}
