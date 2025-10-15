---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Setting Git for email send"
subtitle: ""
summary: ""
authors: []
tags: ["git", "git-email", "patch", "submission"]
categories: ["git"]
date: 2019-12-28T09:58:49+01:00
lastmod: 2019-12-28T09:58:49+01:00
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

Many communities are using Github nowadays, but some communities still use
mailing list based development style.  The Linux kernel community would be a
good example.  In the style, all major communications are made by email only.
Patches are submitted to the maintainers and one more open mailing lists as a
mail.
Reviews are also made as replies to the mail.

Because some email clients can distort the original content for so-called
``rich user experience'' (e.g., changing tabs to spaces or inserting html
code), patch submitting people should aware of it and try to keep their mail
content to be plain.
This can be awful or even impossible on some mail clients.

Git can help formatting and sending your patch files using SMTP.
This post describes how you can use git to send email.


Package Install
===============

If you installed git using the package manager, you should install not only
`git` package, but also `git-email` package.  If you are using `apt` package
manager, simply type
``$ sudo apt install git-email`` on the terminal.


SMTP Setting
============

Then, set smtp server configurations for you.  Of course, you should enable the
smtp configuration on your mail accout first.  If your mail account is ready
for the smtp, now you should let git to know how it can access to your mail
account using 'git config'.  If you want to use your Gmail account, it will be
as below:

```
$ git config --global sendemail.smtpserver smtp.gmail.com
$ git config --global sendemail.smtpserverport 587
$ git config --global sendemail.smtpencryption tls
$ git config --global sendemail.smtpuser <your-gmail-account@gmail.com>
```

You can also set the mail account password as below, but I will recommend you
to not store your password in that way, because it can harm your security.

```
$ git config --global sendemail.smtppass <your_password>
```


Send Mail
=========

Sending mail is so easy.  You should first save your mail message in a file.
This could be patch file, which can also easily formatted using `git
format-patch`.  After that, make sure you know who you want your mail to be
sent to.
Now, just type below command.

```
$ git send-email --to <recipients> <the file containing your message>
```

If you have not set your password (again, I recommend you do not save your
password), this command will ask your password.  Just type it on the prompt.
Then, your mail will delivered to the recipients you specified.

For more detail, `$ git help send-email`.


Conclusion
==========

Summarised how you can send email using Git.  Install packages, set SMTP, write
your mail in a plain file, and `git send-email`.  That's it. :)
