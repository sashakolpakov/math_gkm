# Retained execution diagnostic

After the focused tests passed, a static source comparison was attempted through
`/opt/homebrew/bin/python3 -` with a zsh heredoc. The shell failed before Python
ran: `zsh:1: can't create temp file for here document: operation not permitted`
(exit 1). No comparison output was created and no source was changed by that
command. The intended comparison is saved verbatim in substance as
review_sources.py and run explicitly from the workspace, avoiding shell-managed
temporary files. This is an environment/command failure, not a failed protocol
test. No sandbox escalation or forbidden temporary-directory access was used.

A later read-only `rg` lookup included the nonexistent machinery/lean.py along
with six actual source paths. It returned matches from the actual files and exit
2 for that missing path. It was an exploratory filename error, not a test run;
no files were changed. Real Lean execution paths are in protocol.py, trust.py,
study_transfer.py and completion.py and remain unchanged.
