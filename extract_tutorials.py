#!/usr/bin/env python2.7
# encoding: utf-8
from __future__ import print_function
import re


def read_template(filename):
    with open(filename) as html:
        return html.read()


def read_tutorial_content(lines, tutorial_name):
    is_end = re.compile(
        r'\s*<!-- Tutorial End:\s*{}\s*-->'.format(tutorial_name))
    content = ''
    for line in lines:
        if is_end.match(line):
            return content
        content += line


def dump_tutorial(lines, tutorial_name, filename=''):
    template = read_template('tutorial_template.html')
    content = read_tutorial_content(lines, tutorial_name)
    if not filename:
        filename = 'tutorials/{}.html'.format(
            tutorial_name.strip().lower().replace(' ', '_'))
    with open(filename, 'w') as out:
        html = template.replace('    {{ content }}', content)
        out.write(html)


def main():
    is_start = re.compile(r'\s+<!-- Tutorial Start: (.+)-->')
    with open('index.html') as lines:
        for line in lines:
            m = is_start.match(line)
            if m:
                tutorial_name = m.group(1)
                print('Extracting Tutorial: ', tutorial_name)
                dump_tutorial(lines, tutorial_name)


if __name__ == '__main__':
    main()
