$packages = ['ruby', 'ruby-dev', 'gcc', 'make']

package { $packages:
  ensure => 'installed'
}

package { 'inspec':
  ensure   => 'installed',
  provider => 'gem'
}

package { 'puppet-lint':
  ensure   => 'installed',
  provider => 'gem',
}
