%% This program is  free software; you can redistribute  it and/or modify
%% it under the  terms of the GNU General Public  License as published by
%% the Free Software Foundation; either  version 2 of the License, or (at
%% your option) any later version.

%% This program  is distributed in the  hope that it will  be useful, but
%% WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
%% MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU
%% General Public License for more details.

%% This is file `FCEFyN-class.cls', the class file for publications
%% in the "Revista de la Facultad de Ciencias Exactas, Físicas y Naturales
%% de la Universidad Nacional de Córdoba, Argentina,
%% https://revistas.unc.edu.ar/index.php/FCEFyN.
%% This file was originally written by Gustavo J. Krause.
%% First revision: 2018-07-17
%% Second revision: 2018-07-26 by Mariano Lizarraga (minor modifications)
%%
%% History:
%%           2018-07-20  First version by Gustavo Krause
%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FCEFyN-class}[2018/07/17 FCEFyN paper class]

% Declaraciones iniciales
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\newif\if@isblind\@isblindfalse
\DeclareOption{blind}{\@isblindtrue}
% Definiciones de idioma
\newif\iflang@esp
\newif\iflang@eng
\newif\iflang@por
\def\lang@mutopterr{%
    \PackageError{lang}{Options 'esp', 'eng' and 'por' are mutually exclusive.}{}%
}%
\DeclareOption{esp}{%
    \iflang@eng\lang@mutopterr\fi
    \iflang@por\lang@mutopterr\fi
    \lang@esptrue\lang@engfalse\lang@porfalse
}
\DeclareOption{eng}{%
    \iflang@esp\lang@mutopterr\fi
    \iflang@por\lang@mutopterr\fi
    \lang@espfalse\lang@engtrue\lang@porfalse
}
\DeclareOption{por}{%
    \iflang@esp\lang@mutopterr\fi
    \iflang@eng\lang@mutopterr\fi
    \lang@espfalse\lang@engfalse\lang@portrue
}

\ProcessOptions\relax
\LoadClass[twoside,a4paper,10pt,twocolumn,spanish]{article}

% Idioma por defecto: Español
\iflang@esp
\else
  \iflang@eng
  \else
    \iflang@por
    \else
      \lang@esptrue\lang@engfalse\lang@porfalse
    \fi
  \fi
\fi
        

% Cargar paquetes necesarios
\usepackage[utf8]{inputenc}
\iflang@esp
      \usepackage[spanish,es-tabla]{babel}
    \fi
    \iflang@eng
      \usepackage[english,spanish]{babel}
    \fi
    \iflang@por
      \usepackage[portuguese,spanish]{babel}
    \fi
\usepackage[T1]{fontenc}
\usepackage{ae,aecompl}
\usepackage{pslatex}
\usepackage[samesize]{cancel}
\usepackage{graphicx}
\usepackage{setspace}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{natbib}
\usepackage{float}
\usepackage{mathptmx} % Use the Adobe Times Roman as the default text font together with math symbols from the Sym­bol, Chancery and Com­puter Modern fonts
\usepackage{url}
\Urlmuskip=0mu plus 1mu % break url lines
\usepackage{calc}
\usepackage{tabto}
\usepackage{lettrine}

%%% Configuración de archivo PDF
\usepackage[     bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 colorlinks = true,
                 linkcolor = black,
                 urlcolor  = black,
                 citecolor = black,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}


% Configuración de página
\setlength{\hoffset}{-1in}
\setlength{\voffset}{-1in}
\setlength{\oddsidemargin}{2cm}
\setlength{\evensidemargin}{2cm}
\setlength{\topmargin}{0.7cm}
\setlength{\headheight}{1.2cm}
\setlength{\headsep}{0.4cm}
\setlength{\textheight}{25.7cm}
\setlength{\textwidth}{17.5cm}
\setlength{\footskip}{1.0cm}
\setlength{\columnsep}{0.5cm}


% Configuración para autores y afiliaciones
\usepackage[noblocks]{authblk}
\renewcommand\AB@affilsepx{\protect\par\protect\Affilfont}
\iflang@esp
  \renewcommand\Authands{ y }
\fi
\iflang@eng
  \renewcommand\Authands{ and }
\fi
\iflang@por
  \renewcommand\Authands{ e }
\fi
\renewcommand{\Affilfont}{\fontsize{9}{12} \selectfont \itshape}
\renewcommand{\Authfont}{\fontsize{12}{14} \selectfont}


% Declaración de macros
\def\thisvolume#1{\gdef\@thevolume{#1}}        % Volumen
\def\thisnumber#1{\gdef\@thenumber{#1}}         % Número
\def\thismonth#1{\gdef\@themonth{#1}}             % mes
\def\thisyear#1{\gdef\@theyear{#1}}             % Año
\def\receptiondate#1{\gdef\@receptiondate{#1}}       % Fecha de recepción del artículo
\def\acceptancedate#1{\gdef\@acceptancedate{#1}}     % Fecha de aceptación del artículo
\def\publicationdate#1{\gdef\@publicationdate{#1}}   % Fecha de publicación del artículo
\def\resumen#1{\gdef\@spanishabstract{#1}}         % Resumen en español
\def\palabrasclave#1{\gdef\@spanishkeywords{#1}}   % Palabras clave en español
\def\abstract#1{\gdef\@englishabstract{#1}}        % Resumen en inglés
\def\keywords#1{\gdef\@englishkeywords{#1}}        % Palabras clave en inglés


% Definiciones para datos de contacto
\def\contactauthor#1{\gdef\@thecontactauthor{#1}}
\def\email#1{\gdef\@theemail{#1}}
\def\mailingaddress#1{\gdef\@themailingaddress{#1}}
\def\phonenumber#1{\gdef\@thephonenumber{#1}}
\newcommand*{\contacto}{%
  \if@isblind
    \iflang@esp
      Versión para revisores.
    \fi
    \iflang@eng
      Version for reviewers.
    \fi
    \iflang@por
      Versão para revisores.
    \fi
  \else
    \iflang@esp
      \@thecontactauthor,
      \@themailingaddress,
      Tel: \@thephonenumber,
      \@theemail
    \fi
    \iflang@eng
      \@thecontactauthor,
      \@themailingaddress,
      Phone number: \@thephonenumber,
      \@theemail
    \fi
    \iflang@por
      \@thecontactauthor,
      \@themailingaddress,
      Tel: \@thephonenumber,
      \@theemail
    \fi
  \fi
}
\renewcommand*\footnoterule{}
\newcommand\blfootnote[1]{%
  \begingroup
  \renewcommand\thefootnote{}\footnote{#1}%
  \addtocounter{footnote}{-1}%
  \endgroup
}
\newcommand*{\printcontactdata}{%
  \blfootnote{\\ {\fontsize{8}{11} \selectfont
  \iflang@esp
    Datos de contacto:
  \fi
  \iflang@eng
    Contact data:
    \fi
  \iflang@por
    Dados de contato:
  \fi
  \contacto}}
}


% Definiciones para el encabezado
\def\title#1{\gdef\@title{#1}\gdef\thetitle{#1}}
\def\shorttitle#1{\gdef\@theshorttitle{#1}}
\def\firstauthor#1{\gdef\@thefirstauthor{#1}}
\newcommand*{\authorheader}{%
  \begingroup
  \ifnum\value{authors}<2 % Un solo autor
      \if@isblind
        \iflang@esp
          AUTOR
        \fi
        \iflang@eng
          AUTHOR
        \fi
        \iflang@por
          AUTOR
        \fi
      \else
        \MakeUppercase{\@thefirstauthor}
      \fi
    \else % 2 or more authors
      \if@isblind
        \iflang@esp
          1er. AUTOR~{\itshape et al.}
        \fi
        \iflang@eng
          1st. AUTHOR~{\itshape et al.}
        \fi
        \iflang@por
          1ro. AUTOR~{\itshape et al.}
        \fi
      \else
        {\MakeUppercase{\@thefirstauthor}~{\itshape et al.}}
      \fi
    \fi
  \endgroup
  }
\newcommand{\vcenteredinclude}[1]{\begingroup
\setbox0=\hbox{\includegraphics[height=\headheight]{#1}}%
\parbox{\wd0}{\box0}\endgroup}


% Configuración de epígrafes de figuras
\usepackage{caption}
\captionsetup[figure]{font=small,labelfont=bf,justification=centering}
\captionsetup[figure]{name=Fig.}
\DeclareCaptionFormat{myformat}{#1#2#3\rule{\linewidth}{.3pt}}
\captionsetup[figure]{format=myformat}

\captionsetup[table]{font={small,sc},labelfont={bf,sc},justification=centering}
\iflang@esp
  \captionsetup[table]{name=Tabla}
\fi
\iflang@eng
  \captionsetup[table]{name=Table}
\fi
\iflang@por
  \captionsetup[table]{name=Tabela}
\fi
\usepackage{makecell} % break lines in cell tables
\renewcommand\theadalign{cc}
\renewcommand\theadgape{\Gape[4pt]}
\renewcommand\cellgape{\Gape[4pt]}
\addtolength{\belowcaptionskip}{-8pt}
\addtolength{\abovecaptionskip}{0pt}


% Portada del trabajo del trabajo
\newcommand*\varhrulefill[1][0.4pt]{\leavevmode\leaders\hrule height#1\hfill\kern0pt}
\renewcommand{\@maketitle}{%
  \newpage
  \null
  \onecolumn
  \begingroup
    \vspace{0cm}%
    {\begin{center}%
      {\fontsize{20}{24} \selectfont \@title \par}%
     \vspace{0.6cm}%
     {\setlength{\tabcolsep}{0in}
     \if@isblind
       \iflang@esp
         {\fontsize{12}{14} \selectfont Versión para revisores.} \\
       \fi
       \iflang@eng
         {\fontsize{12}{14} \selectfont Version for reviewers.} \\
       \fi
       \iflang@por
         {\fontsize{12}{14} \selectfont Versão para revisores.} \\
       \fi
     \else        
        \begin{tabular}[c]{c}%
                {\@author}
        \end{tabular}
      \fi
      \vspace{0.1cm}
      {\setstretch{0.85}
      \iflang@esp
        {\fontsize{8}{10} \selectfont Fecha de recepción del manuscrito: \@receptiondate} \\
        {\fontsize{8}{10} \selectfont Fecha de aceptación del manuscrito: \@acceptancedate} \\
        {\fontsize{8}{10} \selectfont Fecha de publicación: \@publicationdate}
       \fi
       \iflang@eng
         {\fontsize{8}{10} \selectfont Reception date of the manuscript: \@receptiondate} \\
         {\fontsize{8}{10} \selectfont Acceptance date of the manuscript: \@acceptancedate} \\
         {\fontsize{8}{10} \selectfont Publication date: \@publicationdate}      
       \fi
       \iflang@por
         {\fontsize{8}{10} \selectfont Data de recebimento do manuscrito: \@receptiondate} \\
         {\fontsize{8}{10} \selectfont Data de aceitação do manuscrito: \@acceptancedate} \\
         {\fontsize{8}{10} \selectfont Data de publicação: \@publicationdate}
       \fi
     }}%
    \end{center}}% end of \parbox
    %\vspace{0.3cm}
    \noindent\varhrulefill[0.6mm] \par    
    \vspace{0.4cm}
      \iflang@esp
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Resumen}}---\@spanishabstract} \par
        \vspace{0.3cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Palabras clave}}---\@spanishkeywords} \par
        \vspace{0.5cm}
        \hrule
        \vspace{0.25mm}
        \hrule
        \vspace{0.5cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Abstract}}---\@englishabstract} \par
        \vspace{0.3cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Keywords}}---\@englishkeywords} \par
      \fi
      \iflang@eng
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Abstract}}---\@englishabstract} \par
        \vspace{0.3cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Keywords}}---\@englishkeywords} \par
        \vspace{0.5cm}
        \hrule
        \vspace{0.5cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Resumen}}---\@spanishabstract} \par
        \vspace{0.3cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Palabras clave}}---\@spanishkeywords} \par
      \fi
      \iflang@por
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Resumo}}---\@spanishabstract} \par
        \vspace{0.3cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Palavras chave}}---\@spanishkeywords} \par
        \vspace{0.5cm}
        \hrule
        \vspace{0.5cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Abstract}}---\@englishabstract} \par
        \vspace{0.3cm}
        \noindent {\fontsize{9}{12} \selectfont {\bfseries{Keywords}}---\@englishkeywords} \par
      \fi
    \vspace{0.2cm}
    \noindent\varhrulefill[0.6mm]
  \twocolumn
  \endgroup
  \vspace{0.5cm}
} % end of \@maketitle


%%% Configuración de encabezado y pie de páginas
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[LO]{{\fontsize{7}{10} \selectfont REVISTA FACULTAD DE CIENCIAS EXACTAS, FÍSICAS
                Y NATURALES, VOL.~\@thevolume, NO.~\@thenumber, \@themonth~\@theyear}}
\fancyhead[CO]{ }
\fancyhead[RO]{\vcenteredinclude{filesFCEFyN-class/FCEFyN_logo.pdf}}
\fancyhead[LE]{ }
\fancyhead[CE]{{\fontsize{7}{10} \selectfont \MakeUppercase{\@theshorttitle}}}
\fancyhead[RE]{{\fontsize{7}{10} \selectfont \authorheader}}
\fancyfoot[LO,LE]{ }
\fancyfoot[CO,CE]{ }
\fancyfoot[RO,RE]{{\fontsize{7}{10} \selectfont \thepage}}
   
   
% Configuración de formato de secciones
\setcounter{secnumdepth}{0}      % Deshabilitar numeración
\renewcommand{\section}{\@startsection{section}{1}{0mm}%
                                     {-12pt}%
                                     {6pt}%
                                     {\setlength\parindent{0em} \fontsize{12}{14} \selectfont \bfseries\textsc}}%
\renewcommand{\subsection}{\@startsection{subsection}{2}{0mm}%
                                     {-12pt}%
                                     {6pt}%
                                     {\setlength\parindent{0em} \fontsize{11}{13} \selectfont \bfseries\textit}}%
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{0mm}%
                                     {-12pt}%
                                     {6pt}%
                                     {\setlength\parindent{0em} \fontsize{11}{13} \selectfont \textit}}

 
% Configurar estilo de la bibliografía
\newcounter{iteminbib}
\addtocounter{iteminbib}{0}
\newlength{\bibmargin}
\setlength{\bibmargin}{20pt}
\TabPositions{\bibmargin}
\newcommand{\quotes}[1]{``#1''}
\newcommand{\insertbibliography}[1]{%
\setlength{\parindent}{0pt}
\setlength{\bibsep}{4pt}
\setlength\itemindent{0pt}
\setlength{\bibhang}{\bibmargin}
{\setstretch{0.85}
\fontsize{8}{10} \selectfont
\iflang@esp
  \bibliographystyle{filesFCEFyN-class/FCEFyN-refs-esp}
    \renewcommand\refname{Referencias}
\fi
\iflang@eng
  \bibliographystyle{filesFCEFyN-class/FCEFyN-refs-eng}
  \renewcommand\refname{References}  
\fi
\iflang@por
  \bibliographystyle{filesFCEFyN-class/FCEFyN-refs-por}
  \renewcommand\refname{Referências}  
\fi
\bibliography{#1}}
}

% Definiciones para letra capital
\newcommand{\primerapalabra}[2]{\lettrine[findent=2pt]{\textbf{#1}}{}#2 }


 
