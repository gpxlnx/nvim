# Keymaps - Nvim Configuration

> Referência rápida de todos os atalhos de teclado configurados nesta configuração do Neovim.
> Pressione `<Space>` (leader key) para ver o menu interativo com which-key.

## Legenda

- **Leader key**: `<Space>`
- **Local leader**: `<Space>` (mesmo que leader)
- Modos: `n` = normal, `i` = insert, `v` = visual, `x` = visual block

---

## General

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<Esc>` | Clear Search Highlights | n |
| `<C-s>` | Save File | n |
| `<C-q>` | Quit | n |
| `<C-d>` | Scroll Down and Center | n |
| `<C-u>` | Scroll Up and Center | n |
| `n` | Next Search Result | n |
| `N` | Prev Search Result | n |
| `j` | Move Down (display line quando sem count) | n |
| `k` | Move Up (display line quando sem count) | n |
| `x` | Delete char sem yank | n |
| `jk` / `kj` | Exit Insert Mode | i |

## Spellcheck

Spellcheck multilíngue é ativado automaticamente para `text`, `markdown`, `gitcommit`, `lua`, `python`, `html`, `javascript`, `typescript`, `css` e `scss`.
Idiomas ativos: `pt_br`, `pt`, `en_us`, `en`.

## Navigation

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<C-h>` | Go to Left Window | n |
| `<C-j>` | Go to Lower Window | n |
| `<C-k>` | Go to Upper Window | n |
| `<C-l>` | Go to Right Window | n |
| `<C-\>` | Go to Previous Split/Tmux Pane | n |
| `[d` | Prev Diagnostic | n |
| `]d` | Next Diagnostic | n |

## Buffer Management

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<Tab>` | Next Buffer | n |
| `<S-Tab>` | Prev Buffer | n |
| `<leader>b` | New Buffer | n |
| `<leader>x` | Delete Buffer | n |
| `<leader><leader>` | Buffers (Telescope) | n |

## Window Management

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>v` | Split Vertically | n |
| `<leader>h` | Split Horizontally | n |
| `<leader>se` | Equal Window Size | n |
| `<leader>xs` | Close Split | n |

## Tab Management

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>to` | New Tab | n |
| `<leader>tx` | Close Tab | n |
| `<leader>tn` | Next Tab | n |
| `<leader>tp` | Prev Tab | n |

## File Explorer (Neo-tree)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>e` | Explorer (Left) | n |
| `<leader>w` | Explorer (Float) | n |
| `<leader>ngs` | Git Status (Neotree) | n |
| `\` | Reveal Current File | n |

### Dentro do Neo-tree:

- `<Space>` - Toggle node
- `<CR>` / `l` - Open file
- `a` - Add file
- `A` - Add directory
- `d` - Delete
- `r` - Rename
- `y` - Copy to clipboard
- `x` - Cut to clipboard
- `p` - Paste from clipboard
- `q` - Close window
- `H` - Toggle hidden files
- `/` - Fuzzy finder
- `[g` / `]g` - Prev/Next git modified

## Search (Telescope)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>sf` | Find Files | n |
| `<leader>sg` | Grep (Root Dir) | n |
| `<leader>sw` | Grep Word | n |
| `<leader>sb` | Buffers | n |
| `<leader>sh` | Help Pages | n |
| `<leader>sd` | Diagnostics | n |
| `<leader>sr` | Resume | n |
| `<leader>sm` | Marks | n |
| `<leader>s.` | Recent Files | n |
| `<leader>?` | Recent Files | n |
| `<leader>s/` | Grep Open Files | n |
| `<leader>/` | Search in Buffer | n |
| `<leader>sds` | Document Symbols | n |

## Git (Telescope)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>gf` | Git Files | n |
| `<leader>gc` | Git Commits | n |
| `<leader>gcf` | Git Commits (Buffer) | n |
| `<leader>gb` | Git Branches | n |
| `<leader>gs` | Git Status | n |

## LSP (Language Server)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `gd` | Goto Definition | n |
| `gr` | Goto References | n |
| `gI` | Goto Implementation | n |
| `gD` | Goto Declaration | n |
| `K` | Hover Documentation | n |
| `<leader>D` | Type Definition | n |
| `<leader>rn` | Rename | n |
| `<leader>ca` | Code Action | n |
| `<leader>ds` | Document Symbols | n |
| `<leader>ws` | Workspace Symbols | n |
| `<leader>wa` | Add Workspace Folder | n |
| `<leader>wr` | Remove Workspace Folder | n |
| `<leader>wl` | List Workspace Folders | n |

