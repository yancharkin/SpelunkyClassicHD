#!/usr/bin/env python
# -*- coding: utf-8; -*-

import glob
from PIL import Image, ImageFont, ImageDraw

font_size = 48
font_path = glob.glob('*.ttf')[0]

with open('charset', 'r') as charset_file:
    charset = charset_file.read()

font = ImageFont.truetype(font_path, font_size)
char_size = font.getsize("A")
print(f'Character size: {char_size[0]}x{char_size[1]}')
image = Image.new('RGBA', (char_size[0] * (len(charset) - 1), char_size[1]), 0)
draw = ImageDraw.Draw(image)
draw.text((0, 0), charset, font=font)
image.save("charset.png")
