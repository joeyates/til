Common Attributes
Conditional Execution Attributes
apt_repository
bash
cron
Deploy Resource
directory
execute
file
gem_package < package
git
group
link
log
package
remote_file
ruby_block
SCM
script
service
subversion
template
user


* docs
Common Attributes
Conditional Execution Attributes
not_if "test -d /PATH"
not_if "test -d /PATH/TO/FILE"
only_if ...
apt_repository
bash
        bash name do
          code bash code
        end
* code defaults to name
See execute
**use 'code' not 'command' **
cron
* command
* user
* minute
* hour
* mailto
* paths
* action: :create, :delete
Deploy Resource
git "/home/user/deployment" do                            
   repository "git@github.com:gitsite/deployment.git"
   revision branch_name
   action :sync
   user "user"
   group "test"
end
subversion
        svn_arguments string


directory
Attributes


* recursive => boolean - equivalent to mkdir -p
execute
Attributes:
* creates pathname - if the file exists, the command is not run


        execute title do
          command command
          creates check_file
          environment({environment_hash})
        end
file
Actions:
* create
* delete
Attributes:
* content: string
gem_package < package
Actions: install*|upgrade|remove|purge
git
See Deploy Resource
group
Actions:
* manage - modify if exists - allows appending members
attributes:
* append - (boolean) append users listed in members or set them as the only group members


link
Actions:
* create
* delete
Create a link:
link destination do
 to source
end
log
Write to log file:
        log message
Specify a level:
        log message do
          level :info|:war|:debug|:error
        end
Inside actions, use Chef::Log.info
package
Attributes:
* action: :install(*)|:upgrade|:remove|:purge
* version
remote_file
* source
ruby_block
SCM
See Deploy Resource
script
Subtypes:
* bash
* ruby
* ...
Attributes:
* code
service


subversion
See Deploy Resource
template
Finding templates
Actions:
* action :create_if_missing
* action :create
Attributes:
* source - source file name (full name, searched for in all default template directories)
* variables({:name1 => value1, ...})
* backup - false|number
user
Actions:
* create (default)
* delete
* modify
Attributes:
* username - defaults to resource name
* comment - GECOS comment field
* home - path to home directory
* shell - path to shell executable
* system => true
* password - the crypted hash of the password
Make a crypted hash:
        echo 'PASSWORD' | mkpasswd -m sha-512 -s