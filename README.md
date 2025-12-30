

> Configuration files for my **WSL 2 (Ubuntu 24.04)** development environment.
> Optimized for **Java Backend Engineering**, **Microservices**, and **Vim** workflows.

## 🛠 Tech Stack

* **OS:** Windows 11 + WSL 2 (Ubuntu 24.04 LTS)
* **Shell:** Zsh + Oh My Zsh (Theme: `agnoster` / Font: `FiraCode Nerd Font`)
* **Editors:**
    * **Vim:** Neovim/Vim with `vim-plug` (Dracula Theme).
    * **IntelliJ IDEA:** With `IdeaVim` (Vim emulation).
* **Package Managers:** `apt`, `sdkman` (Java), `nvm` (Node), `snap`.
* **DevOps:** Docker (Native), Docker Compose, LocalStack, AWS CLI.
* **Tools:** LazyGit, Btop, HTTPie, Ngrok.

## 📂 Repository Structure

```text
~/dotfiles/
├── .zshrc        # Zsh configuration (Aliases, Plugins)
├── .vimrc        # Vim configuration (Plugins, Keymaps)
├── .ideavimrc    # IntelliJ IdeaVim configuration
└── README.md     # This file

```

## 🚀 Installation (Fresh Setup)

### 1. Prerequisites

Install `zsh`, `git`, and `curl` on the new machine:

```bash
sudo apt update && sudo apt install zsh git curl -y

```

### 2. Clone Repository

```bash
git clone [https://github.com/baorlys/dotfiles.git](https://github.com/baorlys/dotfiles.git) ~/dotfiles

```

### 3. Create Symlinks (The Magic Step)

Link the config files from this repo to the home directory:

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc

```

### 4. Install Dependencies

* **Oh My Zsh:**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


* **Vim Plug:**
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs [https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim](https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)

```


* **SDKMAN (Java):**
```bash
curl -s "[https://get.sdkman.io](https://get.sdkman.io)" | bash

```



---

## ⌨️ Key Mappings (Cheatsheet)

### Vim (`.vimrc`) & IntelliJ (`.ideavimrc`)

**Leader Key:** `SPACE`

| Shortcut | Action | Context |
| --- | --- | --- |
| `<Space> + e` | Toggle File Explorer (NERDTree / Project View) | Vim / IntelliJ |
| `<Space> + f` | Find Files (FZF / Goto File) | Vim / IntelliJ |
| `<Space> + r` | Rename Element (Refactor) | IntelliJ Only |
| `<Space> + g` | Generate Code (Getter/Setter) | IntelliJ Only |
| `<Space> + h` | Clear Search Highlight | Vim / IntelliJ |
| `gcc` | Comment/Uncomment Line | Vim / IntelliJ |
| `cs"'` | Change Surround `"` to `'` | Vim / IntelliJ |

---

## ⚡ Custom Aliases

Defined in `.zshrc` for productivity.

### System & Utils

| Alias | Command | Description |
| --- | --- | --- |
| `update-all` | `apt update... && sdk update...` | Update EVERYTHING (System + Tools) |
| `zshconfig` | `vim ~/.zshrc` | Edit shell config |
| `open` | `explorer.exe .` | Open current folder in Windows Explorer |
| `myip` | `hostname -I` | Show local IP |
| `port` | `lsof -i ...` | Check who is using a port (e.g., `port 8080`) |

### Java & Maven

| Alias | Command | Description |
| --- | --- | --- |
| `mci` | `mvn clean install -DskipTests` | Fast build |
| `mcit` | `mvn clean install` | Build with tests |
| `sbrun` | `mvn spring-boot:run` | Run Spring Boot app |

### Git & Docker

| Alias | Command | Description |
| --- | --- | --- |
| `gs`, `ga`, `gc` | `git status`, `add`, `commit` | Git shortcuts |
| `dps` | `docker ps --format...` | Prettier container list |
| `dc` | `docker compose` | Docker Compose shorthand |
| `dstop` | `docker stop $(docker ps -a -q)` | Stop ALL containers |

---

## 🏗 Standard Project Structure

Keep the `~` directory clean. Always clone projects here:

* `~/projects/work/` - Company projects (CIF System, etc.)
* `~/projects/personal/` - Portfolio, Blogs.
* `~/projects/learning/` - Tutorials, R&D.
* `~/projects/infrastructure/` - `docker-compose.yml` for local env (Postgres, Redis, LocalStack).

---

> **Author:** Baorlys
> **Role:** Backend Engineer
