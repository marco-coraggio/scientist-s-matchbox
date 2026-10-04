% COPYRIGHT INFO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) 2019 Marco Coraggio, CC BY-NC-SA
% (Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License)
% https://creativecommons.org/licenses/by-nc-sa/4.0/
%
% Using the Metropolis theme by Matthias Vogelgesang (https://github.com/matze/mtheme)


% CLASS OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Send every option not handled here to the original class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

\def\clsOptFontSize{12pt}
\DeclareOption{8pt}{\def\clsOptFontSize{8pt}}
\DeclareOption{9pt}{\def\clsOptFontSize{9pt}}
\DeclareOption{10pt}{\def\clsOptFontSize{10pt}}
\DeclareOption{11pt}{\def\clsOptFontSize{11pt}}
\DeclareOption{12pt}{\def\clsOptFontSize{12pt}}
\DeclareOption{14pt}{\def\clsOptFontSize{14pt}}
\DeclareOption{17pt}{\def\clsOptFontSize{17pt}}
\DeclareOption{20pt}{\def\clsOptFontSize{20pt}}

\ProcessOptions\relax
\LoadClass[\clsOptFontSize,aspectratio=169,onlytextwidth]{beamer}
\usetheme{metropolis}


% PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Text packages ----------------------------------
\RequirePackage{notomath}            % math font
\RequirePackage[sfdefault]{roboto}   % text font
\RequirePackage[breakable,skins,raster]{tcolorbox} % boxes
\RequirePackage[T1]{fontenc}      % for font encodings and compatibility
\RequirePackage[style=verbose,backend=bibtex,citetracker=false,ibidtracker=false]{biblatex} % citations
\RequirePackage{tikz}                % for background drawings


% Figures packages -------------------------------
\RequirePackage[export]{adjustbox}  % use max width in includegraphics
\RequirePackage{booktabs}           % for tables


% Structure Packages -----------------------------
\RequirePackage{appendixnumberbeamer} % to have numbers in appendix


% Custom packages --------------------------------
\RequirePackage{\CurrentFilePath/SMbeamer_colors}
\RequirePackage{\CurrentFilePath/SMbeamer_measurements}
\RequirePackage{\CurrentFilePath/SMbeamer_math_macros}
\RequirePackage{\CurrentFilePath/SMbeamer_boxes}
\RequirePackage{\CurrentFilePath/SMbeamer_frames}


% STRUCTURE AND SETTINGS %%%%%%%%%%%%%%%%%%%%%%%%%
% Various settings -------------------------------
\graphicspath{{figures/}}       % set images directory
\usefonttheme[onlymath]{serif}  % use serif font for math
\metroset{   % theme settings
  sectionpage = simple, % without progression bar
  block       = fill,   % colored boxes by the theme
  numbering   = none,   % I redefined numbering
}


% Layout -----------------------------------------
\setlength{\parskip}{0.7ex}
\AddToHook{cmd/itemize/after}{\setlength{\itemsep}{0.7ex}}
\AddToHook{cmd/enumerate/after}{\setlength{\itemsep}{0.7ex}}
\setlength{\leftmargini}{10pt}  % left margin with lists
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}
\setbeamersize{%
  text margin left  = \sideMargin,
  text margin right = \sideMargin
  }

% Fixes bad spacing after math environments
\AfterEndEnvironment{displaymath}{\par}
\AfterEndEnvironment{equation}{\par}
\AfterEndEnvironment{equation*}{\par}
\AfterEndEnvironment{align}{\par}
\AfterEndEnvironment{align*}{\par}
\AfterEndEnvironment{gather}{\par}
\AfterEndEnvironment{gather*}{\par}
\AfterEndEnvironment{multline}{\par}
\AfterEndEnvironment{multline*}{\par}

\setbeamertemplate{section in toc}[sections numbered]


% Font colors ------------------------------------
\setbeamercolor{normal text}{fg=colorText, bg=colorFrame}
\setbeamercolor{alerted text}{fg=colorAccentLight}
\setbeamercolor{frametitle}{fg=colorAccent, bg=colorFrame}
\setbeamercolor{caption}{fg=colorTextLight} 
\setbeamercolor{footnote}{fg=colorTextLight}
\setbeamercolor{title}{fg=colorAccent}
\setbeamercolor{date}{fg=colorEventAndDate}
\setbeamercolor{author}{fg=colorAccent}
\setbeamercolor{institute}{fg=colorAccent}

