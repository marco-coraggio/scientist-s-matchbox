% COPYRIGHT INFO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (c) 2019 Marco Coraggio, CC BY-NC-SA
% (Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License)  
% https://creativecommons.org/licenses/by-nc-sa/4.0/


% CLASS OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Send every option not handled here to the original class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\def\clsOptNumCols{onecolumn}
\DeclareOption{onecolumn}{\def\clsOptNumCols{onecolumn}}
\DeclareOption{twocolumn}{\def\clsOptNumCols{twocolumn}}

\def\isUseThightHeaders{0}
\DeclareOption{looseheaders}{\def\isUseThightHeaders{0}}
\DeclareOption{thightheaders}{\def\isUseThightHeaders{1}}

\def\dateMode{1}
\DeclareOption{nodate}{\def\dateMode{0}}
\DeclareOption{todaydate}{\def\dateMode{1}}
\DeclareOption{fixeddate}{\def\dateMode{2}}

\def\bibStyleMode{0}
\DeclareOption{numberrefs}{\def\bibStyleMode{0}}
\DeclareOption{authorrefs}{\def\bibStyleMode{1}}

\def\clsOptPaperSize{a4paper}
\DeclareOption{letterpaper}{\def\clsOptPaperSize{letterpaper}}
\DeclareOption{legalpaper}{\def\clsOptPaperSize{legalpaper}}
\DeclareOption{executivepaper}{\def\clsOptPaperSize{executivepaper}}
\DeclareOption{a4paper}{\def\clsOptPaperSize{a4paper}}
\DeclareOption{a5paper}{\def\clsOptPaperSize{a5paper}}
\DeclareOption{b5paper}{\def\clsOptPaperSize{b5paper}}

\ProcessOptions\relax
\LoadClass[\clsOptPaperSize,\clsOptNumCols]{article}


% PACKAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Text packages ----------------------------------
\RequirePackage{newtxtext}      % text font, must be before math font
\RequirePackage{newtxmath}      % font for math. must be called after amsmath
\RequirePackage[T1]{fontenc}    % font encodings and compatibility 
\RequirePackage[shortlabels]{enumitem}  % better enumerate
\RequirePackage[svgnames]{xcolor}       % colors
\RequirePackage{soul}           % highlight, strikeout, not strictly required
\RequirePackage{lipsum}         % automatic text blocks, not strictly required


% Figures packages -------------------------------
\RequirePackage[caption=false,font=footnotesize]{subfig}
\RequirePackage{graphicx}	          % allows figures
\RequirePackage[export]{adjustbox}  % use max width in includegraphics
\RequirePackage{booktabs}   	      % improve tables
%\RequirePackage{tabularx}		      % for paragraph-like columns in tables
%\RequirePackage{siunitx}           % align tables entries to decimal point
%\RequirePackage{multirow}  	      % use multirow in table columns


% Structure packages -----------------------------
\RequirePackage{geometry}         % change margins
\RequirePackage{fancyhdr}         % custom headers/footers
\RequirePackage{titlesec}         % custom section titles
\ifnum\isUseThightHeaders=1
	\RequirePackage{titling}        % to use \droptitle
\fi
\RequirePackage{abstract}		      % custom abstract
\RequirePackage[hidelinks]{hyperref}  % clickable cross-referencing
\RequirePackage{datetime}		      % customize date format


% Custom packages --------------------------------
\RequirePackage{\CurrentFilePath/SMarticle_colors}
\RequirePackage{\CurrentFilePath/SMarticle_math_macros}
\RequirePackage{\CurrentFilePath/SMarticle_math_box}
\RequirePackage{\CurrentFilePath/SMarticle_theorems}
\RequirePackage{\CurrentFilePath/SMarticle_algorithms}


% STRUCTURE AND SETTINGS %%%%%%%%%%%%%%%%%%%%%%%%%
% Various settings -------------------------------
\graphicspath{{figures/}}         % set images directory
\numberwithin{equation}{section}	% equations numbered according to sections
\allowdisplaybreaks               % page-break "align" equations


% Layout -----------------------------------------
\ifnum\pdfstrcmp{\clsOptNumCols}{onecolumn}=0
	\geometry{
		top    = 1cm,    % top margin
		bottom = 1cm,  % bottom margin
		left   = 4cm,    % left margin
		right  = 4cm,    % right margin
		includehead,     % include space for a header
		includefoot,     % include space for a footer
	}
\else\ifnum\pdfstrcmp{\clsOptNumCols}{twocolumn}=0
	\geometry{
		top = 1cm,       % top margin
		bottom = 1cm,  % bottom margin
		left = 1.5cm,    % left margin
		right = 1.5cm,   % right margin
		includehead,     % include space for a header
		includefoot,     % include space for a footer
	}
	\setlength{\columnsep}{5mm}  % column separation width
	% Make tables footnotesize
	\let\oldtabular\tabular
	\renewcommand{\tabular}{\footnotesize\oldtabular}
\else
  \GenericError{}{Value of \protect\numCols\space is not acceptable}{}{}
\fi\fi
\newlength{\runinsep}\setlength{\runinsep}{0.8em}
\setlist{noitemsep,topsep=0.5ex}     % for itemize and enumerate


% Colors -----------------------------------------
\hypersetup{  % set hyperlinks color
  colorlinks,
  linkcolor = {colorLink},
  citecolor = {colorLink},
  urlcolor  = {colorLink}
}


