# Bug-Finding User Test

## Getting Started

Clone this repository to your machine:

```
git clone <repo-url>
cd user-tests-bugged-repo/code
```

## Running the Tools

This test uses **two versions** of Inspectify — an old generator and a new generator. Run both at the same time in separate terminals so you can compare them side by side.

### New generator (opens at http://localhost:3000)

**Windows (PowerShell):**
```powershell
.\inspectify.ps1 --open
```

**macOS / Linux:**
```bash
./inspectify.sh --open
```

### Old generator (opens at http://localhost:9001)

**Windows (PowerShell):**
```powershell
.\inspectify-old.ps1 --open
```

**macOS / Linux:**
```bash
./inspectify-old.sh --open
```

The first run of each script will automatically download the required binaries.

## What the Test Is About

This is a bug-finding study. The implementation you are working with contains **10 intentional bugs**:

- **5 bugs in the Compiler**
- **5 bugs in the Interpreter**

Your task is to find as many bugs as you can using both tools. Start with the **old generator**, spend around 7-8 minutes trying to find bugs, then switch to the **new generator** for another 7-8 minutes.

Use the generator in each tool to produce test programs and observe how the compiler and interpreter handle them — look for unexpected or incorrect behaviour in the output graph or execution trace.

## Finishing the Test

Once you have finished your investigation, submit your findings by filling out the Google Form linked below:

[Once you have finished please fill this short google form](<https://docs.google.com/forms/d/e/1FAIpQLSe0puoe9WEm5WoetL3Zm2fpzn_3MnpkiLTMbR2sd1xQgfM9lA/viewform?usp=sharing&ouid=110599485362124001198>)

Thank you for participating!
