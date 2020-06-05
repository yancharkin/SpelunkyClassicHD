#!/usr/bin/env python
# -*- coding: utf-8; -*-

base_charset = ' !"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ'
new_line_chars = ('\n', '\r', '\r\n')
other_unwanted_chars = ('{', '}')

additional_chars = ""
with open('text.json', 'r') as text_file, open('charset', 'w') as charset_file:
    for char in sorted(list(set(text_file.read()))):
        if (char != " ") and (char not in base_charset) and \
                (char not in new_line_chars) and (char not in other_unwanted_chars):
            additional_chars += char
    new_charset = base_charset + additional_chars
    charset_file.write(new_charset)