\setbeamercolor{bibliography item}{fg=colorTextLight}
\setbeamercolor{bibliography entry author}{fg=colorTextLight}
\setbeamercolor{bibliography entry title}{fg=colorTextLight}
\setbeamercolor{bibliography entry location}{fg=colorTextLight}
\setbeamercolor{bibliography entry note}{fg=colorTextLight}

\setbeamertemplate{itemize items}{\color{colorAccent}\textbullet}
\setbeamertemplate{enumerate items}{\color{colorAccent}\insertenumlabel.}
\setbeamertemplate{enumerate subitem}{\color{colorAccent}\insertsubenumlabel.}

\setbeamercolor{section title}{fg=colorFrame}%
\setbeamercolor{subsection title}{fg=colorAccent}%


% Font sizes and styles --------------------------
\setbeamerfont{alerted text}{series=\bfseries}
\setbeamerfont{frametitle}{size=\large, series=\bfseries}
\setbeamerfont{title}{size=\Large, series=\bfseries}
\setbeamerfont{caption}{size=\scriptsize}
\setbeamerfont{footnote}{size=\tiny}
\setbeamerfont{institute}{size=\scriptsize, shape=\itshape}
\setbeamerfont{date}{size=\small}

\setbeamerfont{bibliography item}{size=\tiny}
\setbeamerfont{bibliography entry author}{size=\tiny}
\setbeamerfont{bibliography entry title}{size=\tiny}
\setbeamerfont{bibliography entry location}{size=\tiny}
\setbeamerfont{bibliography entry note}{size=\tiny}

\AtBeginEnvironment{tabular}{\small}


% Hyperlinks -------------------------------------
\hypersetup{
  colorlinks = true,
  linkcolor  = .,      % "inherit current text color"
  urlcolor   = colorLink,
  citecolor  = colorLink
}


% Frame titles -----------------------------------
\newcommand{\setFrameTitle}{%
  \setbeamertemplate{frametitle}{\nointerlineskip%
    \begin{beamercolorbox}[wd=\paperwidth,sep=0pt,leftskip=\sideMargin,rightskip=\sideMargin,vmode]{}%
      \vspace{\topMargin}% margin between top and title
      \vspace{\convertedLength{0.3cm}}% small margin above title
      \vphantom{Ag}\insertframetitle% vphantom to ensure consistent vertical space
      \vspace{\convertedLength{0.3cm}}% small margin below title
    \end{beamercolorbox}\nointerlineskip%
    \begin{beamercolorbox}[wd=\paperwidth,leftskip=\sideMargin,rightskip=\sideMargin,ht=3.25pt,sep=0pt,dp=0pt]{}%
      \begin{tikzpicture}
        \draw[colorAccent!50, line width=0.75pt,line cap=rect](0,0) -- (\textwidth,0);
        \draw[black!4, line width=1.5pt,line cap=rect](0,-1pt) -- (\textwidth,-1pt);
        \draw[black!2, line width=1.5pt,line cap=rect](0,-2.25pt) -- (\textwidth,-2.25pt);
      \end{tikzpicture}%
    \end{beamercolorbox}%
    \vspace*{\convertedLength{-0.5cm}}
  }%
}
\setFrameTitle  % set the frametitle template for all frames

\setbeamertemplate{frametitle continuation}{%
	\normalfont \ (\romannumeral \insertcontinuationcount) % font kind for frametitle continuation (e.g. references)
}


% Footline ---------------------------------------
% Footline used also to count as bottom margin
\newcommand{\setFootline}{%
  \setbeamertemplate{footline}{%
    \begin{beamercolorbox}[wd=\paperwidth,right,rightskip=\rightMarginPageNumber,ht=\heightPageNumber,vmode]{}% \heightPageNumber changes depending on [c] or [t] option
      % Footnote is always printed above the footline.
      % If [t] is given, footline height can be put to 0 so that footnote is printed at the bottom of the frame. Otherwise, if [c] is given, footline height must be > 0, because footline height is used to center the text in the frame. This will cause the footnote not to be printed at the bottom of the frame.
      \footnotesize\color{colorPageNumber}\insertframenumber%
      \vspace{\bottomMargin}
    \end{beamercolorbox}%
  }%
}

\setFootline

