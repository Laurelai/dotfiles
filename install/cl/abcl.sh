#!/bin/sh
wget http://common-lisp.net/project/armedbear/releases/0.22.0/abcl-bin-0.22.0.tar.gz
tar -xzvf abcl-bin-0.22.0.tar.gz
mv abcl-bin-0.22.0/abcl.jar /usr/share/java
rm -rf abcl-bin*
echo "#!/bin/sh" > /usr/bin/abcl
echo "java -jar /usr/share/java/abcl.jar" >> /usr/bin/abcl
chmod 755 /usr/bin/abcl