## Code

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<C-/>` / `<C-c>` | Toggle Comment | n, v |
| `<leader>lw` | Toggle Line Wrap | n |
| `<leader>cw` | Count Words | n |
| `<` | Indent Left | v |
| `>` | Indent Right | v |
| `<A-j>` | Move Line Down | v |
| `<A-k>` | Move Line Up | v |
| `<A-j>` | Move Line Down | n |
| `<A-k>` | Move Line Up | n |

## Writing / Wrap

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>rp` | Wrap with Parentheses | v |
| `<leader>rq` | Wrap with Single Quotes | v |
| `<leader>rQ` | Wrap with Double Quotes | v |
| `<leader>rs` | Wrap with Square Brackets | v |
| `<leader>rc` | Wrap with Curly Braces | v |
| `<leader>rb` | Wrap with Backticks | v |
| `<leader>rh` | Wrap with Angle Brackets | v |
| `<leader>rw` | Toggle Soft Wrap | n |
| `<leader>rf` | Copy Full File Path | n |

## Markdown

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>mb` | Wrap Markdown Bold | v |
| `<leader>mi` | Wrap Markdown Italic | v |
| `<leader>mc` | Wrap Markdown Code | v |
| `<leader>mcc` | Insert Markdown Code Block | n |
| `<leader>ml` | Insert Markdown Link | n |
| `<leader>mim` | Insert Markdown Image | n |

## AI Assistant (OpenCode)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>aa` | Ask OpenCode | n, x |
| `<leader>ax` | OpenCode Actions | n, x |
| `<leader>ap` | Prompt OpenCode | n, x |
| `<leader>at` | Toggle OpenCode | n |
| `<leader>ae` | Explain Code | n, x |
| `<leader>ao` | Optimize Code | n, x |
| `<leader>ad` | Document Code | n, x |
| `<leader>aT` | Generate Tests | n, x |
| `<leader>ar` | Review Code | n, x |
| `<leader>aD` | Explain Diagnostics | n |
| `<leader>af` | Fix Diagnostics | n |
| `<leader>ag` | Review Git Diff | n |
| `<leader>an` | New Session | n |
| `<leader>as` | Share Session | n |
| `<leader>ai` | Interrupt Session | n |
| `<leader>ac` | Compact Session | n |
| `<leader>au` | Scroll Up | n |
| `<leader>aj` | Scroll Down | n |

### Dentro do picker do OpenCode (snacks):

| Tecla | Descrição |
|-------|-----------|
| `<A-a>` | Enviar item selecionado para o OpenCode |

## Treesitter (Seleção Incremental)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<C-Space>` | Iniciar seleção | n |
| `<C-Space>` | Expandir para nó pai | v |
| `<C-s>` | Expandir para escopo | v |
| `<M-Space>` | Reduzir seleção | v |

## Sessions

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>ss` | Save Session | n |
| `<leader>sl` | Load Session Picker | n |

## Slides

Plugin `aspeddro/slides.nvim` — comandos disponíveis via `:`:

| Comando | Descrição |
|---------|-----------|
| `:SlidesStart` | Iniciar apresentação (fullscreen) |
| `:SlidesStop` | Encerrar apresentação |

## Markdown Preview

Plugin `iamcco/markdown-preview.nvim` — carregado apenas em arquivos `.md`:

| Comando | Descrição |
|---------|-----------|
| `:MarkdownPreview` | Abrir preview no browser |
| `:MarkdownPreviewStop` | Fechar preview |
| `:MarkdownPreviewToggle` | Toggle do preview |

## Harpoon (Quick File Navigation)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>m` | Harpoon Add File | n |
| `<leader>M` | Harpoon Quick Menu | n |
| `<leader>1` | Harpoon to File 1 | n |
| `<leader>2` | Harpoon to File 2 | n |
| `<leader>3` | Harpoon to File 3 | n |
| `<leader>4` | Harpoon to File 4 | n |
| `<leader>p` | Harpoon Prev | n |
| `<leader>n` | Harpoon Next | n |

## Aerial (Code Outline)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>o` | Toggle Aerial | n |
| `<leader>on` | Aerial Navigation | n |
| `{` | Prev Symbol (dentro do Aerial) | n |
| `}` | Next Symbol (dentro do Aerial) | n |

