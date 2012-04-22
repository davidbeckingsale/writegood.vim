"
" Toggle writegood mode
"
function! writegood#toggle()
    call writegood#init()

    if empty(w:writegood_on)
        call writegood#enable()
    else
        call writegood#disable()
    endif
endfunction

"
" Init the w:writegood_on variable.
"
function! writegood#init()
  let w:writegood_on = exists('w:writegood_on') ? w:writegood_on : 0
endfunction

"
" Turn on all match highlighting
"
function! writegood#enable()
    let w:writegood_on = 1
    
    " Highlight duplicates
    call writegood#highlight_dups()
    " Highlight weasel words
    call writegood#highlight_weasel()
    " Highlight passive voice
    call writegood#highlight_passive()
endfunction

"
" Deletes all matches
"
function! writegood#disable()
    call matchdelete(s:dups)
    call matchdelete(s:passive)
    call matchdelete(s:weasel)

    let w:writegood_on = 0
endfunction!

"
" Pattern for highlighting duplicate words, works across lines.
"
function writegood#highlight_dups()
    let s:dups=matchadd('Error', '\v(<\w+>)\_s*<\1>', 10)
endfunction

"
" Weasel words take from Matt Might's blog.
"
function writegood#highlight_weasel()
    let s:weasel=matchadd('Error', '\c\v<many>|<various>|<very>|<fairly>|<several>|<extremely>|<exceedingly>|<quite>|<remarkably>|<few>|<surprisingly>|<mostly>|<largely>|<huge>|<tiny>|<((are>|<is) a number)>|<excellent>|<interestingly>|<significantly>|<substantially>|<clearly>|<vast>|<relatively>|<completely>', 10)
endfunction

"
" Passive words take from Matt Might's blog.
" There could (must be) a better way to do this!
"
function writegood#highlight_passive()
    let s:passive=matchadd('Error','\c\v<awoken>|<been>|<born>|<beat>|<become>|<begun>|<bent>|<beset>|<bet>|<bid>|<bidden>|<bound>|<bitten>|<bled>|<blown>|<broken>|<bred>|<brought>|<broadcast>|<built>|<burnt>|<burst>|<bought>|<cast>|<caught>|<chosen>|<clung>|<come>|<cost>|<crept>|<cut>|<dealt>|<dug>|<dived>|<done>|<drawn>|<dreamt>|<driven>|<drunk>|<eaten>|<fallen>|<fed>|<felt>|<fought>|<found>|<fit>|<fled>|<flung>|<flown>|<forbidden>|<forgotten>|<foregone>|<forgiven>|<forsaken>|<frozen>|<gotten>|<given>|<gone>|<ground>|<grown>|<hung>|<heard>|<hidden>|<hit>|<held>|<hurt>|<kept>|<knelt>|<knit>|<known>|<laid>|<led>|<leapt>|<learnt>|<left>|<lent>|<let>|<lain>|<lighted>|<lost>|<made>|<meant>|<met>|<misspelt>|<mistaken>|<mown>|<overcome>|<overdone>|<overtaken>|<overthrown>|<paid>|<pled>|<proven>|<put>|<quit>|<read>|<rid>|<ridden>|<rung>|<risen>|<run>|<sawn>|<said>|<seen>|<sought>|<sold>|<sent>|<set>|<sewn>|<shaken>|<shaven>|<shorn>|<shed>|<shone>|<shod>|<shot>|<shown>|<shrunk>|<shut>|<sung>|<sunk>|<sat>|<slept>|<slain>|<slid>|<slung>|<slit>|<smitten>|<sown>|<spoken>|<sped>|<spent>|<spilt>|<spun>|<spit>|<split>|<spread>|<sprung>|<stood>|<stolen>|<stuck>|<stung>|<stunk>|<stridden>|<struck>|<strung>|<striven>|<sworn>|<swept>|<swollen>|<swum>|<swung>|<taken>|<taught>|<torn>|<told>|<thought>|<thrived>|<thrown>|<thrust>|<trodden>|<understood>|<upheld>|<upset>|<woken>|<worn>|<woven>|<wed>|<wept>|<wound>|<won>|<withheld>|<withstood>|<wrung>|<written>', 10)
endfunction
