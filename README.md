# 🔧 My Dotfiles & Dev Environment

> Configuration files for my **WSL 2 (Ubuntu 24.04)** development environment.
> Optimized for **Java Backend Engineering**, **Microservices**, and **Neovim** workflows.

## 🛠 Tech Stack

* **OS:** Windows 11 + WSL 2 (Ubuntu 24.04 LTS)
* **Shell:** Zsh + Oh My Zsh (Theme: `agnoster` / Font: `FiraCode Nerd Font`)
* **Editors:**
    * **Neovim:** Main editor (configured via `init.vim` & `vim-plug`).
    * **IntelliJ IDEA:** With `IdeaVim` (Vim emulation).
* **Package Managers:** `apt`, `sdkman` (Java), `nvm` (Node), `snap`.
* **DevOps:** Docker (Native), Docker Compose, LocalStack, AWS CLI.
* **Tools:** LazyGit, Btop, HTTPie, Ngrok.

## 📂 Repository Structure

```text
~/dotfiles/
├── zshrc          # Zsh configuration (Aliases, Plugins)
├── vimrc          # Vim/Neovim shared configuration
├── ideavimrc      # IntelliJ IdeaVim configuration
└── README.md      # This file

```

---

## 🚀 Installation (Fresh Setup)

Follow these steps exactly to avoid errors.

### 1. Prerequisites

Install core packages:

```bash
sudo apt update && sudo apt install zsh git curl neovim -y

```

### 2. Clone Repository

```bash
git clone https://github.com/baorlys/dotfiles.git ~/dotfiles

```

### 3. Install Frameworks & Dependencies (Do this BEFORE linking)

**A. Install Oh My Zsh:**

```bash
sh -c "$(curl -fsSL [https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh](https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh))"

```

*(Note: If it asks to switch shell, type 'Y'. If it enters a new shell, type `exit` to continue).*

**B. Install Zsh Plugins (Fixes "plugin not found" error):**

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

**C. Install Vim-Plug (For Neovim):**

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

```

**D. Install SDKMAN (Java):**

```bash
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

```

### 4. Create Symlinks (The Magic Step)

Overwrite default configs with my dotfiles:

```bash
# 1. Prepare Neovim folder
mkdir -p ~/.config/nvim

# 2. Link Zsh
rm -f ~/.zshrc
ln -sf ~/dotfiles/zshrc ~/.zshrc

# 3. Link Neovim (Use vimrc for init.vim)
rm -f ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vimrc ~/.config/nvim/init.vim

# 4. Link IntelliJ
rm -f ~/.ideavimrc
ln -sf ~/dotfiles/ideavimrc ~/.ideavimrc

```

### 5. Finalize Setup

1. **Install Neovim Plugins:**
Open terminal, type `nvim`. Ignore errors, press Enter, then type:
`:PlugInstall`
Restart Neovim.
2. **Reload Shell:**
```bash
source ~/.zshrc

```



---

## ⌨️ Key Mappings (Cheatsheet)

### Vim (`vimrc`) & IntelliJ (`ideavimrc`)

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
| `vimconfig` | `vim ~/.config/nvim/init.vim` | Edit vim config |
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

```

```
