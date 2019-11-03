% AUTHOR: Ruslan Kiianchuk <ruslan.kiianchuk@gmail.com>
% DSTU 3008-95 implementation for LaTeX.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dstu3008}[2013/05/27 Typography guidelines. Documentation.
Scientific and Technical Reports.]
\typeout{Note that this style tries to fulfill DSTU 3008-95
  requirements but it is not official.}

% DSTU 3008 implies A4 paper format.
\PassOptionsToClass{a4paper, 14pt}{extreport}

% Assume that any undefined option will be understood by the base class:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extreport}}
\ProcessOptions\relax
\LoadClass{extreport}

% Functional packages for generating correct PDF
% ==============================================

\RequirePackage{cmap}  % make PDF searchable and copyable.

% Additional useful packages for content formatting.
\RequirePackage{multirow}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{array}
\RequirePackage{graphicx}
\RequirePackage[usenames]{xcolor}
\RequirePackage{longtable}
\RequirePackage[algochapter, boxed]{dstu3008/algorithm2e2013}
\RequirePackage{appendix}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{listingsutf8}
\RequirePackage{etoolbox}


% Multilanguage support
% =====================

\RequirePackage{fontspec}
\setmainfont{CMU Serif}
\RequirePackage[russian, ukrainian, english]{babel}

\addto\captionsenglish{\renewcommand{\abstractname}{\texorpdfstring{\MakeUppercase{Abstract}}{}}}
\addto\captionsenglish{\renewcommand{\contentsname}{\texorpdfstring{\MakeUppercase{Contents}}{}}}
\addto\captionsenglish{\renewcommand{\refname}{\texorpdfstring{\MakeUppercase{References}}{}}}
\addto\captionsenglish{\renewcommand{\bibname}{\texorpdfstring{\MakeUppercase{References}}{}}}
\addto\captionsenglish{\renewcommand{\nomname}{\texorpdfstring{\MakeUppercase{List of abbreviations}}{}}}
\addto\captionsenglish{\renewcommand{\listalgorithmcfname}{List of algorithms}}
\addto\captionsenglish{\renewcommand{\algorithmcfname}{\normalfont Algorithm}}
\addto\captionsenglish{\renewcommand{\lstlistingname}{Listing}}
\addto\captionsenglish{\renewcommand{\appendixname}{\texorpdfstring{\MakeUppercase{Appendix}}{}}}
\addto\captionsenglish{\renewcommand{\appendixpagename}{\texorpdfstring{\MakeUppercase{Appendices}}{}}}
\addto\captionsenglish{\renewcommand{\appendixtocname}{\texorpdfstring{\MakeUppercase{Appendix}}{}}}

\addto\captionsukrainian{\renewcommand{\abstractname}{\texorpdfstring{\MakeUppercase{Реферат}}{}}}
\addto\captionsukrainian{\renewcommand{\contentsname}{\texorpdfstring{\MakeUppercase{Зміст}}{}}}
\addto\captionsukrainian{\renewcommand{\refname}{\texorpdfstring{\MakeUppercase{Перелік посилань}}{}}}
\addto\captionsukrainian{\renewcommand{\bibname}{\texorpdfstring{\MakeUppercase{Перелік посилань}}}{}}
\addto\captionsukrainian{\renewcommand{\figurename}{Рисунок}}
\addto\captionsukrainian{\renewcommand{\tablename}{Таблиця}}
\addto\captionsukrainian{\renewcommand{\lstlistingname}{Лістинг}}
\addto\captionsukrainian{\renewcommand{\listalgorithmcfname}{Список алгоритмів}}
\addto\captionsukrainian{\renewcommand{\algorithmcfname}{\normalfont Алгоритм}}
\addto\captionsukrainian{\renewcommand{\nomname}{\texorpdfstring{\MakeUppercase{Список скорочень}}}{}}
\addto\captionsukrainian{\renewcommand{\lstlistingname}{Лістинг}}
\addto\captionsukrainian{\renewcommand{\appendixname}{\texorpdfstring{\MakeUppercase{Додаток}}{}}}
\addto\captionsukrainian{\renewcommand{\appendixpagename}{\texorpdfstring{\MakeUppercase{Додатки}}{}}}
\addto\captionsukrainian{\renewcommand{\appendixtocname}{\texorpdfstring{\MakeUppercase{Додаток}}{}}}


% DSTU 3008-95 compliant style setup
% ==================================

% HINT: Use \sloppy to avoid overfull hboxes and then \fussy to return defaults.

\RequirePackage{indentfirst}  % Indent first paragraph line.
% Set 1.5 line spacing excluding formulas.
\RequirePackage[nodisplayskipstretch]{setspace}
\onehalfspacing

\RequirePackage{geometry}  % Customize page margins.
\geometry{left=20mm,right=20mm,top=20mm,bottom=20mm}

\setlength{\parindent}{5ex}  % Paragraph first line indent.

\RequirePackage{nomencl}
\RequirePackage{makeidx}
\makenomenclature

