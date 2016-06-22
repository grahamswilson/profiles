class profiles::foo_bar_com {

	include [ '::profiles::apache' ]

	apache::vhost {'foo.bar.com':
	  port    => '8080',
	  docroot => '/var/www/html/foo_bar_com',
	}

	vcsrepo { '/var/www/html/foo_bar_com':
	  ensure   => 'present',
	  provider => 'git',
	  source   => 'https://github.com/grahamswilson/web_content.git',
	  require  => Apache::Vhost['foo.bar.com'],
	}

}
