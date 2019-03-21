# django.contrib.auth

Tables:

* `auth_user`
* `auth_groups`

## django.contrib.auth.models.User
Methods:

* `get_profile()` - `AUTH_PROFILE_MODULE` should be set to 'app_name.model_name'

## Cookbook
Create:

```python
user = User.objects.create_user('joe', 'jy@gmail.com', 'password')
```

Change password:
```python
from django.contrib.auth.models import User
user = User.objects.get(username = '...')
user.set_password('new password')
user.save()
```

Check password:
```python
import hashlib
algorithm, salt, password_hash = password.split('$')
if algorithm == 'md5':
  hash = hashlib.md5(salt + supplied_password)
elif algorithm == 'sha1':
  hash = hashlib.sha1(salt + supplied_password)
else:
  raise ValueError('Unknown algorithm: %s' % algorithm)
return hash.hexdigest() == password_hash
```

## django.contrib.auth.decorators

* `login_required`

# django.core.handlers

## django.core.handlers.wsgi.WSGIRequest(django.http.HttpRequest)

Methods:

* `get_full_path()`

# django.db

## django.db.models
Fields

* DecimalField

# django.http

## django.http.shortcuts

* `render_to_reponse`

## django.http.HttpRequest

Attributes:
* `method`
* `path`
* `META` - hash of environment

## django.http.HttpResponse

Attributes:

* `content`
* `status_code`
* `GET`
* `POST`

Methods:

## django.http.HttpResponseRedirect
## django.http.HttpResponseNotFound
## django.http.HttpResponseBadRequest

# django.shortcuts

Static functions:

* `render_to_response(template, data_dictionary, context_instance)`

# django.test.client

## django.test.client.Client

* `get(url[, data = {})`
* `post(url[, data = {})`
