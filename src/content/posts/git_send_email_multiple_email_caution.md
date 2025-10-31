---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "A thing you should know if you are using multiple email accounts with `git send-email`"
subtitle: ""
summary: ""
authors: []
tags: ['git', 'git send-email', 'patches']
categories: ['git']
date: 2020-01-06T21:10:05+01:00
lastmod: 2020-01-06T21:10:05+01:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---

In some case, we need to send patches that made by other people instead.  `git
send-email` command can know this situation by itself by comparing the commit
author information and mail sender's information.  In that case, `git
send-email` automatically add `From:` line pointing the real author of the
patch in the body of the mail so that maintainers applying the patches can set
the author information correctly.

For example, if "Alice <alice@abc.com>" has made a commit and "Bob
<bob@abc.com>" formats the commit into a patch file and sends it, `git
send-email` automatically adds `From: Alice <alice@abc.com>` line in the body
of the mail.  And, when a maintainer is applying the patch using `git am`, the
patch is applied with author "Alice <alice@abc.com>".

However, please note that `git send-email` knows the situation by comparing the
author information and the command caller's git user eamil configuration or
given '--from' option only, not considering real smtp email account.

For example, suppose that Alice has two email accounts, `alice@abc.com` and
`alice@def.com`.  And, Alice wants to use `alice@abc.com` as her email address
in the git history, but needs to send her patches using `def.com` SMTP server.
She might use below commands.

```
$ git config sendemail.smtpserver smtp.def.com
$ git config sendemail.smtpuser alice@def.com
$ git config user.email "alice@abc.com"
$ git commit -as -m 'the patch'
$ git format-patch HEAD^
$ git send-email 0001_the_patch.patch
```

Because her git config is saying the `user.email` is `alice@abc.com` and the
patch is authored by `alice@abc.com`, `git send-email` thinks same people is
sending the patch.  Thus, it doesn't add the 'From:' line in the body of the
mail.  Of course, `git send-email` tries to set the `from` of the mail as
`alice@abc.com`, but as the additionally specified 'from' information is
usually (at least gmail does) ignored by the SMTP server, the maintainer will
receive the mail saying author email as 'alice@def.com' only.

Note that `git send-email` considers the email address it _tries_ to use as the
from address, not the final one that SMTP server will use.  Thus, this problem
can be worked around in weird way using the `--from` option of the `git
send-email`.  In the above case, giving `--from "Alice <alice@def.com>"` option
to `git send-email` makes the command to think the sender is not the author
(alice@abc.com) and as a result, it adds the `From:` line in the body.

Also, please note that adding `--from` option does not always add the `From:`
line in the body.  Rather than that, it can even hide the `From:` line you
intended to add, if you give the address that same with the commit's author,
regardless of what SMTP server you use.  For example,

```
$ git config sendemail.smtpserver smtp.def.com
$ git config sendemail.smtpuser alice@def.com
$ git config user.email "alice@abc.com"
$ git commit -as -m 'the patch'
$ git format-patch HEAD^
$ git config user.email "alice@def.com"
$ git send-email --from alice@abc.com 0001_the_patch.patch
```

If the final command had no `--from` option, it would added the From: in-body
line.  However, because it specifies the real author address using `--from`
option, `git send-email` thinks the real author is sending this mail and omits
the `From:` line in the body.
