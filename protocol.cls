%%%   Danny Awty-Carroll modifyed this from:
%%%%%%%%%%%%%%%%%
% This is altacv.cls (v1.1.3, 30 April 2017) written by
% LianTze Lim (liantze@gmail.com).
%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2003/12/01 or later.
%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{protocol}[2017/04/30 Laboratory protocol template v0.1]

%% v1.1: Optionally load academicons
\newif\if@academicons
\DeclareOption{academicons}{\@academiconstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass{extarticle}

\RequirePackage[margin=2cm]{geometry}
\RequirePackage{fontawesome}

%% v1.1: Optionally load academicons
\if@academicons
  %% Patch to make academicons compilable with XeLaTeX
  \ExplSyntaxOn
  \msg_redirect_name:nnn { fontspec } { font-not-found } { none }
  \ExplSyntaxOff
  \RequirePackage{academicons}
  \newfontfamily{\AI}{academicons.ttf}
\fi


\RequirePackage{xcolor}

\colorlet{accent}{blue!90!black}
\colorlet{heading}{black}
\colorlet{emphasis}{black}
\colorlet{body}{black!80!white}
\newcommand{\itemmarker}{{\small\textbullet}}
\newcommand{\ratingmarker}{\faCircle}

\RequirePackage{tikz}
\usetikzlibrary{arrows}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{enumitem}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\setlist[itemize]{label=\itemmarker}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}
% \RequirePackage{marginfix}

\setlength{\parindent}{0pt}
\newcommand{\divider}{\textcolor{body!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newenvironment{fullwidth}{%
  \begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
  {\end{adjustwidth}}

\newcommand{\mailsymbol}{\faEnvelope}
\newcommand{\slowsymbol}{\faSpinner}
\newcommand{\hotymbol}{\faThermometer}
\newcommand{\wetsymbol}{\faShower}
\newcommand{\insectssymbol}{\faBug}
\newcommand{\cemsymbol}{\faFlask }


\newcommand{\printauth}[4]{\mbox{\textcolor{emphasis}{Created by #1} \hspace{0.5em} (\textcolor{accent}{#2}\hspace{0.5em}#3)\hspace{0.5em} \textcolor{emphasis}{#4}}}
\newcommand{\printadditions}[4]{\mbox{\textcolor{body}{Edited by #1} \hspace{0.5em} \textcolor{body}{(#2}\hspace{0.5em}#3)\hspace{0.5em} \textcolor{body}{on #4}}}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\made}[1]{\def\@made{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\logo}[2]{\def\@logo{#2}\def\@logodiameter{#1}}

\newcommand{\madeby}[3]{\printauth{#1}{\mailsymbol}{#2}{#3}}
\newcommand{\addedto}[3]{\printadditions{#1}{\mailsymbol}{#2}{#3}}

\newcommand{\purpose}[1]{\def\@purpose{#1}}

\newcommand{\docinfo}[1]{\def\@docinfo{#1}}

\newcommand{\makeheader}{%
  \begingroup
    \ifdef{\@logodiameter}{\begin{minipage}{\dimexpr\linewidth-\@logodiameter}}{}%
    \raggedright\color{emphasis}%
    {\Huge\bfseries\MakeUppercase{\@name}\par}
    \medskip
    {\large\bfseries\color{accent}\@tagline\par}
    \medskip
    {\footnotesize\bfseries\@docinfo\par}
    \mbox{\tiny\textcolor{emphasis}{Last edit \today}}
    \end{minipage}\hfill%
    \ifdef{\@logodiameter}{%
    \begin{minipage}{\@logodiameter}
      \includegraphics[width=\linewidth]{\@logo}
     \vspace{0.5cm}
    \vfill%
%    \textcolor{heading}{Difference-in-differences:} \\ \footnotesize\textcolor{emphasis}{\@purpose}
    \vspace{2em}
    \end{minipage}\par}{}%
  \endgroup\medskip
}

\renewenvironment{quote}{\color{accent}\itshape\large}{\par}

\newcommand{\need}[2][]{%
  \bigskip%
	\medskip
  \ifstrequal{#1}{}{}{\marginpar{\vspace*{\dimexpr1pt-\baselineskip}\raggedright\input{#1}}}%
  {\color{heading}\LARGE\bfseries\MakeUppercase{#2}}\\[-1ex]%
  {\color{heading}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\protosubsection}[1]{%
  \smallskip%
  {\color{emphasis}\large\bfseries{#1}\par}\medskip
}

\newcommand{\step}[3]{%
  \color{emphasis}{Step }
  {\large\color{emphasis}#1}
  \hspace{18em}
 \color{emphasis}{\footnotesize  \par}
  \smallskip
  \textbf{\color{accent}{#2} }\par
  \smallskip
}

\newcommand{\req}[3]{%
  \color{emphasis}{Requirement }
  {\large\color{emphasis}#1}
  \hspace{18em}
 \color{emphasis}{\footnotesize  \par}
  \smallskip
  \textbf{\color{accent}{#2} }\par
  \smallskip
}
\newcommand{\warningsigns}[3]{%
  \begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
  \multirow{2}{*}{\Large\color{accent}#1} & \bfseries\textcolor{emphasis}{#2}\\
  & #3
  \end{tabularx}%
  \smallskip
}

\newcommand{\itemtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=body!30,rounded corners,inner xsep=1ex,inner ysep =0.75ex,text height=1.5ex,text depth=.25ex]{#1};
}

\newcommand{\risk}[2]{%
\textcolor{emphasis}{\textbf{#1}}\hfill
\foreach \x in {1,...,5}{%
  \space{\ifnumgreater{\x}{#2}{\color{body!30}}{\color{accent}}\faCircle}}\par%
}


\newcommand{\protoref}[3]{%
  \smallskip
  \textcolor{emphasis}{\textbf{#1}}\par
  \begin{description}[font=\color{accent},style=multiline,leftmargin=1.25em]
  \item[\slowsymbol] #2
  \item[\small\slowsymbol] #3
  \end{description}
%   \medskip
}

\newenvironment{protocolumn}[1]{\begin{minipage}[t]{#1}\raggedright}{\end{minipage}}

\RequirePackage[backend=biber,style=authoryear,sorting=ydnt]{biblatex}
%% For removing numbering entirely when using a numeric style
\setlength{\bibhang}{1em}
\DeclareFieldFormat{labelnumberwidth}{\makebox[\bibhang][l]{\itemmarker}}
\setlength{\biblabelsep}{0pt}
\defbibheading{pubtype}{\protosubsection{#1}}
\renewcommand{\bibsetup}{\vspace*{-\baselineskip}}
\AtEveryBibitem{\makebox[\bibhang][l]{\itemmarker}}
\setlength{\bibitemsep}{0.25\baselineskip}

% v1.1.2: make it easier to add a sidebar aligned with top of next page
\RequirePackage{afterpage}
\newcommand{\addsidebar}[2][]{\marginpar{%
  \ifstrequal{#1}{}{}{\vspace*{#1}}%
  \input{#2}}%
}
\newcommand{\addnextpagesidebar}[2][]{\afterpage{\addsidebar[#1]{#2}}}

\AtBeginDocument{%
  \pagestyle{empty}
  \color{body}
  \raggedright
}