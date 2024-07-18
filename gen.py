import os
import subprocess
import re

def load_text(path):
    try:
        with open(path, encoding='utf-8') as f:
            return f.read()
    except FileNotFoundError:
        pass

def load_lines(path):
    with open(path, encoding='utf-8') as f:
        return list(f)

base = os.path.dirname(__file__)

subprocess.run(['python', 'D:\dev\pbat\pbat\compile.py', base])

lines = load_lines(os.path.join(base, "readme.in.md"))

for i, line in enumerate(lines):
    m = re.match('%([a-z0-9_]+)', line, re.IGNORECASE)
    if m:
        n = m.group(1)
        pbat_name = os.path.join(base, n + '.pbat')
        bat_name = os.path.join(base, n + '.bat')
        yml_name = os.path.join(base, '.github', 'workflows', n + '.yml')
        
        pbat_text = load_text(pbat_name)
        bat_text = load_text(bat_name)
        yml_text = load_text(yml_name)

        if n == 'dep1':
            bat_text = None

        cont = []
        if pbat_text:
            cont.append("#### " + os.path.basename(pbat_name) + " (source)\n```\n" + pbat_text + "\n```\n\n")
        if bat_text:
            cont.append("#### " + os.path.basename(bat_name) + " (generated)\n```shell\n" + bat_text + "\n```\n\n")
        if yml_text:
            cont.append("#### " + os.path.basename(yml_name) + " (generated)\n```yaml\n" + yml_text + "\n```\n\n")
        lines[i] = "".join(cont)

with open(os.path.join(base, "readme.md"), "w", encoding='utf-8') as f:
    f.write("".join(lines))
