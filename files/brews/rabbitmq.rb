require 'formula'

class Rabbitmq < Formula
  homepage 'http://rabbitmq.org/'
  version '3.2.4-boxen1'
  url "https://www.rabbitmq.com/releases/rabbitmq-server/v3.6.4/rabbitmq-server-generic-unix-3.6.4.tar.xz"
  sha256 "de2ff4b540063826594ab18f5e662917ccbfa75dc0b517db68e4a1c3baf47222"

  depends_on 'erlang'

  def install
    # Install the base files
    prefix.install Dir['*']

    # Replace the SYS_PREFIX for things like rabbitmq-plugins
    inreplace((sbin + 'rabbitmq-defaults'), 'SYS_PREFIX=${RABBITMQ_HOME}', "SYS_PREFIX=#{HOMEBREW_PREFIX}")

    # Set the RABBITMQ_HOME in rabbitmq-env
    inreplace((sbin + 'rabbitmq-env'), 'RABBITMQ_HOME="${SCRIPT_DIR}/.."', "RABBITMQ_HOME=#{prefix}")
  end
end
