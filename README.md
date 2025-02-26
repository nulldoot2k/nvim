Neovim Version Lazy
---

Neovim là một trình soạn thảo văn bản mạnh mẽ và linh hoạt, là phiên bản nâng cấp của Vim, được phát triển với mục tiêu tăng cường hiệu suất và mở rộng khả năng tùy chỉnh.

Cấu hình Neovim bằng Lua cho phép chỉnh và mở rộng trình soạn thảo của mình theo cách linh hoạt hơn. Lua là một ngôn ngữ lập trình nhúng nhẹ, dễ học và mạnh mẽ, được sử dụng để định nghĩa các hành vi và tùy chỉnh Neovim.

## Directory structure

```bash
~/.config/nvim/
├── init.lua ➡️ Tệp chính để cấu hình NeoVim
├── lazy-lock.json ➡️ Tệp khóa dùng để tải các plugin theo yêu cầu (tùy chọn).
├── lua/
    ├── keymaps.lua ➡️ Định nghĩa các phím tắt và ánh xạ keyboard.
    ├── options.lua ➡️ Định nghĩa các tùy chọn cấu hình chung.
│   ├── plugins ➡️ Thư mục chứa các tệp Lua cấu hình cho các plugin.
```

## Function & Mode

`Normal Mode (n)`: Đây là chế độ mặc định khi bạn khởi động NeoVim hoặc thoát khỏi các chế độ khác. Trong chế độ này, có thể di chuyển con trỏ, thực hiện các lệnh, chỉnh sửa nội dung và tương tác với tệp tin.

`Insert Mode (i)`: Chế độ Insert cho phép nhập dữ liệu và chỉnh sửa nội dung của tệp tin. Khi ở trong chế độ này, các phím bạn ấn sẽ được hiểu là nhập liệu thay vì các lệnh.

`Visual Mode (v)`: Chế độ Visual cho phép chọn văn bản trong tệp tin để thực hiện các thao tác như copy, cut, paste hoặc áp dụng các lệnh cho vùng đã chọn.

`Command Line Mode (:)`: Chế độ Command Line cho phép nhập các lệnh NeoVim trực tiếp từ dòng lệnh dưới cùng của giao diện. Có thể thực hiện các lệnh như lưu tệp tin (:w), thoát khỏi NeoVim (:q), tìm kiếm (:search), ...

`Visual Block Mode (<C-v>)`: Chế độ Visual Block cho phép chọn một khối block văn bản trong tệp tin theo column để thực hiện các thao tác như copy, cut, paste.

`Replace Mode (R)`: Chế độ Replace cho phép ghi đè lên văn bản hiện tại mà không cần thực hiện chỉnh sửa.

`Select Mode (<S-v>)`: Chế độ Select tương tự với chế độ Visual, nhưng sẽ chọn văn bản theo từng từ hoặc từng dòng.

`Operator-pending Mode`: Chế độ Operator-pending là chế độ tạm thời xảy ra khi sử dụng một toán tử (như d, c, y) nhưng chưa hoàn thành lệnh. Chế độ này cho phép tiếp tục hoặc hủy bỏ lệnh.

`vim.g` là một bảng (table) global trong NeoVim, cung cấp truy cập và quản lý các biến toàn cục (global variables) trong môi trường NeoVim.

`vim.opt` là một bảng (table) toàn cục trong NeoVim, cung cấp truy cập và quản lý các tùy chọn (options) của NeoVim.

`vim.keymap` hay `vim.api.nvim_set_keymap()` để định nghĩa các phím tắt và ánh xạ phím trong NeoVim.

For example: 
> **vim.api.nvim_set_keymap('n', '<leader>a', ':echo "Hello, World!"<CR>', {noremap = true, silent = true})**

Default LazyVim keymaps

| KEY  | DESCRIPTION   | MODE   |
|-------------- | -------------- | -------------- |
| `<C-h>`    | Go to left window     | n,t     |
| `<C-j>`    | Go to lower window     | n,t     |
| `<C-k>`    | Go to upper window     | n,t     |
| `<C-l>`    | Go to right window     | n,t     |

<leader> is Space by default.
For example:

| KEY  | DESCRIPTION   | MODE   |
|-------------- | -------------- | -------------- |
| `<leader>l`    | Lazy     | n     |
| `<leader>f`    | Files     | n, v     |
| `<leader>ff`    | (Telescope) Find Files (root dir)     | n     |


## Plugin

- `LazyVim`: Dễ dàng tùy chỉnh và mở rộng cấu hình. Thay vì phải lựa chọn giữa bắt đầu từ đầu hoặc sử dụng bản phân phối được tạo sẵn.

