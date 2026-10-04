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
\LoadClass[\clsOptFontSize]{beamer}
\usetheme{metropolis}


% PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Text packages ----------------------------------
\RequirePackage[sfdefault,lining]{FiraSans} % text font
\RequirePackage{notomath}     % math font
\RequirePackage[breakable,skins,raster]{tcolorbox} % boxes
\RequirePackage[T1]{fontenc}      % for font encodings and compatibility
\RequirePackage[style=verbose,backend=bibtex]{biblatex} % citations


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
\setbeamertemplate{date}{\scriptsize\insertdate\par} % date size in title page
\metroset{   % theme settings
  sectionpage = simple, % without progression bar
  block       = fill,   % colored boxes by the theme
  numbering   = none    % I redefined numbering
}


% Layout -----------------------------------------
\setbeamersize{
  text margin left  = \myMarginSide,
  text margin right = \myMarginSide
  }
\setlength{\leftmargini}{10pt}  % left margin with lists


% Colors -----------------------------------------
\setbeamercolor{normal text}{fg=colorText, bg=colorFrame}
\setbeamercolor{alerted text}{fg=colorAccentLight}

\setbeamercolor{frametitle}{fg=colorFrame, bg=colorAccent}
\setbeamercolor{section title}{fg=colorAccent}
\setbeamercolor{colorFootline}{fg=colorAccent,bg=colorAccent}
\setbeamercolor{colorHeadline}{fg=colorAccent,bg=colorAccent}

\setbeamercolor{titlelike}{fg=colorAccent}
\setbeamercolor{date}{fg=colorAccent}
\setbeamercolor{author}{fg=colorAccent}
\setbeamercolor{institute}{fg=colorEventAndDate}
\setbeamercolor{structure}{fg=colorAccent}
\setbeamercolor{title separator}{fg=colorAccentDark}

\setbeamertemplate{itemize items}{\color{colorText}\textbullet}
\setbeamertemplate{enumerate items}{\color{colorText}\insertenumlabel.}
\setbeamertemplate{enumerate subitem}{\color{colorText}\insertsubenumlabel.}


% Frame titles -----------------------------------
\newcommand{\setFrameTitle}{%
  \setbeamertemplate{frametitle}{\nointerlineskip%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.15ex]%
      {frametitle}%   % color scheme
      \normalfont \Large \hspace*{\myMarginSide+10pt}\insertframetitle \hfill%
      \raisebox{.245ex}{\small {\color{colorBarFrameNumber}\rule[-1.16ex]{0.1ex}{2em}} \hspace*{\myMarginSide-5pt} \insertframenumber}%
      \hspace*{\myMarginSide}%
    \end{beamercolorbox}}%
}
\setFrameTitle  % use style just defined

\newcommand{\setFrameTitleAppendix}{%
  \setbeamertemplate{frametitle}{\nointerlineskip%
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.15ex]%
      {frametitle}%   % color scheme
      \normalfont \Large \hspace*{\myMarginSide+10pt}\insertframetitle \hfill%
      \raisebox{.245ex}{\small {\color{colorBarFrameNumber}\rule[-1.16ex]{0.1ex}{2em}} \hspace*{\myMarginSide-5pt} A\insertframenumber}%
      \hspace*{\myMarginSide}%
    \end{beamercolorbox}}%
}

\setbeamertemplate{frametitle continuation}{%
	\normalfont \ (\romannumeral \insertcontinuationcount) % font kind for frametitle continuation (e.g. references)
}


% Footline ---------------------------------------
\newcommand{\setFootline}{%
  \setbeamertemplate{footline}{\nointerlineskip%
    \begin{beamercolorbox}[wd=\paperwidth,ht=\myWidthHeadFootline,dp=\myWidthHeadFootline]{colorFootline}%
      %
    \end{beamercolorbox}}
  }%
\setFootline % make footline a small blue line


% Captions ---------------------------------------
\renewcommand{\figurename}{} % remove "Figure X:" from caption
\renewcommand{\tablename}{}  % remove "Table X:" from caption
\setbeamertemplate{caption}{\scriptsize\color{colorTextLight}\raggedright\insertcaption\par}  % style of caption


% Bibliography -----------------------------------
\addbibresource{\myBibliographyFile}  % source of bibliography
\AtBeginBibliography{\small}          % font size in bibliography

% use [1] as footnote rather than ^1
\def\@makefnmark{{{\usebeamercolor[fg]{footnote mark}\usebeamerfont*{footnote mark}[\@thefnmark]}}}
%
\def\@makefntext#1{%
  \def\insertfootnotetext{\quad #1}%
  \def\insertfootnotemark{\@makefnmark}%
  \usebeamertemplate***{footnote}
}

\setbeamertemplate{bibliography item}{} % item symbol for bibliography items
\renewcommand{\footnotesize}{\scriptsize}
\setbeamercolor{footnote}{fg=colorAccent} % color of footnote rule line
\newcommand{\footcitespace}{\textcolor{colorFrame}{.}} % necessary before \footcite before \footcite removes spaces


% Appendix ---------------------------------------
\AddToHook{cmd/appendix/after}{%  % add custom code after \appendix
  \setFrameTitleAppendix%
  \setFootline%
}


% FRONT MATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\title{\myTitle}
\subtitle{\mySubtitle}
\author{\myAuthor}
\date{\myInstitution}  % intentionally inverted with institute
\institute{\myEventAndDate}
\titlegraphic{\myLogo}