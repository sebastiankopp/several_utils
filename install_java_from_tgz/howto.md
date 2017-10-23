# Installing Java from a tar.gz archive on linux

1. After downloading the archive, unpack it to your destionation directory. Ensure you have sufficient permissions (as root or via sudo)

   `tar xfz <tgz-archive> -C <destination-dir>`
2. Set your `JAVA_HOME` directory to the new value in your `/etc/bash.bashrc`. Make sure that there is no collision with other initialization scripts.
3. Leave your current shell(s)
4. Open a normal shell as well as a root shell again and check that your `JAVA_HOME` is set correctly.
5. Adapt the list of jdk-/jre-related programs (in `$JAVA_HOME/bin`) in the `postupdatejava.sh` script and execute it with root permissions.
6. Check if at least `java` has the correct version

   `java -version`