## Debug (DAP)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<F5>` | Debug: Continue | n |
| `<F1>` | Debug: Step Into | n |
| `<F2>` | Debug: Step Over | n |
| `<F3>` | Debug: Step Out | n |
| `<F7>` | Debug: Toggle UI | n |
| `<leader>db` | Toggle Breakpoint | n |
| `<leader>dB` | Breakpoint Condition | n |

## Treesitter Textobjects

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `aa` | Select Parameter Outer | x, o |
| `ia` | Select Parameter Inner | x, o |
| `af` | Select Function Outer | x, o |
| `if` | Select Function Inner | x, o |
| `ac` | Select Class Outer | x, o |
| `ic` | Select Class Inner | x, o |
| `]m` | Next Function Start | n, x, o |
| `]]` | Next Class Start | n, x, o |
| `]M` | Next Function End | n, x, o |
| `][` | Next Class End | n, x, o |
| `[m` | Previous Function Start | n, x, o |
| `[[` | Previous Class Start | n, x, o |
| `[M` | Previous Function End | n, x, o |
| `[]` | Previous Class End | n, x, o |
| `<leader>a` | Swap Next Parameter | n |
| `<leader>A` | Swap Previous Parameter | n |

## Tema

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>bg` | Toggle Background Transparency (Nord) | n |

## Diagnostics

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>d` | Show Diagnostic | n |
| `<leader>do` | Toggle Diagnostics | n |
| `<leader>q` | Diagnostic List | n |
| `[d` | Prev Diagnostic | n |
| `]d` | Next Diagnostic | n |

## Clipboard

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>y` | Yank to System Clipboard | n, v |
| `<leader>Y` | Yank Line to System Clipboard | n |
| `p` | Paste Without Yank | v |

## Utilities

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `<leader>+` | Increment Number | n |
| `<leader>-` | Decrement Number | n |
| `<leader>j` | Replace Word Under Cursor | n |
| `<leader>sn` | Save Without Formatting | n |
| `<leader>ss` | Save Session | n |
| `<leader>sl` | Load Session | n |

---

## Which-Key Groups

Quando você pressiona `<leader>` (Space), o which-key mostra os seguintes grupos organizados:

- **`<leader>a`** - ai/opencode
- **`<leader>b`** - buffer
- **`<leader>c`** - code  
- **`<leader>d`** - diagnostics/debug
- **`<leader>f`** - find/file
- **`<leader>g`** - git
- **`<leader>l`** - lsp
- **`<leader>n`** - neotree
- **`<leader>o`** - outline/aerial
- **`<leader>s`** - search
- **`<leader>t`** - tab
- **`<leader>w`** - window/workspace
- **`<leader>x`** - close
- **`g`** - goto
- **`[`** - prev
- **`]`** - next

---

## Dicas

1. **Descoberta de keymaps**: Pressione `<Space>` e aguarde - o which-key mostrará todas as opções disponíveis
2. **OpenCode**: Use `<leader>a` para acessar o assistente AI - pode explicar, otimizar, documentar e revisar código
3. **Navegação em splits**: Use `<C-h/j/k/l>` para navegar rapidamente entre janelas
4. **Telescope**: Após abrir qualquer picker do Telescope, use `<C-j/k>` para navegar, `<C-l>` para abrir
5. **LSP**: Posicione o cursor sobre um símbolo e pressione `K` para ver documentação
6. **Harpoon**: Marque seus arquivos mais usados com `<leader>m` e acesse rapidamente com `<leader>1-4`
7. **Git**: Use `<leader>g` + uma letra para acessar rapidamente funções git via Telescope
8. **AI Actions**: Selecione código em visual mode e use `<leader>ax` para ver todas as ações disponíveis do OpenCode

---

## Atalhos padrão do Neovim (folds)

| Tecla | Descrição | Modo |
|-------|-----------|------|
| `za` | Toggle fold atual | n |
| `zA` | Toggle fold atual recursivamente | n |
| `zo` | Open fold atual | n |
| `zO` | Open fold atual recursivamente | n |
| `zc` | Close fold atual | n |
| `zC` | Close fold atual recursivamente | n |
| `zr` | Reduce fold level (abre mais folds) | n |
| `zR` | Open all folds | n |
| `zm` | Fold more (fecha mais folds) | n |
| `zM` | Close all folds | n |
| `zv` | Abre folds para revelar cursor | n |
| `zi` | Toggle `foldenable` | n |

---

**Última atualização**: 2026-03-04
**Baseado em**: LazyVim keymaps style guide
