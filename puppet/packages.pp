$packages = ['git', 'curl']

package { $packages:
   ensure => "installed"
}
