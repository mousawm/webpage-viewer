#!/usr/bin/env python3
"""Find or rewrite the add-in server address stored inside a .pptx.

A .pptx remembers where its add-in came from. If that server has moved, PowerPoint
shows "This add-in is no longer available from the following server" before the
add-in itself can run. This script lists those stored addresses and can replace them.

Usage:
  python retarget_pptx.py deck.pptx --find cloud.mousahome.uk
  python retarget_pptx.py deck.pptx --find cloud.mousahome.uk \
      --replace "OLD_TEXT=NEW_TEXT" [--replace ...] --out deck-fixed.pptx

Run --find first, then copy the exact strings it prints into --replace.
The original file is never modified.
"""
import argparse
import re
import sys
import zipfile


def parts_with_text(zin):
    for info in zin.infolist():
        if info.filename.lower().endswith((".xml", ".rels")):
            yield info, zin.read(info.filename)


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pptx")
    ap.add_argument("--find", required=True, help="text to look for, e.g. the old host name")
    ap.add_argument("--replace", action="append", default=[], metavar="OLD=NEW",
                    help="exact text to replace; repeat for several")
    ap.add_argument("--out", help="output file (required with --replace)")
    a = ap.parse_args()

    needle = a.find.encode()
    ctx = re.compile(rb".{0,80}" + re.escape(needle) + rb".{0,120}", re.S)

    with zipfile.ZipFile(a.pptx) as zin:
        hits = 0
        for info, data in parts_with_text(zin):
            for m in ctx.finditer(data):
                hits += 1
                print(f"[{info.filename}] ...{m.group().decode('utf-8', 'replace')}...")
        print(f"\n{hits} occurrence(s) of {a.find!r}.")
        if not a.replace:
            return 0
        if not a.out:
            sys.exit("--out is required with --replace")
        pairs = []
        for r in a.replace:
            if "=" not in r:
                sys.exit(f"--replace needs OLD=NEW, got {r!r}")
            old, new = r.split("=", 1)
            pairs.append((old.encode(), new.encode()))
        changed = 0
        with zipfile.ZipFile(a.out, "w") as zout:
            for info in zin.infolist():
                data = zin.read(info.filename)
                if info.filename.lower().endswith((".xml", ".rels")):
                    new_data = data
                    for old, new in pairs:
                        new_data = new_data.replace(old, new)
                    if new_data != data:
                        changed += 1
                        print(f"rewrote {info.filename}")
                    data = new_data
                zout.writestr(info, data)
        print(f"Wrote {a.out} ({changed} part(s) changed).")
        if not changed:
            print("Nothing matched your --replace text; the output is an unchanged copy.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