- `Nerdtree`: Một sidebar quản lý cây thư mục của project. Tương tự như sidebar của vscode, nerdtree cung cấp function tạo bookmark, folder, file, copy, thêm, xoá, sửa... ngay trong context của nerdtree cực kì tiện lợi.

- `Theme - Catppuccin`: syntax, màu sắc text, highlight ... sẽ là những thứ truyền cảm hứng khi code.

- `Airline`: Hiển thị status/tabline , có thể integrate với các plugin khác để hiển thị message, status như git, nerdtree, linter.

- `LSP`: Thêm một số plugin lsp để được cài đặt tự động.

- `Bufferline`: cung cấp các tab trông bắt mắt, bao gồm các biểu tượng kiểu tệp và nút đóng.

- `Status line`: Hỗ trợ màu sắc giao diện phù hợp với themes.

- `Telescope`: Một trong những plugin được sử dụng thường xuyên nhất. Nó là một công cụ tìm kiếm có thể mở rộng trên các danh sách.

- `Treesitter`: Chỉ định một số ngôn ngữ sẽ được cài đặt tự động khi khởi chạy và để nó xử lý các tệp msx dưới dạng Markdown.

- `Git`: Xử lý git siêu nhanh được thực hiện hoàn toàn bằng Lua.

---

## Install and Setup

```bash
sudo add-apt-repository universe
sudo apt -y install libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
mv nvim /usr/local/bin
git clone https://github.com/nulldoot2k/neovim-m1.git $HOME/.config/nvim
nvim
```

For Wsl

```bash
scoop install lua-language-server
sudo apt-get -y install python3-pip python3-venv
sudo apt-get -y install tar unzip jq curl wget tmux gcc ripgrep
wget https://go.dev/dl/go1.20.10.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xvzf go1.20.10.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.bashrc

cat << EOF > ~/.tmux.conf
source-file ~/.config/tmux/tmux.conf
EOF
git clone https://github.com/nulldoot2k/tmux.git ~/.config/tmux
tmux

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
chsh -s $(which fish)

cat << EOF > ~/.config/fish/config.fish
if status is-interactive
  set -gx EDITOR nvim
  set -gx PATH $PATH ~/.fnm ~/.yarn/bin ~/.composer/vendor/bin

  # Kiểm tra xem đã có session TMUX nào chưa
  if not set -q TMUX
    # Tạo tên session ngẫu nhiên và ngắn gọn
    set session_name (openssl rand -hex 2)

    # Tạo session mới và kích hoạt nó
    tmux new-session -d -s $session_name
    tmux attach-session -d -t $session_name
  end
  
  function fish_clipboard_copy
      set -l cmdline
      if isatty stdin
          # Copy the current selection, or the entire commandline if that is empty.
          # Don't use `string collect -N` here - `commandline` adds a newline.
          set cmdline (commandline --current-selection | string collect)
          test -n "$cmdline"; or set cmdline (commandline | string collect)
      else
          # Read from stdin
          while read -lz line
              set -a cmdline $line
          end
      end

      if type -q pbcopy
          printf '%s' $cmdline | pbcopy
      else if set -q WAYLAND_DISPLAY; and type -q wl-copy
          printf '%s' $cmdline | wl-copy
      else if set -q DISPLAY; and type -q xsel
          printf '%s' $cmdline | xsel --clipboard
      else if set -q DISPLAY; and type -q xclip
          printf '%s' $cmdline | xclip -selection clipboard
      else if type -q clip.exe
          printf '%s' $cmdline | clip.exe
      end

      # Copy with OSC 52; useful if we are running in an SSH session or in
      # a container.
      if type -q base64
          if not isatty stdout
              echo "fish_clipboard_copy: stdout is not a terminal" >&2
              return 1
          end
          set -l encoded (printf %s $cmdline | base64 | string join '')
          printf '\e]52;c;%s\a' "$encoded"
          # tmux requires user configuration to interpret OSC 52 on stdout.
          # Luckily we can still make this work for the common case by bypassing
          # tmux and writing to its underlying terminal.
          if set -q TMUX
              set -l tmux_tty (tmux display-message -p '#{client_tty}')
              or return 1
              # The terminal might not be writable if we switched user.
              if test -w $tmux_tty
                  printf '\e]52;c;%s\a' "$encoded" >$tmux_tty
              end
          end
      end
  end
end
EOF

sudo apt-get install git
git config --global credential.helper wincred
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"

sudo apt-get install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
gem install jekyll bundler
```

For Windows

```bash
7zip
bottom
dark
fzf
gcc
jq
lazygit
marktext
msys2
neovim
oh-my-posh
pandoc
python
ripgrep
scoop
shellcheck
stylua
win32yank
wsl-ubuntu2004
```

```bash
ctrl+q -> boi den text
```
