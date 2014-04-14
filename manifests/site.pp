stage { 'init':
    before => Stage['main']
}

class apt-update {
    exec { 'apt-get update':
        path => ['/usr/bin']
    }
}

class { 'apt-update':
    stage => init
}

$dependencies = [
    'build-essential',
    'subversion',
    'git',
    'gettext',
    'liblua5.1-dev',
    'libsdl1.2-dev',
    'libsigc++-2.0-dev',
    'binutils-dev',
    'python-docutils',
    'python-pygments',
    'nasm',
    'bison',
    'flex',
    'gcc-multilib',
    'llvm-3.0',
    'qemu'
]

package { $dependencies:
    ensure => installed
}

vcsrepo { '/home/vagrant/CRAX/CRAX':
    ensure => present,
    provider => git,
    source => 'https://github.com/SQLab/CRAX.git',
    user => 'vagrant'
}

file { ['/home/vagrant/CRAX', '/home/vagrant/CRAX/build']:
    ensure => directory,
    owner => vagrant,
    group => vagrant
}
