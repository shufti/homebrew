require 'formula'

class Sbt < Formula
  url "http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/0.10.0/sbt-launch.jar"
  homepage 'http://github.com/harrah/xsbt/'
  version '0.10.0'
  md5 '9d8ab145a3c4d6d5ee9f76cae6082308'

  def install
    (bin+'sbt').write <<-EOS.undent
      #!/bin/sh
      test -f ~/.sbtconfig && . ~/.sbtconfig
      exec java -Xmx512M ${SBT_OPTS} -jar #{libexec}/sbt-launch.jar "$@"
    EOS

    libexec.install Dir['*']
  end

  def caveats;  <<-EOS.undent
    You can use $SBT_OPTS to pass additional JVM options to SBT.
    For convenience, this can specified in `~/.sbtconfig`.

    For example:
        SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
    EOS
  end
end
