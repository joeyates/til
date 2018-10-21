
https://www.passwordstore.org/
https://wiki.archlinux.org/index.php/Pass

Code:

https://git.zx2c4.com/password-store/tree/src/password-store.sh
https://git.zx2c4.com/password-store/plain/src/password-store.sh

# Extensions

export PASSWORD_STORE_ENABLE_EXTENSIONS=true

https://github.com/tadfisher/pass-otp/blob/develop/otp.bash
https://github.com/roddhjav/pass-import/blob/master/import.bash
https://github.com/roddhjav/pass-tomb/blob/master/tomb.bash
https://github.com/roddhjav/pass-update/blob/master/update.bash

# Pass for Other Systems

https://qtpass.org/

# Import from KeepassX

Export from KeepassX as CSV
Check columns are: "Group","Title","Username","Password","URL","Notes"

Check you have a GPG key in gpg2

pass init <GPG key id>

curl -O https://git.zx2c4.com/password-store/plain/contrib/importers/keepass2csv2pass.py
python3 keepass2csv2pass.py keepass.csv
rm keepass.csv

## pass Android

https://github.com/zeapo/Android-Password-Store/wiki/First-time-setup

Install "OpenKeychain"
Install "Password Store"

cat ~/.password-store/.gpg-id

gpg --export-secret-key [the_id] > keys.asc

copy directly to phone via USB cable

add to OpenKeychain

set up Password Store

use hidden storage

set git repo URL

add ssh key
