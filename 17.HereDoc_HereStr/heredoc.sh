#!/bin/bash

#Multiline String
cat << EOF
FIRST LINE
SECOND LINE
EOF

myShell="bash"
cat << EOF1 
myShell is ${myShell}
EOF1

#Variables and Command Expansion
cat << EOF2
${myShell}
$(whoami)
EOF2


#Ignore Variable and Command Expansion
cat << "EOF3"
${myShell}
$(whoami)
EOF3

# Escape Character(\)
cat << EOF4
\${myShell}
$(whoami)
EOF4
 
#Piping 
cat << EOF5 | grep 'FIRST'
FIRST LINE
SECOND LINE
EOF5

#Redirect to a file
cat << EOF6 > /tmp/heredoc.txt
FIRST LINE
SECOND LINE
EOF6

if command -v docker 1>/dev/null 2>/dev/null; then 
    cat << EOF7
        Docker is installed 
        Docker path is : $(command -v docker)
EOF7
fi 