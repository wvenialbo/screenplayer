\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{screenplayer}[2010/04/30 Class for Scripts]
% A LaTeX-Class for Scripts
% 
% Currently supported typical types of scripts:
% theatre, theater, motionpicture, movie, cabaret, sitcom, comedy, radioplay
% 
% Special parameters:
% plain (strips all special commands) 

%
% Packages needed
%
\RequirePackage{ifthen}
\usepackage[T1]{fontenc}
\usepackage[a4paper]{geometry}


%
% General rules
%
\renewcommand*\familydefault{\ttdefault}%standard font: typewriter
\renewcommand{\normalsize}{\fontsize{12pt}{10pt}\selectfont}%fontsize 12pt 
\pagenumbering{arabic}%for now: arabic numbers
\setlength{\parskip}{\baselineskip}

\pretolerance=500 % acceptable "badness" before trying to hyphenate
\tolerance=10000  % acceptable "badness" of a line
\linepenalty=0    % penalty for each line in a paragraph
\adjdemerits=0    % demerits for adjacent tight and loose line juxtapositions
\finalhyphendemerits=0 % demerits for hyphenating the penultimate line
\doublehyphendemerits=0 % demerits for hyphenating consecutive lines
\hbadness=10000   % avoid useless underfull hbox messages

\newdimen\lineskip \lineskip=12bp % 6 lines per inch
\newdimen\charwid {\setbox0=\hbox{M} \global\charwid=\wd0}
\baselineskip=\lineskip  % 2\lineskip for sitcoms
\spaceskip=\charwid   % for true typewriter spacing (redundant in cmtt)
\xspaceskip=2\charwid % for two spaces after a sentence (redundant in cmtt)
\parindent 0pt
\splittopskip=\topskip
\splitmaxdepth=\maxdepth
\newdimen\rightmar
\newcommand{\hotzone}{8\charwid} % right margin hotzone
\newcommand{\margins}[2]
{%
    \leftskip=#1
    \rightmar=\hsize \advance\rightmar by -\leftskip \advance\rightmar by -#2
    \rightskip=\rightmar plus \hotzone
}


%
% Global dimensions
%
\newdimen{\sppagenumbermargintopbottom}
\newdimen{\sppagenumbermarginleftright}
\newdimen{\spmarginleft}
\newdimen{\spmarginright}
\newdimen{\spmargintop}
\newdimen{\spmarginbottom}
\newdimen{\spcharnamemarginleft}
\newdimen{\spcharnamemarginright}
\newdimen{\spdialoguemarginleft}
\newdimen{\spdialoguemarginright}
\newdimen{\spparenmarginleft}
\newdimen{\spparenmarginright}

