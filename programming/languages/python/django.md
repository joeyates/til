# manage.py
    ./manage.py command [options]
* runserver - run web server
* shell - start interactive shell
* syncdb - create database tables (Create the database tables for all apps in INSTALLED_APPS whose tables haven't already been created, except those which use migrations.)
* migrate - run pending migrations
* datamigration - create a template for data migration
* dbshell
* dbutil - ??
* dumpdata application --format=[json|yaml]
* schemamigration app --initial - creates all migrations for the given app
* schemamigration app --auto migration_name - generate a migration based on changes to models

## django-extensions
http://packages.python.org/django-extensions/index.html
graph_models
./manage.py graph_models app_names | dot -Tpng -ofilename.png
dependency: graphviz
shell_plus
./manage.py show_urls
Help
http://djangosnippets.org/

# Models
(see separate doc)
# Routing
urls.py
Redirect
redirect( 'route-name', object )
# Views
views.py
request
method
META
REQUEST (dict)
GET
POST
# Forms
Methods:
is_valid()
[field_name] -> a field
Attributes:
errors -> { 'field1': ['error1', ....], ...}
Form Fields
Subclasses:
CharField
for textarea, use widget=forms.Texarea
BooleanField
RangeField
ImageField
ChoiceField
FileField
cleaned_data[name] -> InMemoryUploadedFile:
Attributes:
name
Widgets/Form Inputs
widget=
TextInput

## Templates

## Tags
{% for item in list %}...{% endfor %}
{% for key, value in dict.items %}...{% endfor %}
Filters
| join: "joiner"
| length
list|random
|default:"value"
Email
EmailMessage
mail_admins

## Testing
docs
new db is created production_database_name_test
db user must have db create privs
django.test.client
Methods:
get
post(path, data={})
# Cookbook
## Svuotare il cache
from django.core.cache import cache
For Memcached
    cache._cache.flush_all()

## Create a csrf meta tag
    <meta name="csrfmiddlewaretoken" content="{{ csrf_token }}" />