% Format nomenclature entries.
\renewcommand{\nomlabel}[1]{{#1}\hfil}
\renewcommand{\nomentryend}{.}
\nomlabelwidth=20mm
\setlength{\nomitemsep}{-\parsep}


% Enumerations and items list
% ---------------------------

\RequirePackage{enumitem}

\renewcommand{\thefootnote}{\arabic{footnote})}  % Footnote format.

% Provide cyrillic letters numbering.
\makeatletter
\AddEnumerateCounter{\asbuk}{\@asbuk}{м)}
\makeatother

\renewcommand{\labelitemi}{-}
\renewcommand{\labelitemii}{\arabic{itemii}}
\renewcommand{\labelitemiii}{\arabic{itemii}.\arabic{itemiii})}

\iflanguage{english}{%
    \renewcommand{\labelenumi}{\alph{enumi})}
    }{%
    \renewcommand{\labelenumi}{\asbuk{enumi})}
}
\renewcommand{\labelenumii}{\arabic{enumii})}
\renewcommand{\labelenumiii}{\arabic{enumii}.\arabic{enumiii})}

% Itemize label format.
\setlist{nolistsep}
\setitemize{noitemsep, topsep=0pt, parsep=0pt, itemindent=7ex, leftmargin=0pt}
\setenumerate{noitemsep, topsep=0pt, parsep=0pt, itemindent=8.2ex, leftmargin=0pt}
\setdescription{noitemsep, topsep=0pt, parsep=0pt, itemindent=5ex, leftmargin=5ex, labelindent=5ex}
\setlist{noitemsep, topsep=0pt, parsep=0pt}

\setlist{font=\normalfont}


% Page header and numbering
% -------------------------

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\fancyheadoffset{0mm}
\fancyfootoffset{0mm}
\setlength{\headheight}{17pt}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% In DSTU 3008 page style for ToC, chapter first page, etc should not differ
% from regular pages format, so set `plain` style the same as `fancy` defined
% above.
\fancypagestyle{plain}{\pagestyle{fancy}}


% Captions
% --------

\RequirePackage[tableposition=top]{caption}
\RequirePackage{subcaption}

\DeclareCaptionLabelSeparator{hyphen}{~---~}
\captionsetup[figure]{format=hang, labelsep=hyphen}
\captionsetup[table]{format=hang, labelsep=hyphen, singlelinecheck=off}
\setlength{\captionmargin}{5ex}
% Caption for algorithms.
\SetAlCapSkip{1em}
\SetAlgoCaptionSeparator{~---~}
\SetKwSty{textmd}

% Label subcaptions as a), b), c)...
\renewcommand{\thesubfigure}{\alph{subfigure}}

% EXAMPLE of subcaptions:
%\begin{figure}[ht]
%\centering
%   \begin{subfigure}[b]{0.3\textwidth}
%       \centering
%       \includegraphics{...}
%       \subcaption{...}
%   \end{subfigure} %
%   \begin{subfigure}[b]{0.6\textwidth}
%       \centering
%       \includegraphics{...}
%       \subcaption{...}
%    \end{subfigure}
%
%    \caption{(a) Description of the first image;
%             (b) Some other description of the second image}
%    \label{fig_somestuff}
%\end{figure}


% Sections title
% --------------

\RequirePackage{titlesec}

