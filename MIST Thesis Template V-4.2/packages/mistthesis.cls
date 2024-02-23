% !TEX root = ../thesis.tex

% Thesis style!
% Uses book class, A4, 12pt font
% draft option uses single sided paper

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{packages/mistthesis}[2022/03/27 LtColNyeem]

\newif\if@view
\newif\if@draft

% print/view
% draft/final

%
\DeclareOption{final}{\@draftfalse}
\DeclareOption{draft}{\@drafttrue}
\DeclareOption{print}{\@viewfalse}
\DeclareOption{view}{\@viewtrue \@drafttrue}
\ProcessOptions\relax

%---------------------------------------------------------------
% Single sided if draft, double sided otherwise
\if@draft
	\PassOptionsToClass{oneside}{book}
\fi


%---------------------------------------------------------------
% Load book class
\LoadClass[a4paper,12pt, oneside]{book}


%---------------------------------------------------------------
% Packages
\RequirePackage{geometry, fancyhdr, authblk, datetime, lscape, setspace}
%\RequirePackage[utf8x]{inputenc}
%\RequirePackage[banglamainfont=Kalpurush,  banglattfont=Siyam Rupali]{latexbangla}
% \RequirePackage{setspace}	% \onehalfspace, 1.5 line spacing
\RequirePackage[ linewidth =5 ,%
linecolor=gray,     
skipbelow=0 ,
skipabove =0]{mdframed}


\RequirePackage{times}
%\RequirePackage{graphicx}
\RequirePackage[lq]{packages/mygraphicx}
\graphicspath{{./figures/}}
\RequirePackage[immediate]{silence}
\WarningFilter[temp]{latex}{Command} % silence the warning
\RequirePackage{sectsty}
\DeactivateWarningFilters[temp] % So nothing unrelated gets silenced


%\RequirePackage{chngcntr} 
\RequirePackage{titletoc}
\RequirePackage[toc]{appendix}
\RequirePackage{xpatch}
\xpatchcmd{\addappheadtotoc}{%
	\appendixtocname}{%
	\texorpdfstring{\MakeUppercase{\appendixtocname}}{}}{}{}

