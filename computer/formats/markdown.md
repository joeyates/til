# References

* [Daring Fireball Spec][daring_fireball_spec]
* GitHub flavoured

[daring_fireball_spec] http://daringfireball.net/projects/markdown/syntax

# Text Formatting

* `*` | `_` - an &lt;em&gt; tag (typically italic)

    That's *interesting*.

* `**` | `__` - a &lt;strong&gt; tag (tyically bold)

    That's **wonderful**.

# Paragraph Formatting

`*` - bulleted list

* an item
* another

# Links

Reference style

```markdown
[Link text][reference id]

[reference id]: URL "Optional title"
```

Within a document:

```markdown
[Link text](#target_id)

<h1 id="target_id">Foo</h1>
```

# Tables (GFM)

```
| Header1 | Header2 |
|---------|---------|
| foo     | bar     |
```

produces

| Header1 | Header2 |
|---------|---------|
| foo     | bar     |

# Key

* GFM - GitHub flavored markdown

# References

* http://daringfireball.net/projects/markdown/syntax
* https://help.github.com/articles/github-flavored-markdown
