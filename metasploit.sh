#! /data/data/com.termux/files/usr/bin/bash

# Hapus Folder Lama jika ada
temukan $ HOME -nama " metasploit * " -type d -exec rm -rf {} \;


cwd = $ ( pwd )
msfvar = 4.17.40
msfpath = ' /data/data/com.termux/files/home '

pembaruan apt
apt install -y autoconf bison clang coreutils curl findutils git apr apr-util libffi-dev libgmp-dev libpcap-dev postgresql-dev readline-dev libsqlite-dev openssl-dev libtool libxml2-dev libxslt-dev pg-dev buat ruby-dev libgrpc-dev termux-tools ncurses-utils ncurses unzip zip tar postgresql termux-elf-cleaner
# Banyak ponsel yang mengklaim libxml2 tidak ditemukan kesalahan
ln -sf $ PREFIX / include / libxml2 / libxml $ PREFIX / include /

cd  $ msfpath
curl -LO https://github.com/rapid7/metasploit-framework/archive/ $ msfvar .tar.gz

tar -xf $ msfpath / $ msfvar .tar.gz
mv $ msfpath / metasploit-framework- $ msfvar  $ msfpath / metasploit-framework
cd  $ msfpath / metasploit-framework
sed ' / rbnacl / d ' -i Gemfile.lock
sed ' / rbnacl / d ' -i metasploit-framework.gemspec
permata instal bundler

isNokogiri = $ ( daftar permata nokogiri -i )

sed ' s | nokogiri (1. *) | nokogiri (1.8.0) | g ' -i Gemfile.lock

if [ $ isNokogiri  ==  " false " ] ;
kemudian
      gem install nokogiri -v ' 1.8.0 ' - --use-system-libraries
lain
	echo  " nokogiri sudah terpasang "
fi

cd  $ msfpath / metasploit-framework
pembaruan permata --sistem
bundel instal -j5

gema  " Permata terpasang "
$ PREFIX / bin / find -type f -executable -exec termux-fix-shebang \ {\}  \;
rm ./modules/auxiliary/gather/http_pdf_authors.rb

# ln -sf $ msfpath / metasploit-framework / msfconsole /data/data/com.termux/files/usr/bin/
# ln -sf $ msfpath / metasploit-framework / msfvenom /data/data/com.termux/files/usr/bin/

termux-elf-cleaner /data/data/com.termux/files/usr/lib/ruby/gems/2.6.0/gems/pg-0.20.0/lib/pg_ext.so
echo  " Membuat basis data "

cd  $ msfpath / metasploit-framework / config

curl -LO https://raw.githubusercontent.com/Hax4us/Metasploit_termux/master/database.yml


mkdir -p $ PREFIX / var / lib / postgresql
initdb $ PREFIX / var / lib / postgresql

pg_ctl -D $ PREFIX / var / lib / postgresql mulai
buat pengguna msf
dibuatb msf_database

rm $ msfpath / $ msfvar .tar.gz

cd  $ {PREFIX} / bin && curl -LO https://hax4us.github.io/files/msfconsole && chmod + x msfconsole
ln -sf $ ( yang msfconsole )  $ PREFIX / bin / msfvenom

gema  " Anda dapat langsung menggunakan msfvenom atau msfconsole daripada ./msfvenom atau ./msfconsole. "