\newcommand{\setFootlineAppendix}{%
  \setbeamertemplate{footline}{%
    \begin{beamercolorbox}[wd=\paperwidth,right,rightskip=\rightMarginPageNumber,ht=\heightPageNumber,vmode]{}%
      \footnotesize\color{colorPageNumber}A\insertframenumber%
      \vspace{\bottomMargin}
    \end{beamercolorbox}%
  }%
}


% Title page -------------------------------------
\setbeamertemplate{title page}{%
  \drawBorders%
  \ifbeamer@centered\else\vfill\fi  % if [t] class option is given, to center the slide
  \centering%
  \begin{minipage}[c][\convertedLength{4.5cm}][c]{\textwidth}%
    \centering\inserttitlegraphic%
  \end{minipage}\par\nointerlineskip%
  \begin{tikzpicture}
    \draw[colorAccent, line width=1pt,line cap=rect](0,0) -- (\textwidth,0);
    \draw[black!10, line width=1.5pt,line cap=rect](0,1.25pt) -- (\textwidth,1.25pt);
    \draw[black!5, line width=1.5pt,line cap=rect](0,2.5pt) -- (\textwidth,2.5pt);
  \end{tikzpicture}\par\nointerlineskip%
  \begin{minipage}[c][\convertedLength{5cm}][c]{\textwidth}%
    \centering
    {\usebeamerfont{title}\usebeamercolor[fg]{title}\inserttitle}%
  \end{minipage}\par\nointerlineskip%
  \begin{tikzpicture}
    \draw[colorAccent, line width=1pt,line cap=rect](0,0) -- (\textwidth,0);
    \draw[black!10, line width=1.5pt,line cap=rect](0,-1.25pt) -- (\textwidth,-1.25pt);
    \draw[black!5, line width=1.5pt,line cap=rect](0,-2.5pt) -- (\textwidth,-2.5pt);
  \end{tikzpicture}\par\nointerlineskip%
  \begin{minipage}[c][\convertedLength{4.5cm}][c]{\textwidth}%
    \centering%
    {\usebeamerfont{author}\usebeamercolor[fg]{author}\insertauthor\par}%
    \vspace{\convertedLength{0.2cm}}%
    {\usebeamerfont{institute}\usebeamercolor[fg]{institute}\insertinstitute\par}%    
    \vspace{\convertedLength{0.65cm}}%    
    {\usebeamerfont{date}\usebeamercolor[fg]{date}\insertdate\par}%
  \end{minipage}\par%
  \ifbeamer@centered\else\vfill\fi
}


% Captions ---------------------------------------
\setbeamertemplate{caption}{\raggedright\insertcaption\par}  % style of caption


% Footnotes --------------------------------------
\AtBeginEnvironment{frame}{\setcounter{footnote}{0}} % Restart counter at each frame

\renewcommand{\footnoterule}{\kern-3pt\color{colorFootnoteSeparator}\hrule width 0.4\linewidth height 0.5pt\kern2pt}
\setbeamertemplate{footnote}{
  \parindent 0pt\noindent\raggedright
  \usebeamerfont{footnote}\insertfootnotemark\,\insertfootnotetext\par
}

% Plain citation format: no bold/italic, commas between units, no "In:"
\DeclareFieldFormat*{title}{\normalfont\mkbibquote{#1}}
\DeclareFieldFormat*{journaltitle}{\itshape#1}
\renewbibmacro*{in:}{}
\renewcommand*{\newunitpunct}{\addcomma\space}

% use [1] as footnote rather than ^1
\def\@makefnmark{{{\usebeamerfont*{footnote mark}[\@thefnmark]}}}
%
\def\@makefntext#1{%
  \def\insertfootnotetext{\ #1}%
  \def\insertfootnotemark{\@makefnmark}%
  \usebeamertemplate***{footnote}
}
\let\oldfootcite\footcite
\patchcmd{\blx@mkbibfootnote}{\unspace}{}{}{} % normally \footcite and \footnote removes the space before. This prevents it


% Bibliography -----------------------------------
\addbibresource{\myBibliographyFile}  % source of bibliography
\setbeamertemplate{bibliography item}{} % no symbol for bib items


% Appendix ---------------------------------------
\AddToHook{cmd/appendix/after}{%  % add custom code after \appendix
  \setFrameTitle%
  \setFootlineAppendix%
}


% FRONT MATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{\myTitle}
\subtitle{\mySubtitle}
\author{\myAuthor}
\date{\myEventAndDate}
\institute{\myInstitution}
\titlegraphic{\myLogo}