% Use \Chapter{...} for special chapter definition.
\newcommand{\Chapterheading}[1]{\clearpage\begin{center}\texorpdfstring{\MakeUppercase{#1}}{}\vspace*{2em}\end{center}}

\makeatletter
\renewcommand{\@dotsep}{2}
\newcommand{\l@Chapter}[2]{{\@dottedtocline{0}{0pt}{0pt}{#1}{#2}}}
\makeatother
\newcommand{\Chapter}[1]{
\Chapterheading{#1}
\addcontentsline{toc}{Chapter}{\texorpdfstring{\MakeUppercase{#1}}{}}}

% Regular chapters and sections style.
\titleformat{\chapter}[hang]
{\filcenter}
{\thechapter}
{8pt}
{\uppercase}

\titleformat{\section}
{\normalsize}
{\thesection}
{1em}{}

\titleformat{\subsection}
{\normalsize}
{\thesubsection}
{1em}{}

\titleformat{\subsubsection}
{\normalsize}
{\thesubsubsection}
{1em}{}

% Vertical spaces between titles and normal text.
\titlespacing{\chapter}{0pt}{-3.5ex}{2.5em}
\titlespacing{\section}{\parindent}{2em}{2em}
\titlespacing{\subsection}{\parindent}{2em}{2em}
\titlespacing{\subsubsection}{\parindent}{2em}{2em}

\renewenvironment{abstract}{%
\begin{center}
    \texorpdfstring{\MakeUppercase{\abstractname}}{}
    \vspace{2em}
\end{center}
}%
{\newline}


% Table of contents
% -----------------

\RequirePackage{tocloft}

% Center and capitalize ToC title.
\renewcommand{\cfttoctitlefont}{\hfill\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hfill}

\renewcommand{\cftbeforetoctitleskip}{-3ex}  % Remove vertical space before ToC.
% Redefine chapters and sections format.
\renewcommand{\cftchappagefont}{\normalsize}
\renewcommand{\cftchapfont}{\normalsize}

\renewcommand{\cftbeforechapskip}{0pt}
\renewcommand{\cftdotsep}{2}
\setcounter{tocdepth}{4}  % Set ToC depth of nested sections to keep track of.
\setcounter{secnumdepth}{4}  % Set titles depth of nested sections to keep track of.

% Make chapter titles uppercase is a pain.
% The internal chapter macros must be redefined.
\makeatletter
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         {\protect\numberline{\thechapter}\texorpdfstring{\MakeUppercase{#1}}{#1}}%
                       \else
                       \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{#1}}{#1}}%
                       \fi
                    \else
                    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeUppercase{#1}}{#1}}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\makeatother

% Enable dot leaders for chapters as well.
\renewcommand\cftchapleader{\cftdotfill\cftdotsep}

% Automatically insert page break after ToC.
\makeatletter
\g@addto@macro\@cfttocfinish{\clearpage}
\makeatother

% Include bibliography in ToC.
\pretocmd{\bibliography}{\addcontentsline{toc}{chapter}{\bibname}}{}{}


% Bibliography
% ------------
\bibliographystyle{ugost2003}
\makeatletter
\def\bibleftdelim{}
\def\bibrightdelim{.}
\def\@biblabel#1{\bibleftdelim #1\bibrightdelim}
\makeatother
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \oldbibliography{#1}%
  \setlength{\itemsep}{-0.8ex}%
}

% Appendices
% ----------

% Redefine title stile for appendices.
\pretocmd{\appendix}{\titleformat{\chapter}[display]{\center\normalfont\normalsize\vspace{-1em}}{\chaptertitlename\vspace{-1em}\hspace{1em}\thechapter}{1pc}{\MakeUppercase}[\thispagestyle{myheadings}]}{}{}


% Counters
% ========

\RequirePackage{lastpage}  % Use \pageref*{LastPage} to address number of pages.

\newcounter{totfigures}
\newcounter{tottables}
\newcounter{totreferences}
\newcounter{totappendices}
\newcommand{\append}[1]{\chapter{#1}}

\providecommand\totfig{??}
\providecommand\tottab{??}
\providecommand\totref{??}
\providecommand\totapp{??}

\makeatletter
\AtEndDocument{%
\addtocounter{totfigures}{\value{figure}}%
\addtocounter{tottables}{\value{table}}%
\immediate\write\@mainaux{%
\string\gdef\string\totfig{\number\value{totfigures}}%
\string\gdef\string\tottab{\number\value{tottables}}%
\string\gdef\string\totref{\number\value{totreferences}}%
\string\gdef\string\totapp{\number\value{totappendices}}%
}%
}
\makeatother

\pretocmd{\chapter}{\addtocounter{totfigures}{\value{figure}}\setcounter{figure}{0}}{}{}
\pretocmd{\chapter}{\addtocounter{tottables}{\value{table}}\setcounter{table}{0}}{}{}
\pretocmd{\bibitem}{\addtocounter{totreferences}{1}}{}{}
\pretocmd{\append}{\addtocounter{totappendices}{1}}{}{}


% Listings
% ========

% Caption customizations for code listings
\DeclareCaptionFont{white}{\color{black}}
\DeclareCaptionFormat{listing}{{\parbox{\textwidth}{\normalsize\normalfont #1#2#3}}}
\captionsetup[lstlisting]{
    format=listing,
    singlelinecheck=false,
}

\lstdefinelanguage{Sage}[]{Python}
{morekeywords={True,False,sage,with}, sensitive=true}

\lstset{
    language=Sage,
    basicstyle=\footnotesize\ttfamily\singlespacing,
    extendedchars=false,
    inputencoding=utf8,  % listings file encoding
    keepspaces=true,  % need to correctly process spaces in cyrillic files
    keywordstyle=\textbf,
    xleftmargin=13pt,
    framexleftmargin=10pt,
    framexrightmargin=3pt,
    framexbottommargin=4pt,
    frame=single,  % adds a frame around the code
    captionpos=t,  % place position at top
    belowcaptionskip=0pt,
    tabsize=4,	% sets default tabsize to 4 spaces
    showspaces=false,  % show spaces adding particular underscores
    showstringspaces=false,  % underline spaces within strings
    showtabs=false,  % show tabs within strings adding particular underscores
    breaklines=true,  % sets automatic line breaking
    numbers=left,  % where to put the line-numbers
    numberstyle=\scriptsize,  % the size of the fonts that are used for the line-numbers
    stepnumber=1,  % the step between two line-numbers. If it's 1 each line will be numbered
    numbersep=15pt  % how far the line-numbers are from the code
}


% Hyperref for online navigation
% ==============================

\RequirePackage{hyperref}

\hypersetup{
    unicode=true,
    colorlinks = true,
    linkcolor = black,
    citecolor = black,
    urlcolor = black,
}

\newcommand{\keywords}[1]{\vspace{1em}\sloppy \MakeUppercase{#1}.\fussy}
