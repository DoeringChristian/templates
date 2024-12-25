\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sheet}[Cheat Sheet template]


% Options
\RequirePackage{kvoptions}

\DeclareStringOption[3]{columns}

\ProcessKeyvalOptions*

% Baseclass

\def\baseclass{scrartcl}

\PassOptionsToClass{6pt, a4paper, landscape}{\baseclass}
% forward unknown options to class
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{\baseclass}%
}

% Load Baseclass

\ProcessOptions\relax

\LoadClass{\baseclass}


% Scientific

\RequirePackage{amsmath}
\RequirePackage{esint}
\RequirePackage{amssymb}

% Misc

\RequirePackage[english, ngerman]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[pagebackref=true,pdfpagelabels]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{xcolor}

\graphicspath{ {figures/} }

% Geometry

\RequirePackage{geometry}
\geometry{a4paper, landscape, left=6mm,right=6mm, top=6mm, bottom=5mm,includefoot, footskip=1.7em}

% Colors
\colorlet{col_section}{black}
\colorlet{col_subsection}{black}
\colorlet{col_subsubsection}{black}
\colorlet{col_sectionbox}{gray}

% Boxes

\RequirePackage{mdframed}
\global\mdfdefinestyle{sectionbox}{
	startcode={\makeatother\if@nobreak\vspace{3cm}\null\vspace{-3cm}\fi\makeatletter},
	nobreak=true,
	% Margin left, right, bottom and top of the boxes (-1 mm for higher width)
	leftmargin=-1mm,
	rightmargin=-1mm,
	skipbelow=1mm,
	skipabove=1mm,
	% Inner margin of the content of the box
	innerleftmargin=1mm,
	innerrightmargin=1mm,
	innertopmargin=1mm,
	% Colors of lines and background
	backgroundcolor=col_sectionbox!3,
	linecolor=col_sectionbox
}
\newmdenv[style=sectionbox]{sectionbox}

% Chapters and Sections

\RequirePackage{titlesec}

\titleformat{\part}{\pagebreak\huge \bfseries}{}{0em}{\huge \bfseries}
\titleformat{\section}{\Large\bfseries\color{col_section}}{\thesection .}{0.5em}{\color{col_section}}%[\color{col_section} \hrule \hrule]
\titleformat{\subsection}{\large\bfseries\color{col_subsection}}{\thesubsection .}{0.3em}{}
\titleformat{\subsubsection}{\bfseries\color{col_subsubsection}}{\thesubsubsection .}{0.2em}{}
\titleformat{\paragraph}{\bfseries\color{col_paragraph}}{\theparagraph .}{0.2em}{}

\titlespacing{\section}{0em}{1.0em}{0.1em}
\titlespacing{\subsection}{0em}{0.2em}{-0.2em}
\titlespacing{\subsubsection}{0em}{0em}{-0.3em}
\titlespacing{\paragraph}{0em}{0em}{-0.3em}

% Paragraphs

\RequirePackage{parskip} % prevents intend on new paragraph
\setlength{\parskip}{1pt}

% Multicol

\RequirePackage{multicol}			% for columns

% start multicolumn

\AtBeginDocument{ \begin{multicols*}{\sheet@columns} }

		\AtEndDocument{ \label{LastPage} \end{multicols*} }
