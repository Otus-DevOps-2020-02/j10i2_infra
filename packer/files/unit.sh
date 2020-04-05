#!/bin/bash
set -e

# Run Puma
cd /etc/init.d/
touch script.sh
echo "#!/bin/bash" > script.sh
echo "puma -d" >> script.sh
chmod +x script.sh
update-rc.d script.sh defaults