%using symbols from other package without using them
\DeclareSymbolFont{symbolsC}{U}{txsyc}{m}{n}
\DeclareMathSymbol{\nthickapprox}{\mathrel}{symbolsC}{"35}
\DeclareMathSymbol{\napprox}{\mathrel}{symbolsC}{"30}

%this is for new rule command for chapter abstract
\newcommand*\varhrulefill[1][0em]{\leavevmode\leaders\hrule height#1\hfill\kern0pt}
\newcommand{\raisedrule}[2][0.1em]{\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill}
% \newcommand{\footref}[1]{$^{\ref{#1}}$}

%%% Algorithm packages
%%  -----------------------
\RequirePackage{algorithm, algorithmic}
% \renewcommand{\algorithmicrequire}{\textbf{Input:}}
% \renewcommand{\algorithmicensure}{\textbf{Output:}}
% \def\STATEX#1{{\def\alglinenumber##1{}\STATE #1}\addtocounter{ALG@line}{-1}}
% %
\newcommand{\func}[1]{\texorpdfstring{\ensuremath{{#1}\left(\cdot\right)}}{Lg}}
\newcommand{\funcc}[2]{\texorpdfstring{\ensuremath{{#1}\left({#2}\right)}}{Lg}}
% % \newcommand\Input{\Statex\hspace*{-\algorithmicindent}\textbf{Input(s):~}}
% % %newcommand for output
% % \newcommand\Output{\Statex\hspace*{-\algorithmicindent}\textbf{Output(s):~}}
%this is for hypothesis, remark and definition
\newtheorem{hypothesis}{Hypothesis}[chapter]
%\newtheorem{remark}{Remark}[chapter]
\newtheorem{state}{Statement}[chapter]
\newtheorem{definition}{Definition}[chapter]

%----------------------------
%\RequirePackage{epstopdf}
%\epstopdfDeclareGraphicsRule{.tif}{png}{.png}{convert #1 \OutputFile}
%\AppendGraphicsExtensions{.tif}
\newcommand{\footlabel}[2]{%
	\addtocounter{footnote}{1}%
	\footnotetext[\thefootnote]{%
		\addtocounter{footnote}{-1}%
		\refstepcounter{footnote}\label{#1} #2}$^{\ref{#1}}$}

\RequirePackage{mfirstuc}
%include the preposition and conjunction used in your thesis title
\MFUnocap{the}\MFUnocap{and}\MFUnocap{in}\MFUnocap{on}
\MFUnocap{of}\MFUnocap{for}\MFUnocap{to}\MFUnocap{based}
\MFUnocap{a}\MFUnocap{an}
%\MFUnocap{to}\MFUnocap{based}

\RequirePackage[section]{placeins}
%discourage floats from getting their own page
\renewcommand\floatpagefraction{.92}
\renewcommand\topfraction{.92}
\renewcommand\bottomfraction{.92}

\RequirePackage[final]{pdfpages}
\RequirePackage[hang, bf, small]{caption}
\RequirePackage{graphicx, pgfplots}
\pgfplotsset{grid style={dashed,gray}}
\pgfplotsset{compat=newest}
\pgfplotsset{plot coordinates/math parser=false}

%this is for algorithmic environment
\RequirePackage{mathrsfs}
\RequirePackage[cmex10]{amsmath}\allowdisplaybreaks
\RequirePackage{amsfonts,  amssymb, array,  mathptmx, mathtools, mdwmath, mdwtab, bigints, amssymb, amsthm, eqparbox}


\RequirePackage{hyperref}
\def\dotsign{\xleaders\hbox to .2em{\d{}}\hfill\d{}}
\def\dashsign{\xleaders\hbox to .5em{\_}\hfill\_}
\hypersetup{
	pageanchor	=	false,
	colorlinks  = true, %Colours links instead of ugly boxes
	urlcolor    = black, %blue!30!black, %Colour for external hyperlinks
	linkcolor   = black, %red!30!black, %Colour of internal links
	citecolor   = black, %red!30!black %Colour of citations
}

\RequirePackage{xcolor, color}
\definecolor{G}{rgb}{0.8,0.8,0.8}
\RequirePackage[framed, numbered, autolinebreaks, useliterate]{mcode}
\lstset{  
	backgroundcolor=\color{white},
	numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
	numbersep=10pt,                   % how far the line-numbers are from the code
	numberstyle=\tiny\color{G},
	rulecolor=\color{G}
}

\RequirePackage{pdflscape}
\RequirePackage{breqn}

\RequirePackage{setspace, sectsty}
% \RequirePackage{setspace}
\RequirePackage[nonindentfirst, bottomtitles, compact, raggedright]{titlesec}
\setdisplayskipstretch{0.5}

%\baselineskip=15pt
\renewcommand{\chaptername}{CHAPTER}
\titleformat{\chapter}[display]
{\large \bfseries \centering\setstretch{1}}{\chaptertitlename\ \thechapter}{-13pt}{\large}
\titlespacing*{\chapter}{-20pt}{-20pt}{25pt}
\titlespacing{\section}{0pt}{0.1\parskip}{-0.7\parskip}
\titlespacing{\subsection}{0pt}{0.15\parskip}{-0.7\parskip}
\titlespacing{\subsubsection}{0pt}{0.35\parskip}{-0.7\parskip}
\allsectionsfont{\singlespacing}
%\chapterfont{\centering\fontsize{14}{16}\selectfont}
\titleformat{\section}{\fontsize{14}{14}\selectfont\bfseries}{\thesection}{1.2em}{}
\titleformat{\subsection}{\fontsize{13}{13}\selectfont\bfseries}{\thesubsection}{1.2em}{}
\titleformat{\subsubsection}{\fontsize{12}{12}\selectfont\bfseries}{\thesubsubsection}{1.2em}{}


\RequirePackage[subfigure, titles]{tocloft}
\newlength\mylength
\settowidth\mylength{0.0001\cftfigpresnum\cftfigaftersnum}
\renewcommand\cftfigpresnum{\figurename~}
\renewcommand\cftfigaftersnum{:}
\addtolength\cftfignumwidth{\mylength}
% 
\renewcommand\cfttabpresnum{\tablename~}
\renewcommand\cfttabaftersnum{:}
\settowidth\mylength{\cfttabpresnum\cfttabaftersnum}
\addtolength\cfttabnumwidth{\mylength}

\AtBeginEnvironment{equation}{\leavevmode\singlespace}
\AfterEndEnvironment{equation}{\endsinglespace\vskip0.5\baselineskip\noindent\ignorespaces}

\pdfminorversion=3

%===========================================
% \newcommand{\onlyauthors}{\author}
% \newcommand{\authorswithroll}{\author}
% Set Margins Command
% setmargins{inner}{outer}{top}{bottom}
\newlength{\@im} \newlength{\@om} \newlength{\@tm} \newlength{\@bm}
\newcommand{\setmargins}[4]{
	\setlength{\@im}{#1} \setlength{\@om}{#2}
	\setlength{\@tm}{#3} \setlength{\@bm}{#4}
	
	\if@view
		\addtolength{\@im}{\@om}
		\setlength{\@om}{0.5\@im}
		\setlength{\@im}{\@om}
	\fi

	\setlength{\topmargin}{-1in}      \addtolength{\topmargin}{\@tm}
	\setlength{\oddsidemargin}{-1in}  \addtolength{\oddsidemargin}{\@im}
	\setlength{\evensidemargin}{-1in} \addtolength{\evensidemargin}{\@om}

	\setlength{\textheight}{\paperheight}
	\addtolength{\textheight}{-\@tm}
	\addtolength{\textheight}{-\headheight}
	\addtolength{\textheight}{-\headsep}
	\addtolength{\textheight}{-\footskip}
	\addtolength{\textheight}{-\@bm}
	
	\setlength{\textwidth}{\paperwidth}
	\addtolength{\textwidth}{-\@im}
	\addtolength{\textwidth}{-\@om}
}

%---------------------------------------------------------------
% Set Margins
\headheight=14.5pt
\setmargins{28mm}{25mm}{25mm}{20mm}
\addtolength{\topmargin}{-6pt}

%---------------------------------------------------------------
% Header and Footer Style
\pagestyle{fancy}
\fancyhf{} % clear all header and footer entries
\renewcommand{\chaptermark}[1]{\markboth{\@chapapp\space\thechapter. #1 }{\thechapter\ #1}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
	\if@draft
		\fancyhead[R]{\itshape{\nouppercase{\rightmark}}}
		\fancyfoot[R]{\thepage}
	\else
		%\fancyhead[LE]{\itshape{\nouppercase{\leftmark}}}
		\fancyhead[RO]{\itshape{\nouppercase{\rightmark}}}
		%\fancyfoot[CE,CO]{\thepage}
		\fancyfoot[C]{\thepage}
	\fi
\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\if@draft \fancyfoot[R]{\thepage}
	\else %\fancyfoot[CE,CO]{\thepage} 
	\fancyfoot[C]{\thepage} \fi
}


%---------------------------------------------------------------
% Line Spacing
% 1.5 line spacing
\onehalfspace
%\doublespace




%***************************************************************
% Function Redefines

%---------------------------------------------------------------
%
% Adds Chapter/Appendix before entry in ToC
\renewcommand{\@chapter}[2][1]{
	\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\typeout{\@chapapp\space\thechapter.}%
			\addcontentsline{toc}{chapter}%
				{\@chapapp\space\protect\numberline{\thechapter}#1}%
		\else
			\addcontentsline{toc}{chapter}{#1}%
		\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
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
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
%---------------------------------------------------------------
% Table of Contents
% Change name from Contents, enable entry in TOC
%\renewcommand{\contentsname}{TABLE OF CONTENTS}
\renewcommand{\contentsname}{CONTENTS}
%\renewcommand{\tableofcontents}{%
	%\if@twocolumn
		%\@restonecoltrue\onecolumn
	%\else
		%\@restonecolfalse
	%\fi
	%\chapter{\contentsname}
		%\@mkboth{\itshape\contentsname}
			%{\contentsname}%
	%\@starttoc{toc}%
	%\if@restonecol\twocolumn\fi
	%}



%---------------------------------------------------------------
% List of Figures
% Enable entry in TOC
\renewcommand{\listoffigures}{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter{\listfigurename}%
		\@mkboth{\itshape\listfigurename}%
			{\listfigurename}%
	\@starttoc{lof}%
	\if@restonecol\twocolumn\fi
	}


%---------------------------------------------------------------
% List of Tables
% Enable entry in TOC
\renewcommand{\listoftables}{%
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter{\listtablename}%
		\@mkboth{\itshape\listtablename}%
			{\listtablename}%
	\@starttoc{lot}%
	\if@restonecol\twocolumn\fi
	}



%---------------------------------------------------------------
% cleardoublepage
% Uses empty page style instead of plain
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}



%---------------------------------------------------------------
% commands for stuff
\def\sep{\textbullet\ }
%\newcommand{\NumberOfAuthors}[1]{\gdef\@NumberOfAuthors{#1}}
\newcommand{\AllSurNames}[1]{\gdef\@AllSurNames{#1}}
\newcommand{\FirstSurname}[1]{\gdef\@FirstSurname{#1}}
\newcommand{\SecondSurname}[1]{\gdef\@SecondSurname{#1}}
\newcommand{\ThirdSurname}[1]{\gdef\@ThirdSurname{#1}}
\newcommand{\FourthSurname}[1]{\gdef\@FourthSurname{#1}}
\newcommand{\StudyType}[1]{\gdef\@StudyType{#1}}
\newcommand{\ThesisType}[1]{\gdef\@ThesisType{#1}}
\newcommand{\DefenseDay}[1]{\gdef\@DefenseDay{#1}}
\newcommand{\DefenseDate}[1]{\gdef\@DefenseDate{#1}}
\newcommand{\FirstStudent}[1]{\gdef\@FirstStudent{#1}}
\newcommand{\SecondStudent}[1]{\gdef\@SecondStudent{#1}}
\newcommand{\ThirdStudent}[1]{\gdef\@ThirdStudent{#1}}
\newcommand{\FourthStudent}[1]{\gdef\@FourthStudent{#1}}
\newcommand{\FirstRoll}[1]{\gdef\@FirstRoll{#1}}
\newcommand{\SecondRoll}[1]{\gdef\@SecondRoll{#1}}
\newcommand{\ThirdRoll}[1]{\gdef\@ThirdRoll{#1}}
\newcommand{\FourthRoll}[1]{\gdef\@FourthRoll{#1}}
%
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\qualifications}[1]{\gdef\@qualifications{#1}}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\deptShort}[1]{\gdef\@deptShort{#1}}
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\MISTcity}[1]{\gdef\@MISTcity{#1}}

\newcommand{\defensedate}[1]{\gdef\@defensedate{#1}}
\newcommand{\session}[1]{\gdef\@session{#1}}
\newcommand{\universityname}[1]{\gdef\@universityname{#1}}


\newcommand{\SupervisorName}[1]{\gdef\@SupervisorName{#1}}
\newcommand{\SupervisorAffiliations}[1]{\gdef\@SupervisorAffiliations{#1}}
\newcommand{\SupervisorInstitute}[1]{\gdef\@SupervisorInstitute{#1}}

\newcommand{\HeadName}[1]{\gdef\@HeadName{#1}}
\newcommand{\HeadAffiliations}[1]{\gdef\@HeadAffiliations{#1}}
\newcommand{\HeadInstitute}[1]{\gdef\@HeadInstitute{#1}}

\newcommand{\InternalName}[1]{\gdef\@InternalName{#1}}
\newcommand{\InternalAffiliations}[1]{\gdef\@InternalAffiliations{#1}}
\newcommand{\InternalInstitute}[1]{\gdef\@InternalInstitute{#1}}

\newcommand{\ExternalName}[1]{\gdef\@ExternalName{#1}}
\newcommand{\ExternalAffiliations}[1]{\gdef\@ExternalAffiliations{#1}}
\newcommand{\ExternalInstitute}[1]{\gdef\@ExternalInstitute{#1}}
\newcommand{\ExternalCity}[1]{\gdef\@ExternalCity{#1}}


%***************************************************************
% New Sections

\newcommand{\@frontchapter}[1]{
	\chapter{#1}
	\@mkboth{\itshape{#1}}{#1}
}


%---------------------------------------------------------------
\newdateformat{mydate}{\monthname~\THEYEAR}
  \makeatletter
  \renewcommand*{\monthnameenglish}[1][\month]{%
    \@orgargctr=#1\relax
    \ifcase\@orgargctr
      \PackageError{datetime}%
        {Invalid Month number \the\@orgargctr}%
        {Month numbers should go from 1 (January) to 12 (December)}%
    \or JANUARY\or FEBRUARY\or MARCH\or APRIL\or MAY\or JUNE\or JULY%
    \or AUGUST\or SEPTEMBER\or OCTOBER\or NOVEMBER\or DECEMBER%
    \else
      \PackageError{datetime}%
        {Invalid Month number \the\@orgargctr}%
        {Month numbers should go from 1 (January) to 12 (December)}%
    \fi
  }%
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover page
% \NewCommandCopy{\makecover}{\maketitle}
\newcommand{\makecover}{
	\thispagestyle{empty}
	\noindent
	\begin{picture}(0,0)(0,0) 
	\setstretch{1.5}
		\put(0,-35){\parbox[t]{\textwidth}{
			\centering 
			%{\Huge\@title} 
			{\Large\mdseries \MakeUppercase{\LARGE\bf\@title}} \\[50mm]}}
		\put(0,-160){\parbox[t]{\textwidth}{
			\centering
			\MakeUppercase{\bf\Large\onlyauthors} \\
			}}
		\put(0,-300){\parbox[t]{\textwidth}{
			\centering
			\setstretch{1}
			\parbox{0.85\textwidth}{\centering\bf\Large{\theThesisType~\MakeUppercase{Engineering Thesis}}}
			 \\[35mm]
			\ifx\@logo\@empty\else
				\parbox{\textwidth}{\centering\@logo}\fi\\[20pt]
			\parbox{\textwidth}{\centering\bf\MakeUppercase{\large\@dept}}\\[1.5ex]
			\parbox{\textwidth}{\centering\bf\MakeUppercase{\large\@university}\\

			\MakeUppercase{\large\bf\@MISTcity}}\\[20mm]

\MakeUppercase{\Large\bf\@DefenseDate}
  %\mydate\today
}}
%		\ifx\@logo\@empty\else
%		\put(0,-300){\parbox{\textwidth}{\centering\@logo}}\fi
\end{picture}
}

%\makeatletter
%\patchcmd{\@maketitle}{\LARGE \@title}{\fontsize{14}{16}\selectfont\@title}{}{}
%\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cover page
% \NewCommandCopy{\makecover}{\maketitle}
\newcommand{\makespine}{
\newpage	\thispagestyle{empty}
	\noindent
	\newgeometry{left=9cm, top=0.5cm, bottom=0.5cm}
	\begin{landscape}
        \begin{mdframed}
            {\centering\qquad\Large\bf\MakeUppercase{\@AllSurNames} \hfill \theThesisType~ENGINEERING THESIS \hfill MIST \sep\MakeUppercase{\@deptShort \sep\number \year\qquad}}
        \end{mdframed}
    \end{landscape}
    \restoregeometry
\newpage
}

%------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page
\renewcommand{\maketitle}{
	\newpage\thispagestyle{empty}
	\noindent
	\begin{picture}(0,0)(0,0)
		\put(0,-35){\parbox[t]{\textwidth}{
			\centering 
			%{\Huge\@title} 
			{\Large\mdseries \MakeUppercase{\@title}} \\[50mm]}}
		\put(0,-160){\parbox[t]{\textwidth}{
			\setstretch{1}
			\centering
			\MakeUppercase{\@author} \\
			}}
		\put(0,-300){\parbox[t]{\textwidth}{
			\centering
			\setstretch{1}
			\parbox{0.8\textwidth}{\centering A Thesis Submitted in Partial Fulfillment of the Requirements for the \\
			{Degree of~\@degree}}
			 \\[37mm]
			\ifx\@logo\@empty\else
				\parbox{\textwidth}{\centering\@logo}\fi\\[20pt]
			\parbox{0.7\textwidth}{\centering\MakeUppercase{\@dept}}\\[1ex]
			\parbox{\textwidth}{\centering\MakeUppercase{\@university}\\

			\MakeUppercase{\@MISTcity}}\\[20mm]

\MakeUppercase{\@DefenseDate}
  %\mydate\today

}}
%		\ifx\@logo\@empty\else
%		\put(0,-300){\parbox{\textwidth}{\centering\@logo}}\fi
\end{picture}
}

%\makeatletter
%\patchcmd{\@maketitle}{\LARGE \@title}{\fontsize{14}{16}\selectfont\@title}{}{}
%\makeatother

%---------------------------------------------------------------
% Statement of Original Authorship
\newcommand{\statementofauthorship}{
	\@frontchapter{Statement of Original Authorship}
	The work  contained in this thesis  has  not been previously  submitted to meet requirements for an award at this or any other higher education institution. To the best of my  knowledge and belief, the thesis  contains  no material previously published or written by another person except where due reference is made.
	\vfill
	\begin{tabular}{ll}
		Signature: & \makebox[50mm]{\hrulefill}\\[6mm]
		Date:      & \makebox[50mm]{\hrulefill}
	\end{tabular}
	\vfill
}

%---------------------------------------------------------------
% Keywords
\newenvironment{keywords}{
	\chapter*{KEYWORDS}}{}

%---------------------------------------------------------------
% Abstract
\newenvironment{abstract}{
	\@frontchapter{ABSTRACT}}{}
%\newenvironment{সারসংক্ষেপ}{
%	\@frontchapter{সারসংক্ষেপ}}{}

%---------------------------------------------------------------
% List of Publications
\newenvironment{listofpublications}{
	\@frontchapter{LIST OF PUBLICATIONS}}{}

%---------------------------------------------------------------
% List of Abbreviations
%\newenvironment{listofabbreviations}{\@frontchapter{LIST OF ABBREVIATIONS}}{}

%---------------------------------------------------------------
% List of Symbols
%\newenvironment{listofsymbols}{\@frontchapter{LIST OF SYMBOLS}}{}

%---------------------------------------------------------------
% List of algorithm
%\newenvironment{listofalgorithms}{
%	\@frontchapter{List of  Algorithms}}{}

%---------------------------------------------------------------
% Acknowledgements
\newenvironment{acknowledgements}{
	\@frontchapter{ACKNOWLEDGEMENTS}}{}

%---------------------------------------------------------------
% Appendix
%\newenvironment{appendix}{
	%\@frontchapter{APPENDIX}}{}



\RequirePackage{xspace}
\makeatletter
\DeclareRobustCommand\onedot{\futurelet\@let@token\@onedot}
\def\@onedot{\ifx\@let@token.\else.\null\fi\xspace}

\def\eg{\emph{e.g}\onedot} \def\Eg{\emph{E.g}\onedot}
\def\ie{\emph{i.e}\onedot} \def\Ie{\emph{I.e}\onedot}
\def\cf{\emph{c.f}\onedot} \def\Cf{\emph{C.f}\onedot}
\def\etc{\emph{etc}\onedot} \def\vs{\emph{vs}\onedot}
\def\wrt{w.r.t\onedot} \def\dof{d.o.f\onedot}
\def\etal{\emph{et~al}\onedot}
\def\@afterindentfalse{\let\if@afterindent\iffalse}
\makeatother
