# Models

## Definition

An integer primary key is created if none is supplied.

## models.Model

Create a Foo:

```python
foo = Foo(attrib = value)
foo.save()
```

## models.Manager

Used to access model objects.

## Migrations

http://south.aeracode.org/docs/databaseapi.html

Run pending migrations:
```python
./manage.py migrate application
```

Generate migration(s) for an existing database based on changes:

```python
./manage.py schemamigration {application} --auto {migration_name}
```

## Introspection

List fields:
```python
[n.name for n in {Model}._meta.fields]
```

# Querysets

## Conditions

Positive filter

```python
.filter(field=value)
```

Negative filter:
```python
.exclude()
```

## Operators
```python
field__gt=value
```
full match:
```python
field=value
```
accept None:
```python
field__exact=value or None
```
value in list:
```python
field__in=list
```
case insensitive full match:
```python
field__iexact=value
```
partial match (case sensitive):
```python
field__contains=value
```
partial match, case insensitive:
```python
field__icontains=value
```
starts with:
```python
field__startswith=value
```
OR operator:
```python
from django.db.models import Q
Item.objects.filter(Q(creator=owner) | Q(moderated=False))
```

See [Q Objects][q-objects].

[q-objects]: https://docs.djangoproject.com/en/dev/topics/db/queries/#complex-lookups-with-q-objects

## Includes
```python
.select_related(related)
```

## Productions
Get all results:
```python
.all()
```
Count the results:
```python
.count()
```
Get a single item:
```python
.get(attribute=value)
```
Get an EmptyQuerySet:
```python
.none()
```

## Dereference
First item:
```python
Model.objects.order_by("id").all()[:1][0]
```
Last item:
```python
Model.objects.order_by("id").all().reverse()[:1][0]
```

# Cookbook

### Reset psql db after error

```python
from django.db import connection
connection._rollback()
```
