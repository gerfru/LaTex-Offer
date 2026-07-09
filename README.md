# LaTeX-Offer

A modular LaTeX template for creating clean, professional **service quotes and offers** — the kind you send to a client for freelance or consulting work. Change a handful of variables in one config file and get a polished, two-page PDF: a cover letter and an itemised offer with positions, subtotals, and a VAT summary.

> Built out of the recurring need to send tidy, consistent offers without wrestling with a word processor every time.

## Features

- **Single source of truth** — all your data (sender, client, bank details, hourly rate, offer ID) lives in [`config.tex`](config.tex). Edit once, no digging through the document.
- **Two-page layout** — a formal cover letter followed by a detailed offer sheet.
- **Itemised positions** — group line items into positions with automatic subtotals.
- **VAT summary** — net / VAT / gross totals in a clean summary table.
- **Automatic footer** — contact and banking details plus `Page X of Y`, generated in [`structure.tex`](structure.tex).
- **One-command build** on Windows via [`make.ps1`](make.ps1) — compiles, cleans up build artifacts, and opens the PDF.
- **Portable** — compiles with any LaTeX toolchain (Libertine font, A4 geometry, `hyperref`, `fancyhdr`).

## Requirements

- A TeX distribution — e.g. [MiKTeX](https://miktex.org/) (Windows), [TeX Live](https://www.tug.org/texlive/) (cross-platform), or [MacTeX](https://www.tug.org/mactex/) (macOS)
- A LaTeX editor — [VS Code](https://code.visualstudio.com/) with the *LaTeX Workshop* extension is a good choice

## Quick start

1. Clone the repo:
   ```bash
   git clone https://github.com/gerfru/LaTex-Offer.git
   cd LaTex-Offer
   ```
2. Edit [`config.tex`](config.tex) with your details and offer line items.
3. Build the PDF:

   **Windows** (one command — requires an [enabled PowerShell execution policy](https://superuser.com/questions/106360/how-to-enable-execution-of-powershell-scripts)):
   ```powershell
   .\make.ps1
   ```

   **Any platform** (manual compile):
   ```bash
   pdflatex Offer_XX.tex
   ```

## What you configure

Everything you normally change per offer is in [`config.tex`](config.tex):

| Variable | Purpose |
| --- | --- |
| `\Sender`, `\Street`, `\City`, `\Country`, `\Phone`, `\Mail` | Your contact details |
| `\Bankname`, `\BIC`, `\IBAN` | Banking details for the footer |
| `\Company`, `\Companyperson`, `\Companyaddress` | The client you're sending to |
| `\Subject` | What the offer is about |
| `\Offer`, `\Customer`, `\CreateDate` | Offer ID, customer reference, date |
| `\Stdlohn` | Your hourly rate |

The line items and totals live in the offer table inside [`Offer_XX.tex`](Offer_XX.tex).

## Project structure

| File | Role |
| --- | --- |
| [`Offer_XX.tex`](Offer_XX.tex) | Main document — cover letter and offer positions |
| [`config.tex`](config.tex) | All per-offer variables (edit this) |
| [`includes.tex`](includes.tex) | Document class and packages |
| [`structure.tex`](structure.tex) | Footer definition |
| [`make.ps1`](make.ps1) | Windows build script |

The modular split may look like a lot for a short document, but it keeps the content you edit cleanly separated from the layout you don't.

## License

Released under the [MIT License](LICENSE) — free to use, adapt, and share.

---

Questions or ideas? Open an issue or reach out. Best regards, Gerald