%
%  Global strings
%
\newcommand{\splastspeaker}{}%who spoke last? we're keeping track
\newcommand{\scripttype}{oscar} %which type of script?
\newcommand{\spspeechfurthermark}{}%marker for dialogues that will continue e.g. (MORE)
\newcommand{\spspeechcontdmark}{}% marker for continuing dialogs e.g. (CONT'D)
\newcommand{\sppagenumbervalign}{}%page number vertical align: top / bottom
\newcommand{\sppagenumberhalign}{}%page number horiz. align: left / center / right
\newcommand{\sppagenumberdecoration}{}%deco for page number: point / line ('1.' / '-1-')
\newcommand{\spheadlinetype}{}%what to show in the headline?: title
%variables for block-splitting
\newcommand{\spsplitblockfurthermark}{}%text to mark split at the end of a page
\newcommand{\spsplitblockcontdmark}{}%text to mark split at the beginning of a page


%  
% Customizing the dimensions according to the specifications for
% each format 
%
\newcommand{\screenplayer}
{

    \ifthenelse{\equal {\scripttype} {oscar}} 
    {
        %Script according to Oscar
    
        %Paper: US Letter

        
        % Normal left 1,5 inches
        \spmarginleft=1.5in
        % Normal right 1 inch
        \spmarginright=1.0in
        % Normal Top 1 inch
        \spmargintop=1.0in
        % Normal Bottom 0.5 - 1.5 inches
        \spmarginbottom=0.5in
        
        % Pagenumber top 0.5 inches
        \sppagenumbermargintopbottom=0.5in
        \gdef\sppagenumbervalign{top}
        % Pagenumber right 1.0 inches
        \sppagenumbermarginleftright=1.0in
        \gdef\sppagenumberhalign{right}
        
        
        % Font Courier 12 point 10 pitch (non-proportional)
        \fontsize{12pt}{10pt}
        
        % dialogue
        % left 3 inches - normal left 1,5 inches = 1,5 inches
        \spdialoguemarginleft=1.5in
        % right 2.5 inches - normal right 1 inch = 1.5 inches
        \spdialoguemarginright=1.5in
        
        % character name
        % left 4.2 inches  - normal left 1.5 inches = 2.7 inches
        \spcharnamemarginleft=2.7in
        \spcharnamemarginright=\spdialoguemarginright
        
        % parantheticals
        % 0.5 inches left from char-name (3.7 inches) - normal left 1.5 inches = 2.2 inches
        \spparenmarginleft=2.2in
        % wide 1.5 inches
        
        
        % other standards
        \gdef\spspeechcontdmark{(CONT'D)}%(CONT'D)
        \gdef\speechfurthermark{(MORE)}%(MORE)
        \gdef\sppagenumberdecoration{}%pagenumber without decoration
        \gdef\spheadlinetype{}%no title or whatsoever in the headline
        
    }{}
    \ifthenelse{\equal {\scripttype} {bbccinema}} 
    {
        %BBC Movie Screenplay
    }{}
    \ifthenelse{\equal {\scripttype} {bbctv}} 
    {
        %BBC TV Screenplay
    }{}
    \ifthenelse{\equal {\scripttype} {bbctvdrama}} 
    {
        %BBC TV Taped Drama
    }{}
    \ifthenelse{\equal {\scripttype} {bbctvsitcom}} 
    {
        %BBC TV Taped Sitcom
    }{}
    \ifthenelse{\equal {\scripttype} {bbctvlive}} 
    {
        %BBC TV Taped-Live
    }{}
    \ifthenelse{\equal {\scripttype} {bbctvus3}} 
    {
        %BBC TV US Three Cameras
    }{}
    \ifthenelse{\equal {\scripttype} {bbcradiocue}} 
    {
        %BBC Radio Cue Style
    }{}
    \ifthenelse{\equal {\scripttype} {bbcradioscene}} 
    {
        %BBC Radio Scene Style
    }{}
    \ifthenelse{\equal {\scripttype} {bbcradiousdrama}} 
    {
        %BBC Radio US Drama
    }{}
    \ifthenelse{\equal {\scripttype} {bbcstageuk}} 
    {
        %BBC Stage UK
    }{}
    \ifthenelse{\equal {\scripttype} {bbcstageus}} 
    {
        %BBC Stage US
    }{}
}


%
% Output-Routine rewritten
%
\output={%
    \dimen0=\textheight% setting the textheight for our output
    \ifx\LR\empty \else
        \ifx L\LR \setlength{\hoffset}{0.0truein} \gdef\LR{R}
        \else \setlength{\hoffset}{0.5truein} \gdef\LR{L}
        \fi%
    \fi%
    %\shipout\vbox to 62\lineskip%
    \shipout\vbox to \textheight%
    {%
        \boxmaxdepth=\maxdepth%
        \spheadline%
        \sppagebody%
        \spfootline%
    }%
    \unvbox255 \penalty\outputpenalty % put back unused text
    \addtocounter{page}{1}
}

\newcommand{\spheadline}
{%  Act/scene header and page number
    {%
    \ifcase1\expandafter\relax\splitbotmark\fi%
    \ifthenelse{\equal{\spheadlinetype}{title}}{\MakeUppercase{-TODO-}}{}%
    \ifthenelse{\equal{\sppagenumbervalign}{top}}{\sppagenumberreadytogo}{}%
    }%
    \vskip\lineskip%
}

\newcommand{\spfootline}%
{%
    {%
    \ifthenelse{\equal{\sppagenumbervalign}{bottom}}{\sppagenumberreadytogo}{}%
    }%
}

\newcommand{\sppagebody}
{%
    %\ifthenelse{\equal{\spsplitblockcontdmark}{}}{an}{aus \spsplitblockcontdmark}% e.g. (CONT'D)
    \ifcase2\expandafter\relax\splitbotmark\fi   % So-and-so (CONT'D) \nukeline
    \ifcase3\expandafter\relax\botmark\fi        % \nukeline for (MORE)
    \ifcase5\expandafter\relax\botmark\fi        % \nukelines for CONTINUED
    {%
        \vbadness=10000
        \setbox0=\vsplit255 to \dimen0             % split to new height
        \unvbox0                                   % put page into output
    }%
    \ifcase4\expandafter\relax\splitbotmark\fi   % (MORE)
    \ifcase6\expandafter\relax\splitbotmark\fi   %   CONTINUED
    %\ifthenelse{\equal{\spsplitblockfurthermark}{}}{an}{aus \spsplitblockfurthermark}% e.g. (MORE)
    \kern-\dimen0 \vfil % kern keeps \vfil from being discarded
}
\newcommand{\sppagebodymarksplitbegin}%markers for splits e.g. (MORE)
{}
\newcommand{\sppagebodymarksplitend}%markers for splits e.g. (CONT'D)
{}

%
% supporting the correct pagebreak for dialogs and other fine friends
%
\newcommand{\nukeline}%
{%
    \advance\dimen0 by -\lineskip%
}
\newcommand{\mymark}
{%
    {%
        %\header \noexpand\or%
        \contprevscene\noexpand\or%
        \contprevdialog\noexpand\or%
        \contdialoga\noexpand\or%
        \contdialogb\noexpand\or%
        \contscenea\noexpand\or%
        \contsceneb %\noexpand\or
        % \contrev
    }%
}
\newcommand{\contprevscene}{}
\newcommand{\contprevdialog}{}
\newcommand{\contdialoga}{}
\newcommand{\contdialogb}{}
\newcommand{\contscenea}{}
\newcommand{\contsceneb}{}
\newcommand{\stage}%
{%
    \penalty10000
    \gdef\contprevdialog{}
    \gdef\contdialoga{}
    \gdef\contdialogb{}
    \expandafter\mark\mymark
    \penalty-100
    %\margins{0in}{\hsize}
    \parskip\baselineskip
}




%
%   Redefining maketitle - creates a title-page
%
\newcommand{\maketitle}
{
}

%
%   Dialog - even if it' a monolog
%
\newcommand{\dialog}[2]
{%
    \gdef\spsplitblockfurthermark%
        {\hskip\spcharnamemarginleft\spspeechfurthermark}%
    \gdef\spsplitblockcontdmark%
        {\hskip\spcharnamemarginleft\MakeUppercase{#1} \spspeechcontdmark}%
    {%
    \penalty10000% make sure we don't break until after the clear mark
    \gdef\contprevdialog{}
    \gdef\contdialoga{}
    \gdef\contdialogb{}
    \expandafter\mark\mymark
    \penalty-100 % OK to break now
    %\parskip\lineskip

    \begin{margins}{\spcharnamemarginleft}{\spcharnamemarginright}%
        \MakeUppercase{#1} % name of the speaker
        \def\spcurrentspeaker{#1}%
        \ifx\splastspeaker\spcurrentspeaker%continued dialogue?
            \spspeechcontdmark%
        \fi%
    \end{margins}%
    
    \gdef\contprevdialog
    {%
        \nukeline%
        {\uppercase{#1} \spspeechcontdmark}% e.g. (CONT'D) - pagebreak for dialog
    }
    \gdef\contdialoga{\nukeline}%
    \gdef\contdialogb{{\spspeechfurthermark}}% e.g. (MORE) - pagebreak for dialog
    \expandafter\mark\mymark%
    
    \begin{margins}{\spdialoguemarginleft}{\spdialoguemarginright}%
        %the speech itself
        \penalty10000
        #2%
    \end{margins}%
    
    
  
    \stage
    
    \gdef\splastspeaker{#1} %remember this speaker
    }
    \gdef\spsplitblockfurthermark{tt}
    \gdef\spsplitblockcontdmark{tt}
}

%
%   Creates the typical script ending
%
\newcommand{\theend}
{
    
}

%
% Helpful functions
%
% area with changed margins
\def\margins#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endmargins=\endlist 
%current Pagenumber with decoration
\newcommand{\sppagenumberdecorated}
{
    \ifthenelse{\equal{\sppagenumberdecoration}{line}}{-}{}%
    \the\value{page}%
    \ifthenelse{\equal{\sppagenumberdecoration}{point}}{\rlap{.}}{}%
    \ifthenelse{\equal{\sppagenumberdecoration}{line}}{-}{}%
}
%pagenumberwithalign
\newcommand{\sppagenumberreadytogo}
{
    \ifnum\value{page}>0%
        \ifthenelse{\equal{\sppagenumberhalign}{right}}{\hfill}{}%
        \ifthenelse{\equal{\sppagenumberhalign}{center}}%
        {\centerline{\sppagenumberdecorated}}%
        {\sppagenumberdecorated}%
        \ifthenelse{\equal{\sppagenumberhalign}{left}}{\hfill}{}%
    \fi
}



%
% Options
%
% Oscar
\DeclareOption{oscar}{\renewcommand{\scripttype}{oscar} \screenplayer}
\DeclareOption{movie}{\renewcommand{\scripttype}{oscar} \screenplayer}
%BBC Cinema
\DeclareOption{bbccinema}{\renewcommand{\scripttype}{bbccinema} \screenplayer}
\DeclareOption{picture}{\renewcommand{\scripttype}{bbccinema} \screenplayer}
%BBC Stage UK
\DeclareOption{bbcstageuk}{\renewcommand{\scripttype}{bbcstageuk} \screenplayer}
\DeclareOption{theatre}{\renewcommand{\scripttype}{bbcstageuk} \screenplayer}
%BBC Stage US
\DeclareOption{bbcstageus}{\renewcommand{\scripttype}{bbcstageus} \screenplayer}
\DeclareOption{theater}{\renewcommand{\scripttype}{bbcstageus} \screenplayer}


\DeclareOption*{% 
    \PackageWarning{fred}{Unknown option ‘\CurrentOption’}%
}
\ProcessOptions\relax
