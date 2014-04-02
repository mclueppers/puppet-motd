class motd {
	$ifaces = split($::interfaces, ',')

	anchor { "Motd:Begin":
		before => File['/etc/motd']
	}

	file { '/etc/motd':
		ensure => 'present',
		content => template("motd/motd.erb"),
	}

	anchor { "Motd:End":
        }

	Anchor['Motd:Begin'] ->
	File['/etc/motd'] ->
	Anchor['Motd:End']
}