% Headers and Footers ----------------------------
\providecommand{\myHeaderAuthorTitle}{\myTitle} % default header content, can be redefined in main document preamble
\newdateformat{myDateFormat}{\THEDAY \ \monthname[\THEMONTH] \THEYEAR}
\pagestyle{fancy} % enables custom headers/footers

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\let\oldheadrule\headrule
\let\oldfootrule\footrule
\renewcommand{\headrule}{{\color{colorAccent}\oldheadrule}}
\renewcommand{\footrule}{{\color{colorAccent}\oldfootrule}}
%
\lhead{\sffamily \footnotesize \itshape \myHeaderAuthorTitle}
\chead{}
\rhead{}
%
\lfoot{}
\cfoot{\sffamily\footnotesize \thepage}
\rfoot{}

\fancypagestyle{firstpage}{  % page style for first page
	\fancyhf{}
	\lhead{\sffamily \footnotesize \myDocType}
	\chead{}
	\ifnum\dateMode=0
		\rhead{\sffamily \footnotesize}
	\else\ifnum\dateMode=1
		\rhead{\sffamily \footnotesize \myDateFormat\today}
	\else\ifnum\dateMode=2
		\rhead{\sffamily \footnotesize \fixedDate}
	\else
		\GenericError{}{Value of \protect\dateMode\space is not acceptable}{}{}
	\fi\fi\fi
	\lfoot{}
	\cfoot{\sffamily\footnotesize \thepage}
  \rfoot{}
	\renewcommand{\headrulewidth}{0.4pt}
	\renewcommand{\footrulewidth}{0.4pt}
}


% Section titling --------------------------------
\titleformat{\part}[display]{\centering\sffamily\Huge\bfseries}{\textsc{\partname}\thepart\\ \vspace*{1ex}{\Huge\color{colorAccent}------ $\cdot$ ------}}{1.2ex}{\huge}
\titleformat{\chapter}{\sffamily\bfseries\Huge\color{colorAccent}}{\thechapter \	}{10pt}{}
\ifnum\isUseThightHeaders=1
	\titleformat*{\section}{\centering\large\sffamily\color{colorAccent}}
	\titleformat*{\subsection}{\sffamily\color{colorAccent}}
	\titlespacing\section{0pt}{3ex}{1ex}
	\titlespacing\subsection{0pt}{2.5ex}{0.5ex}
\else
	\titleformat*{\section}{\Large\sffamily\color{colorAccent}}
	\titleformat*{\subsection}{\large\sffamily\color{colorAccent}}
\fi
\titleformat*{\subsubsection}{\sffamily\itshape\color{colorAccent}}
% \titleformat*{\paragraph}{\color{colorAccent} \itshape \sffamily}
% \titlespacing{\paragraph}{0pt}{0pt}{10pt}
% \titleformat*{\subparagraph}{\itshape}
% \titlespacing{\subparagraph}{0pt}{0pt}{10pt}

\titleformat{\paragraph}[runin]
  {\normalsize\sffamily\bfseries\color{colorAccent}}{}{0pt}{}[.]
\titlespacing{\paragraph}{0pt}{0pt}{\runinsep}

\titleformat{\subparagraph}[runin]
  {\normalsize\sffamily\itshape}{}{0pt}{}[.]
\titlespacing{\subparagraph}{0pt}{0pt}{\runinsep}


% Abstract formatting ----------------------------
\renewcommand{\abstractname}{}      % clear abstract title
\renewcommand{\absnamepos}{empty}   % default: 'center'
\renewcommand{\absrightindent}{0cm}
\renewcommand{\absleftindent}{0cm}
\renewcommand{\abstitleskip}{0ex}

\let\oldabstract\abstract
\let\oldendabstract\endabstract

\renewenvironment{abstract}{%
  \oldabstract%
  \noindent\normalsize{\color{colorAccent}{\textsf{\textbf{Abstract.}\hspace{\runinsep}}}}%
}{%
  \oldendabstract%
	\vspace{3ex}%
}


% Citations --------------------------------------
\ifnum\bibStyleMode=0       % numbered references
	\RequirePackage[numbers]{natbib}
	\newcommand{\bibliographyStyleName}{IEEEtran}
\else\ifnum\bibStyleMode=1  % author-year references
	\RequirePackage[square]{natbib}
	\newcommand{\bibliographyStyleName}{IEEEtranSN}
	\renewcommand{\cite}{\citep} 
\else
	\GenericError{}{Value of \protect\bibStyleMode\space is not acceptable}{}{}
\fi\fi
\setlength{\bibsep}{0pt plus 0.3ex}  % separation between references


% FRONT MATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\styleAuthor}{\color{colorAccent}\normalsize \sffamily \itshape}
\newcommand{\styleAffiliation}{\color{colorAccent}\small \sffamily \itshape}

\title{\color{colorAccent}{\Huge \sffamily \myTitle}}%
\ifnum\isUseThightHeaders=1
	\setlength{\droptitle}{-7ex}	% remove space above title
\fi
\author{\myAuthor}
\date{}
\renewcommand\footnotemark{}

% Remove space for date if blank
\ifx\@date\empty
\patchcmd{\@maketitle}{{\@bspredate \@date \@bspostdate} \maketitlehookd \par \vskip 1.5em}{\vskip 0.5em}{}{}
\fi