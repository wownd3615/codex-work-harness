# CAD LSP

Use for `.lsp`, `.dcl`, AutoLISP, AutoCAD, BricsCAD, or ZWCAD script work.

Rules:
- Keep code short, but do not remove drawing safety checks.
- Preserve existing command names and user workflow unless asked.
- Preserve existing `.lsp` encoding. Do not blindly save Korean LSP files as UTF-8.
- New Korean `.lsp` files often need ANSI/CP949 depending on the target CAD environment.
- Use `scripts/check-lsp-encoding.ps1 -Path file.lsp` when encoding risk exists.
- Use clear `c:commandName` command functions.
- Minimize global variables and prefix helper names to avoid collisions.
- Check `ssget` nil results.
- Validate entity type before modifying entity data.
- Restore changed system variables.
- Use undo/error handling for drawing-changing commands.
- Do not claim CAD runtime verification unless actually run in CAD.

Report command names, drawing-changing behavior, encoding status, safety guards, and whether CAD was actually run. If not run, provide a short manual test procedure.
