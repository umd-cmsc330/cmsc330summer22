# Project 0: Setup

Due: June 7, 2022 at 11:59 PM

This project is simply to get your system ready.  You will "submit" this project for a grade.  The good-faith attempt (GFA) rule **does not apply** to this project.

**Start with the [Instructions](#instructions)!**

## Table of Contents

- [Languages and Packages](#languages-and-packages)
- [Instructions](#instructions)
  - [Linux](#linux)
  - [Windows](#windows)
  - [macOS](#macos)
  - [Common Steps](#common-steps-all-oss)
- [Verifying Setup](#verifying-setup)
- [Troubleshooting `gradescope-submit`](#troubleshooting-gradescope-submit)
  - [Incorrect Passwords](#incorrect-passwords)
  - [HTTP Errors](#http-errors)


## Languages and Packages

In this course, we will primarily be using Ruby and OCaml.  Below is a summary of the packages that need to be installed.  You do not need to use these links, they are just for reference or learning more about the languages and/or packages.  You can skip below to the instructions.

- [Git](https://git-scm.com/)
- [Ruby](https://www.ruby-lang.org)
  - [minitest](https://rubygems.org/gems/minitest)
  - [sqlite3](https://rubygems.org/gems/sqlite3)
  - [sinatra](https://rubygems.org/gems/sinatra)
- [OCaml](http://ocaml.org)
  - [OPAM](https://opam.ocaml.org)
  - [OUnit](https://opam.ocaml.org/packages/ounit)
  - [dune](https://opam.ocaml.org/packages/dune)
  - [utop](https://opam.ocaml.org/packages/utop)
- [Rust](https://www.rust-lang.org)
- [SQLite3](https://sqlite.org)
- [Graphviz](http://graphviz.org)

## Instructions

The files in the `project0` folder will be used for the [Verifying Setup](#verifying-setup) section at the bottom.

The following sections will help you install the necessary packages and programs on your operating system. Some steps may take a long time, please be patient. **Read all instructions very carefully.**

The output of each command is important, please pay careful attention to what each one prints.  If you encounter an error message, do not ignore it.  We will be available in office hours to help you get set up if you run into problems. As a general rule, no output means the command executed successfully.

**Please skip to the section below that corresponds with your operating system. There is a lot of jumping.**

### Windows

*This will only work on Windows 10 and newer.  If you are on an older version, you will probably need to set up a Linux VM.*

1. [Install the Windows Subsystem for Linux (WSL)](https://docs.microsoft.com/en-us/windows/wsl/install).
    - There is a link near the top which has manual installation instructions for older versions of windows 10.
    - WSL by default will install Ubuntu linux, which is what we'll use in this class.
      - Make sure you either have the [latest](https://apps.microsoft.com/store/detail/ubuntu/9PDXGNCFSCZV?hl=en-us&gl=US) or [22.04](https://apps.microsoft.com/store/detail/ubuntu-2204-lts/9PN20MSR04DW?hl=en-us&gl=US). Do not have more than one version installed. You can use the windows search bar OR the list of installed apps (start screen?) OR the windows store to see which versions you have installed.
2. Follow the [linux instructions](#linux).

### Linux

These instructions assume you have a Debian-based system (e.g. Ubuntu).  If you have a different distribution, you will have to find and download the corresponding packages in your native package manager.  Note that the packages there may have slightly different names.

1. Firstly, install the basic dependencies:
    - Run `sudo apt update && sudo apt upgrade -y` to update your local package listing
    - Run `sudo apt install -y ruby ruby-dev sqlite3 libsqlite3-dev ocaml opam graphviz libssl-dev pkg-config`
2. Jump to [common steps](#common-steps-all-oss)

### macOS

0. Verify if you're running an older version of macOS. Either click the Apple button in the menubar in the top-left and click "About This Mac", or else run `sw_vers` from the terminal. You will get errors if your macos version is less than 10.15. Try to upgrade your OS if step 2 doesn't work.

1. [Install the Homebrew package manager](https://brew.sh)
    - It will likely ask you to install xcode command line tools. If it does, say yes. You can also install xcode tools manually with `xcode-select --install`
    - xcode tools and homebrew will take 5-10 minutes each. Please be patient.
2. Install the basic dependencies
    - Run `brew install ocaml opam graphviz openssl ruby rust`
    - There will be a caveats section containing warnings about ruby, ruby gems and your PATH. Run the commands the warnings give you (copied below).
      - `echo 'export PATH="/opt/homebrew/opt/ruby/bin:$PATH"' >> ~/.zshrc`
      - `echo 'export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"' >> ~/.zshrc`
    - If installing any of the above packages fails, try installing one by one. So `brew install ocaml`, `brew install opam`, etc.
      - If installing something fails again, try again with `-s`. ie `brew install -s graphviz`
      - If that also fails, you need to upgrade your os.
3. Jump to [common steps](#common-steps-all-oss)

## Common Steps (ALL OS's)

1. Install some Ruby gems. Use `sudo gem ...` if on linux (including wsl).
    - Run `gem install --no-document minitest sqlite3 sinatra`
2. Initialize the OCaml package manager. We use Ocaml 4.12.
    - Run `opam init -a --disable-sandboxing`
    - Run `opam switch 4.12.0`.  If you get an
      error saying that switch is not currently installed, run `opam switch create 4.12.0`. This may take a while, please be patient
    - Run `eval $(opam env)`
    - Ensure you are now on the correct version by running `ocaml -version`
3. Install OCaml packages
    - Run `opam install -y ocamlfind ounit utop dune qcheck`
4. Install gradescope-submit
    - Run `cargo install gradescope-submit`.
5. Add cargo installed programs to your PATH. Depending on the value of SHELL (run `echo $SHELL`), run ONE of the following. Pay attention to the bit at the end
    - `echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.zshrc`
    - `echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc`
6. Clone this repository to your local filesystem.
    - `mkdir -p ~/Documents && cd ~/Documents`
    - `git clone https://github.com/umd-cmsc330/cmsc330summer22`

## Verifying Setup

This is the graded part of this project.  To verify that you have the correct
versions installed, run `ruby test/public/public.rb` in this directory.  You
should not get any errors.  This will create a file called p0.report.  Submit
this file by running `gradescope-submit` in the project folder.  You will have
to enter your credentials the first time, but for future projects you should not
have to.  Alternatively, you can manually submit the file to Gradescope by
uploading the p0.report file to the appropriate assignment.

## Troubleshooting `gradescope-submit`

### Incorrect Passwords

Make sure that the email address and password you entered is of the account
where your CMSC 330 course enrollment shows up. (If you login through "school
credentials" option and don't remember your **Gradescope** password, please
reset it.) Great chances are that people have multiple Gradescope accounts, and
it is suggested to merge them before trying to submit by the program.

### HTTP Errors

Remove the `gradescope-submit` config file by doing
`rm -r ~/.gradescope-submit`. Then, refer to the troubleshooting for incorrect
passwords and try it again.
