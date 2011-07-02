#include <stdlib.h>
#include <string.h>
#include "mkdio.h"

MMIOT *
arc_mkd_string(const char *buf, mkd_flag_t flags)
{
  MMIOT* doc;

  if ((doc = mkd_string(buf, strlen(buf), flags)) == 0) {
    perror(buf);
    exit(1);
  }

  return doc;
}

void
arc_mkd_cleanup(MMIOT *doc)
{
  mkd_cleanup(doc);
}

char *
arc_markdown(MMIOT *doc, mkd_flag_t flags)
{
  char *out;

  mkd_with_html5_tags();
  return mkd_compile(doc, flags) && mkd_document(doc, &out) != EOF ? out : "";
}
