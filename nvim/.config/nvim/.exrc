let s:cpo_save=&cpo
set cpo&vim
inoremap <C-G>S <Plug>(nvim-surround-insert-line)
inoremap <C-G>s <Plug>(nvim-surround-insert)
cnoremap <silent> <C-R>Þ <Nop>
cnoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent> <C-R>Þ <Nop>
inoremap <silent> <C-R> <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap <silent> <C-G>Þ <Nop>
inoremap <silent> <C-G> <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
cnoremap <silent> <Plug>(TelescopeFuzzyCommandSearch) e "lua require('telescope.builtin').command_history { default_text = [=[" . escape(getcmdline(), '"') . "]=] }"
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
imap <silent> <C-G>% <Plug>(matchup-c_g%)
inoremap <silent> <Plug>(matchup-c_g%) :call matchup#motion#insert_mode()
cnoremap <C-F> <C-Right>
cnoremap <C-B> <C-Left>
cnoremap <C-A> <Home>
inoremap <silent> <C-L> <Right>
inoremap <silent> <C-H> <Left>
inoremap <silent> <M-k> <Cmd>move-2==gi
inoremap <silent> <M-j> <Cmd>move+1==gi
inoremap <silent> <C-A> ^i
inoremap <C-W> u
inoremap <C-U> u
vnoremap  <Cmd>call smoothie#do("\<C-B>") 
nnoremap  <Cmd>call smoothie#do("\<C-B>") 
vnoremap  <Cmd>call smoothie#do("\<C-D>") 
nnoremap  <Cmd>call smoothie#do("\<C-D>") 
vnoremap  <Cmd>call smoothie#do("\<C-F>") 
nnoremap  <Cmd>call smoothie#do("\<C-F>") 
noremap <silent>  :TmuxNavigateLeft
noremap <silent> <NL> :TmuxNavigateDown
noremap <silent>  :TmuxNavigateUp
noremap <silent>  :TmuxNavigateRight
vnoremap  <Cmd>call smoothie#do("\<C-U>") 
nnoremap  <Cmd>call smoothie#do("\<C-U>") 
nnoremap <silent> Þ <Nop>
nnoremap <silent>  <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
noremap <silent>  :TmuxNavigatePrevious
nnoremap <silent>  hÞ <Nop>
nnoremap <silent>  Þ <Nop>
nnoremap <silent>   <Cmd>lua require("which-key").show(" ", {mode = "n", auto = true})
nnoremap  a <Cmd>AerialToggle!
xnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "v", auto = true})
nnoremap <silent> " <Cmd>lua require("which-key").show("\"", {mode = "n", auto = true})
omap <silent> % <Ignore><Plug>(matchup-%)
xmap <silent> % <Plug>(matchup-%)
nmap <silent> % <Plug>(matchup-%)
nnoremap & :&&
nnoremap <silent> ' <Cmd>lua require("which-key").show("'", {mode = "n", auto = true})
nnoremap <silent> ,qÞ <Nop>
nnoremap <silent> ,lÞ <Nop>
nnoremap <silent> ,bÞ <Nop>
nnoremap <silent> ,sÞ <Nop>
nnoremap <silent> ,pÞ <Nop>
nnoremap <silent> ,Þ <Nop>
nnoremap <silent> , <Cmd>lua require("which-key").show(",", {mode = "n", auto = true})
nnoremap <silent> ,pc <Cmd>Lazy clean
nnoremap <silent> ,pi <Cmd>Lazy install
nnoremap <silent> ,pu <Cmd>Lazy update
nnoremap <silent> ,ps <Cmd>Lazy sync
nnoremap ,sr <Cmd>Telescope registers
nnoremap ,sc <Cmd>Telescope commands
nnoremap ,sw <Cmd>Telescope grep_string
nnoremap ,sd <Cmd>Telescope diagnostics
nnoremap ,sh <Cmd>Telescope help_tags
nnoremap ,sG <Cmd>Telescope git_files
nnoremap ,sg <Cmd>Telescope live_grep
nnoremap ,/ <Cmd>Telescope current_buffer_fuzzy_find
nnoremap ,? <Cmd>Telescope oldfiles
nnoremap <silent> ,bp <Cmd>BufferLinePick
nnoremap <silent> ,bo <Cmd>BufDelOthers
nnoremap <silent> ,bs <Cmd>BufferLineSortByDirectory
nnoremap <silent> ,bc <Cmd>BufferLinePickClose
nnoremap <silent> ,bb <Cmd>BufDel
nnoremap <silent> ,qc <Cmd>cclose
nnoremap <silent> ,qo <Cmd>copen
nnoremap <silent> ,lf <Cmd>FloatermNew --title=fl --autoclose=2 lf
nnoremap <silent> ,lg <Cmd>FloatermNew --title=lazygit --autoclose=2 lazygit
nnoremap <silent> ,w <Cmd>w
nnoremap <silent> ,qA <Cmd>qa!
nnoremap <silent> ,qa <Cmd>qa
nnoremap <silent> ,qQ <Cmd>q!
nnoremap <silent> ,qq <Cmd>q
xnoremap <silent> @(targetsÞ <Nop>
xnoremap <silent> @(targetÞ <Nop>
xnoremap <silent> @(targeÞ <Nop>
xnoremap <silent> @(targÞ <Nop>
xnoremap <silent> @(tarÞ <Nop>
xnoremap <silent> @(taÞ <Nop>
xnoremap <silent> @(tÞ <Nop>
xnoremap <silent> @(Þ <Nop>
xnoremap <silent> @( <Cmd>lua require("which-key").show("@(", {mode = "v", auto = true})
xnoremap <silent> @(targets) :call targets#do()
onoremap <silent> @(targets) :call targets#do()
xnoremap <silent> <expr> @ ':normal! @'.getcharstr().''
xmap <expr> A targets#e('o', 'A', 'A')
omap <expr> A targets#e('o', 'A', 'A')
nnoremap <silent> H ^
xmap <expr> I targets#e('o', 'I', 'I')
omap <expr> I targets#e('o', 'I', 'I')
nnoremap <silent> L $
xnoremap <silent> Q :normal! @=reg_recorded()
xnoremap S <Plug>(nvim-surround-visual)
nnoremap <silent> S <Plug>(leap-backward)
nnoremap Y y$
xnoremap <silent> [Þ <Nop>
xnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "v", auto = true})
nnoremap <silent> [Þ <Nop>
nnoremap <silent> [ <Cmd>lua require("which-key").show("[", {mode = "n", auto = true})
omap <silent> [% <Plug>(matchup-[%)
xmap <silent> [% <Plug>(matchup-[%)
nmap <silent> [% <Plug>(matchup-[%)
nnoremap <silent> [Q <Cmd>cfirstzz
nnoremap <silent> [q <Cmd>cpreviouszz
nnoremap <silent> [  Oj
xnoremap <silent> ]Þ <Nop>
xnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "v", auto = true})
nnoremap <silent> ]Þ <Nop>
nnoremap <silent> ] <Cmd>lua require("which-key").show("]", {mode = "n", auto = true})
omap <silent> ]% <Plug>(matchup-]%)
xmap <silent> ]% <Plug>(matchup-]%)
nmap <silent> ]% <Plug>(matchup-]%)
nnoremap <silent> ]Q <Cmd>clastzz
nnoremap <silent> ]q <Cmd>cnextzz
nnoremap <silent> ]  ok
nnoremap <silent> ` <Cmd>lua require("which-key").show("`", {mode = "n", auto = true})
xmap <expr> a targets#e('o', 'a', 'a')
omap <expr> a targets#e('o', 'a', 'a')
omap <silent> a% <Plug>(matchup-a%)
xmap <silent> a% <Plug>(matchup-a%)
nnoremap cS <Plug>(nvim-surround-change-line)
nnoremap cs <Plug>(nvim-surround-change)
nnoremap ds <Plug>(nvim-surround-delete)
xnoremap gS <Plug>(nvim-surround-visual-line)
xnoremap <silent> gÞ <Nop>
xnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "v", auto = true})
nnoremap <silent> gpÞ <Nop>
nnoremap <silent> gÞ <Nop>
nnoremap <silent> g <Cmd>lua require("which-key").show("g", {mode = "n", auto = true})
xnoremap gb <Plug>(comment_toggle_blockwise_visual)
xnoremap gc <Plug>(comment_toggle_linewise_visual)
nnoremap gb <Plug>(comment_toggle_blockwise)
nnoremap gc <Plug>(comment_toggle_linewise)
omap <silent> g% <Ignore><Plug>(matchup-g%)
xmap <silent> g% <Plug>(matchup-g%)
nmap <silent> g% <Plug>(matchup-g%)
xnoremap <silent> ga <Cmd>EasyAlign
nnoremap <silent> ga <Cmd>EasyAlign
xmap <expr> i targets#e('o', 'i', 'i')
omap <expr> i targets#e('o', 'i', 'i')
omap <silent> i% <Plug>(matchup-i%)
xmap <silent> i% <Plug>(matchup-i%)
nnoremap <silent> <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <silent> <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap sf <Cmd>Telescope find_files
nnoremap <silent> s <Plug>(leap-forward)
nnoremap <silent> so o
nnoremap <silent> sc c
nnoremap <silent> sh <Cmd>sp
nnoremap <silent> sv <Cmd>vsp
nnoremap ySS <Plug>(nvim-surround-normal-cur-line)
nnoremap yS <Plug>(nvim-surround-normal-line)
nnoremap yss <Plug>(nvim-surround-normal-cur)
nnoremap ys <Plug>(nvim-surround-normal)
xnoremap <silent> zÞ <Nop>
xnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "v", auto = true})
nnoremap <silent> zÞ <Nop>
nnoremap <silent> z <Cmd>lua require("which-key").show("z", {mode = "n", auto = true})
omap <silent> z% <Plug>(matchup-z%)
xmap <silent> z% <Plug>(matchup-z%)
nmap <silent> z% <Plug>(matchup-z%)
vnoremap zb <Cmd>call smoothie#do("zb") 
nnoremap zb <Cmd>call smoothie#do("zb") 
vnoremap z- <Cmd>call smoothie#do("z-") 
nnoremap z- <Cmd>call smoothie#do("z-") 
vnoremap zz <Cmd>call smoothie#do("zz") 
nnoremap zz <Cmd>call smoothie#do("zz") 
vnoremap z. <Cmd>call smoothie#do("z.") 
nnoremap z. <Cmd>call smoothie#do("z.") 
vnoremap z <Cmd>call smoothie#do("z\<CR>") 
nnoremap z <Cmd>call smoothie#do("z\<CR>") 
vnoremap zt <Cmd>call smoothie#do("zt") 
nnoremap zt <Cmd>call smoothie#do("zt") 
vnoremap z^ <Cmd>call smoothie#do("z^") 
nnoremap z^ <Cmd>call smoothie#do("z^") 
vnoremap z+ <Cmd>call smoothie#do("z+") 
nnoremap z+ <Cmd>call smoothie#do("z+") 
xnoremap <silent> <Plug>(nvim-surround-visual-line) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = true })
xnoremap <silent> <Plug>(nvim-surround-visual) <Cmd>lua require'nvim-surround'.visual_surround({ line_mode = false })
xnoremap <silent> <SNR>22_(matchup-%Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-g%Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-gÞ <Nop>
xnoremap <silent> <SNR>22_(matchup-[%Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-[Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-Z%Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-ZÞ <Nop>
xnoremap <silent> <SNR>22_(matchup-]%Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-]Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-z%Þ <Nop>
xnoremap <silent> <SNR>22_(matchup-zÞ <Nop>
xnoremap <silent> <SNR>22_(matchup-Þ <Nop>
xnoremap <silent> <SNR>22_(matchupÞ <Nop>
xnoremap <silent> <SNR>22_(matchuÞ <Nop>
xnoremap <silent> <SNR>22_(matchÞ <Nop>
xnoremap <silent> <SNR>22_(matcÞ <Nop>
xnoremap <silent> <SNR>22_(matÞ <Nop>
xnoremap <silent> <SNR>22_(maÞ <Nop>
xnoremap <silent> <SNR>22_(mÞ <Nop>
xnoremap <silent> <SNR>22_(Þ <Nop>
xnoremap <silent> <SNR>22_Þ <Nop>
xnoremap <silent> <SNR>22Þ <Nop>
xnoremap <silent> <SNR>2Þ <Nop>
xnoremap <silent> <SNR>Þ <Nop>
xnoremap <silent> <SNR> <Cmd>lua require("which-key").show("��R", {mode = "v", auto = true})
nnoremap <silent> <C-W>Þ <Nop>
nnoremap <silent> <C-W> <Cmd>lua require("which-key").show("\23", {mode = "n", auto = true})
nnoremap <silent> <SNR>22_(wiseÞ <Nop>
nnoremap <silent> <SNR>22_(wisÞ <Nop>
nnoremap <silent> <SNR>22_(wiÞ <Nop>
nnoremap <silent> <SNR>22_(wÞ <Nop>
nnoremap <silent> <SNR>22_(Þ <Nop>
nnoremap <silent> <SNR>22_Þ <Nop>
nnoremap <silent> <SNR>22Þ <Nop>
nnoremap <silent> <SNR>2Þ <Nop>
nnoremap <silent> <SNR>Þ <Nop>
nnoremap <silent> <SNR> <Cmd>lua require("which-key").show("��R", {mode = "n", auto = true})
nnoremap <silent> <M-l> <Cmd>BufferLineCycleNext
nnoremap <silent> <M-h> <Cmd>BufferLineCyclePrev
tnoremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap <silent> <Plug>(StopHL) :nohlsearch
xnoremap <Plug>(comment_toggle_blockwise_visual) <Cmd>lua require("Comment.api").locked("toggle.blockwise")(vim.fn.visualmode())
xnoremap <Plug>(comment_toggle_linewise_visual) <Cmd>lua require("Comment.api").locked("toggle.linewise")(vim.fn.visualmode())
nmap <silent> <2-LeftMouse> <Plug>(matchup-double-click)
nnoremap <Plug>(matchup-reload) :MatchupReload
nnoremap <silent> <Plug>(matchup-double-click) :call matchup#text_obj#double_click()
onoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 0, 'delim_all')
onoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 0, 'delim_all')
xnoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 1, 'delim_all')
xnoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 1, 'delim_all')
onoremap <silent> <Plug>(matchup-Z%) :call matchup#motion#op('Z%')
xnoremap <silent> <SNR>22_(matchup-Z%) :call matchup#motion#jump_inside_prev(1)
nnoremap <silent> <Plug>(matchup-Z%) :call matchup#motion#jump_inside_prev(0)
onoremap <silent> <Plug>(matchup-z%) :call matchup#motion#op('z%')
xnoremap <silent> <SNR>22_(matchup-z%) :call matchup#motion#jump_inside(1)
nnoremap <silent> <Plug>(matchup-z%) :call matchup#motion#jump_inside(0)
onoremap <silent> <Plug>(matchup-[%) :call matchup#motion#op('[%')
onoremap <silent> <Plug>(matchup-]%) :call matchup#motion#op(']%')
xnoremap <silent> <SNR>22_(matchup-[%) :call matchup#motion#find_unmatched(1, 0)
xnoremap <silent> <SNR>22_(matchup-]%) :call matchup#motion#find_unmatched(1, 1)
nnoremap <silent> <Plug>(matchup-[%) :call matchup#motion#find_unmatched(0, 0)
nnoremap <silent> <Plug>(matchup-]%) :call matchup#motion#find_unmatched(0, 1)
onoremap <silent> <Plug>(matchup-g%) :call matchup#motion#op('g%')
xnoremap <silent> <SNR>22_(matchup-g%) :call matchup#motion#find_matching_pair(1, 0)
onoremap <silent> <Plug>(matchup-%) :call matchup#motion#op('%')
xnoremap <silent> <SNR>22_(matchup-%) :call matchup#motion#find_matching_pair(1, 1)
nnoremap <silent> <Plug>(matchup-g%) :call matchup#motion#find_matching_pair(0, 0)
nnoremap <silent> <Plug>(matchup-%) :call matchup#motion#find_matching_pair(0, 1)
nnoremap <silent> <expr> <SNR>22_(wise) empty(g:v_motion_force) ? 'v' : g:v_motion_force
nnoremap <silent> <Plug>(matchup-hi-surround) :call matchup#matchparen#highlight_surrounding()
nnoremap <Plug>PlenaryTestFile :lua require('plenary.test_harness').test_file(vim.fn.expand("%:p"))
nnoremap <silent> <Plug>SplitjoinJoin :call sj#Join()
nnoremap <silent> <Plug>SplitjoinSplit :call sj#Split()
noremap <silent> <C-Bslash> :TmuxNavigatePrevious
noremap <silent> <Plug>(SmoothieBackwards) <Cmd>call smoothie#backwards() 
noremap <silent> <Plug>(SmoothieForwards) <Cmd>call smoothie#forwards()  
noremap <silent> <Plug>(SmoothieUpwards) <Cmd>call smoothie#upwards()   
noremap <silent> <Plug>(SmoothieDownwards) <Cmd>call smoothie#downwards() 
vnoremap <PageUp> <Cmd>call smoothie#do("\<PageUp>") 
nnoremap <PageUp> <Cmd>call smoothie#do("\<PageUp>") 
vnoremap <S-Up> <Cmd>call smoothie#do("\<S-Up>") 
nnoremap <S-Up> <Cmd>call smoothie#do("\<S-Up>") 
vnoremap <C-B> <Cmd>call smoothie#do("\<C-B>") 
nnoremap <C-B> <Cmd>call smoothie#do("\<C-B>") 
vnoremap <PageDown> <Cmd>call smoothie#do("\<PageDown>") 
nnoremap <PageDown> <Cmd>call smoothie#do("\<PageDown>") 
vnoremap <S-Down> <Cmd>call smoothie#do("\<S-Down>") 
nnoremap <S-Down> <Cmd>call smoothie#do("\<S-Down>") 
vnoremap <C-F> <Cmd>call smoothie#do("\<C-F>") 
nnoremap <C-F> <Cmd>call smoothie#do("\<C-F>") 
vnoremap <C-U> <Cmd>call smoothie#do("\<C-U>") 
nnoremap <C-U> <Cmd>call smoothie#do("\<C-U>") 
vnoremap <C-D> <Cmd>call smoothie#do("\<C-D>") 
nnoremap <C-D> <Cmd>call smoothie#do("\<C-D>") 
nnoremap <silent> <M-p> <Cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}
nnoremap <silent> <M-n> <Cmd>lua require"illuminate".next_reference{wrap=true}
nnoremap <silent> <M-Down> <Cmd>resize-5
nnoremap <silent> <M-Up> <Cmd>resize+5
nnoremap <silent> <M-Left> <Cmd>vertical resize-5
nnoremap <silent> <M-Right> <Cmd>vertical resize+5
noremap <silent> <C-K> :TmuxNavigateUp
noremap <silent> <C-J> :TmuxNavigateDown
noremap <silent> <C-H> :TmuxNavigateLeft
vnoremap <silent> <M-k> <Cmd>'<,'>move'<-2gv=gv
vnoremap <silent> <M-j> <Cmd>'<,'>move'>+1gv=gv
nnoremap <silent> <M-k> <Cmd>move-2==
nnoremap <silent> <M-j> <Cmd>move+1==
noremap <silent> <C-L> :TmuxNavigateRight
cnoremap  <Home>
inoremap <silent>  ^i
cnoremap  <C-Left>
cnoremap  <C-Right>
inoremap S <Plug>(nvim-surround-insert-line)
inoremap s <Plug>(nvim-surround-insert)
inoremap <silent> Þ <Nop>
inoremap <silent>  <Cmd>lua require("which-key").show("\7", {mode = "i", auto = true})
imap <silent> % <Plug>(matchup-c_g%)
inoremap <silent>  <Left>
inoremap <silent>  <Right>
cnoremap <silent> Þ <Nop>
cnoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "c", auto = true})
inoremap <silent> Þ <Nop>
inoremap <silent>  <Cmd>lua require("which-key").show("\18", {mode = "i", auto = true})
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set completeopt=menu,menuone,noselect,noinsert
set expandtab
set fillchars=horiz:━,horizdown:┳,horizup:┻,vert:┃,verthoriz:╋,vertleft:┨,vertright:┣
set foldlevelstart=99
set formatoptions=qcnrj
set helplang=cn
set ignorecase
set laststatus=3
set listchars=eol:↴,nbsp:+,tab:>\ ,trail:-
set noloadplugins
set mouse=a
set packpath=~/.local/share/bob/nightly/nvim-macos/share/nvim/runtime
set pumblend=15
set pumheight=20
set runtimepath=~/.config/nvim,~/.local/share/nvim/lazy/lazy.nvim,~/.local/share/nvim/lazy/vim-dispatch,~/.local/share/nvim/lazy/oil.nvim,~/.local/share/nvim/lazy/vim-fugitive,~/.local/share/nvim/lazy/nvim-surround,~/.local/share/nvim/lazy/which-key.nvim,~/.local/share/nvim/lazy/neodev.nvim,~/.local/share/nvim/lazy/nvim-web-devicons,~/.local/share/nvim/lazy/gruvbox-material,~/.local/share/nvim/lazy/melange-nvim,~/.local/share/nvim/lazy/telescope-fzf-native.nvim,~/.local/share/nvim/lazy/telescope.nvim,~/.local/share/nvim/lazy/targets.vim,~/.local/share/nvim/lazy/bufferline.nvim,~/.local/share/nvim/lazy/nvim-lspconfig,~/.local/share/nvim/lazy/leap.nvim,~/.local/share/nvim/lazy/rainbow-delimiters.nvim,~/.local/share/nvim/lazy/vim-illuminate,~/.local/share/nvim/lazy/none-ls.nvim,~/.local/share/nvim/lazy/aerial.nvim,~/.local/share/nvim/lazy/lualine.nvim,~/.local/share/nvim/lazy/vim-repeat,~/.local/share/nvim/lazy/lsp_signature.nvim,~/.local/share/nvim/lazy/vim-cool,~/.local/share/nvim/lazy/guess-indent.nvim,~/.local/share/nvim/lazy/Comment.nvim,~/.local/share/nvim/lazy/fidget.nvim,~/.local/share/nvim/lazy/vim-matchup,~/.local/share/nvim/lazy/nvim-bufdel,~/.local/share/nvim/lazy/better-escape.nvim,~/.local/share/nvim/lazy/plenary.nvim,~/.local/share/nvim/lazy/harpoon,~/.local/share/nvim/lazy/splitjoin.vim,~/.local/share/nvim/lazy/vim-easy-align,~/.local/share/nvim/lazy/vim-obsession,~/.local/share/nvim/lazy/nvim-ts-autotag,~/.local/share/nvim/lazy/nvim-treesitter-context,~/.local/share/nvim/lazy/nvim-treesitter-textobjects,~/.local/share/nvim/lazy/nvim-treesitter,~/.local/share/nvim/lazy/friendly-snippets,~/.local/share/nvim/lazy/LuaSnip,~/.local/share/nvim/lazy/cmp_luasnip,~/.local/share/nvim/lazy/cmp-cmdline,~/.local/share/nvim/lazy/cmp-path,~/.local/share/nvim/lazy/cmp-buffer,~/.local/share/nvim/lazy/lspkind-nvim,~/.local/share/nvim/lazy/cmp-nvim-lsp,~/.local/share/nvim/lazy/nvim-cmp,~/.local/share/nvim/lazy/nvim-autopairs,~/.local/share/nvim/lazy/gitsigns.nvim,~/.local/share/nvim/lazy/vim-tmux-navigator,~/.local/share/nvim/lazy/vim-smoothie,~/.local/share/bob/nightly/nvim-macos/share/nvim/runtime,~/.local/share/bob/nightly/nvim-macos/lib/nvim,~/.local/share/nvim/lazy/gruvbox-material/after,~/.local/share/nvim/lazy/vim-matchup/after,~/.local/share/nvim/lazy/cmp_luasnip/after,~/.local/share/nvim/lazy/cmp-cmdline/after,~/.local/share/nvim/lazy/cmp-path/after,~/.local/share/nvim/lazy/cmp-buffer/after,~/.local/share/nvim/lazy/cmp-nvim-lsp/after,~/.config/nvim/after,~/.local/state/nvim/lazy/readme
set scrolloff=5
set shiftwidth=4
set showbreak=\ \ \ 
set noshowmode
set showtabline=2
set smartcase
set smartindent
set softtabstop=4
set splitbelow
set splitright
set statusline=%#Normal#
set noswapfile
set tabline=%!v:lua.nvim_bufferline()
set tabstop=4
set termguicolors
set timeoutlen=300
set undodir=~/.config/nvim/misc/undodir
set undofile
set updatetime=250
set wildmode=longest:full,full
set wildoptions=pum
set window=68
set nowritebackup
" vim: set ft=vim :
