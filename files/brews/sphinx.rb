require 'formula'

class Libstemmer < Formula
  head 'http://snowball.tartarus.org/dist/libstemmer_c.tgz'
  homepage 'http://snowball.tartarus.org/'
end

class Sphinx < Formula
  homepage 'http://www.sphinxsearch.com'
  url 'http://sphinxsearch.com/files/sphinx-2.0.6-release.tar.gz'
  sha1 'fe1b990052f961a100adba197abe806a3c1b70dc'

  version '2.0.6-boxen1'

  head 'http://sphinxsearch.googlecode.com/svn/trunk/'

  def install
    Libstemmer.new.brew { (buildpath/'libstemmer_c').install Dir['*'] }

    args = %W[--prefix=#{prefix}
              --disable-dependency-tracking
              --localstatedir=#{var}]

    args << "--with-libstemmer"

    if which('mysql_config')
      args << "--with-mysql"
    else
      args << "--without-mysql"
    end

    args << "--with-pgsql" if which('pg_config')

    system "./configure", *args
    system "make install"
  end
end
