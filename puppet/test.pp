# Basic Archlinux tests
# run with puppet apply -v test.pp after installation
#
class test {

  # Test user creatation, check this hash is set in /etc/shadow
  user{ 'foo':
    ensure   => present,
    password => '1234567890',
  }

  # Test autorequire by adding a User
  file { '/home/foo':
    ensure => directory,
    owner  => 'foo',
    mode   => 0700,
  }

  # Check symlinks work
  file { '/home/foo/.bashrc':
    ensure => link,
    target => '/etc/skel/.bashrc',
    owner  => 'foo',
  }

}

include test
