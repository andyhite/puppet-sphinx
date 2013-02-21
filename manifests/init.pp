# Installs sphinx via Homebrew.
#
# Usage:
#
#     include sphinx
class sphinx {
  include homebrew

  homebrew::formula { 'sphinx':
    before => Package['boxen/brews/sphinx']
  }

  package { 'boxen/brews/sphinx':
    ensure  => '2.0.6-boxen1'
  }
}
